
#include "UnityPBSLighting.cginc"
#include "Autolight.cginc"
#include "UnityCG.cginc"
#include "MUSFunctions.cginc"

#if defined (UNITY_PASS_FORWARDBASE)

v2g vert (appdata v) {
    v2g o;
    UNITY_INITIALIZE_OUTPUT(v2g, o);
    UNITY_BRANCH
    if (_ShatterToggle == 1)
        o.pos = mul(unity_ObjectToWorld, v.vertex);
    else
        o.pos = UnityObjectToClipPos(v.vertex);
    o.vertex = v.vertex;
    o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);
    o.uv.zw = TRANSFORM_TEX(v.uv, _EmissionMap);
    o.uv.z += (_Time.y*_XScroll);
    o.uv.w += (_Time.y*_YScroll);
    #if UNITY_SINGLE_PASS_STEREO
        o.cameraPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1])*0.5;
    #else
        o.cameraPos = _WorldSpaceCameraPos;
    #endif
    o.normal = v.normal;
    float3 o2wn = UnityObjectToWorldNormal(v.normal);
    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
    o.tangent = float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
    o.binormal = cross(o2wn, o.tangent.xyz) * (v.tangent.w * unity_WorldTransformParams.w);
    o.uvd = TRANSFORM_TEX(v.uv, _DetailAlbedoMap);
    v.tangent.xyz = normalize(v.tangent.xyz);
    v.normal = normalize(v.normal);
    float3x3 objectToTangent = float3x3(v.tangent.xyz, (cross(v.normal, v.tangent.xyz) * v.tangent.w), v.normal);
    o.tangentViewDir = mul(objectToTangent, ObjSpaceViewDir(v.vertex));
    TRANSFER_SHADOW(o);
    UNITY_TRANSFER_FOG(o, o.pos);
    return o;
}

[maxvertexcount(6)]
void geom(triangle v2g i[3], inout TriangleStream<g2f> tristream){
    g2f o;

    o.WFAmt = 0;
    static const float4 coords[3] = {
        float4(1,0,0,0),
        float4(0,1,0,0),
        float4(0,0,1,0)
    };

    float3 edgeA = i[1].pos - i[0].pos;
    float3 edgeB = i[2].pos - i[0].pos;
    float3 c = cross(edgeA, edgeB); 
    float3 normalDir = normalize(c);
    o.isOutline = false;

    [unroll(3)]
    for (uint k = 0; k < 3; k++){
        o.pos = i[k].pos;
        o.bCoords = 0;
        UNITY_BRANCH
        if (_ShatterToggle == 1){
            float dist = distance(i[k].pos, i[k].cameraPos);
            if(dist < _ShatterCull)
                return;
            float shatterAmt = smootherstep(_ShatterMax, _ShatterMin, dist)*_ShatterSpread;
            if (shatterAmt > 0)
                o.WFAmt = smootherstep(0,1,shatterAmt*50);
            i[k].pos.xyz += shatterAmt*normalDir;
            o.bCoords = coords[k].xyz;
            o.pos = UnityWorldToClipPos(i[k].pos);
        }
        o.uv = i[k].uv;
        o.cameraPos = i[k].cameraPos;
        o.worldPos = i[k].worldPos;
        o.normal = UnityObjectToWorldNormal(i[k].normal);
        o.tangent = i[k].tangent;
        o.binormal = i[k].binormal;
        o.uvd = i[k].uvd;
        o.tangentViewDir = i[k].tangentViewDir; 
        o.color = float4(1,1,1,1);
        #if defined(SHADOWS_SCREEN) || (defined(SHADOWS_DEPTH) && defined(SPOT)) || defined(SHADOWS_CUBE)
            o._ShadowCoord = i[k]._ShadowCoord;
        #endif
        UNITY_TRANSFER_FOG(o, o.pos);
        tristream.Append(o);
    }   
    tristream.RestartStrip();
    
    UNITY_BRANCH
    if (_Outline == 0 && _CullingMode == 1)
        return;
    
    o.isOutline = true;
    [unroll(3)]
    for (int l = 2; l >= 0; l--){

        float3 toClip = i[l].vertex;

        UNITY_BRANCH
        if (_Outline >= 1)
            toClip = i[l].vertex.xyz + (i[l].normal * (_OutlineThicc * 0.01));

        UNITY_BRANCH
        if (_ShatterToggle == 1){
            float dist = distance(i[l].pos, i[l].cameraPos);
            if(dist < _ShatterCull)
                return;
            float shatterAmt = smootherstep(_ShatterMax, _ShatterMin, dist)*_ShatterSpread;
            if (shatterAmt > 0)
                o.WFAmt = smootherstep(0,1,shatterAmt*50);
            toClip += shatterAmt*normalDir;
            o.bCoords = coords[l].xyz;
        }
        else
            o.bCoords = 0;
        o.pos = UnityObjectToClipPos(toClip);
        o.uv = i[l].uv;
        o.cameraPos = i[l].cameraPos;
        o.normal = UnityObjectToWorldNormal(i[l].normal);
        o.worldPos = i[l].worldPos;
        o.tangent = i[l].tangent;
        o.binormal = i[l].binormal;
        o.uvd = i[l].uvd;
        o.tangentViewDir = i[l].tangentViewDir; 
        o.color = float4(_OutlineCol.rgb, 1);
        #if defined(SHADOWS_SCREEN) || (defined(SHADOWS_DEPTH) && defined(SPOT)) || defined(SHADOWS_CUBE)
            o._ShadowCoord = i[l]._ShadowCoord;
        #endif
        UNITY_TRANSFER_FOG(o, o.pos);
        tristream.Append(o);
    }
    tristream.RestartStrip();
}

float4 frag (g2f i) : SV_Target {
    // Parallax mapping
    #if defined(_PARALLAXMAP)
        i.tangentViewDir = normalize(i.tangentViewDir);
        i.tangentViewDir.xy /= (i.tangentViewDir.z + 0.42);
        float2 uvOffset = 0;
        UNITY_BRANCH
        if (_March == 1){
            float stepSize = 0.1;
            float2 uvDelta = i.tangentViewDir.xy * (stepSize * _Parallax);
            float stepHeight = 1;
            float surfaceHeight = tex2D(_ParallaxMap, i.uv.xy);
            float2 prevUVOffset = uvOffset;
            float prevStepHeight = stepHeight;
            float prevSurfaceHeight = surfaceHeight;

            [unroll(10)]
            for (int j = 1; j < 10 && stepHeight > surfaceHeight; j++){
                prevUVOffset = uvOffset;
                prevStepHeight = stepHeight;
                prevSurfaceHeight = surfaceHeight;
                uvOffset -= uvDelta;
                stepHeight -= stepSize;
                surfaceHeight = tex2D(_ParallaxMap, i.uv.xy+uvOffset);
            }

            surfaceHeight = clamp((lerp(0.5, surfaceHeight, _HeightContrast)), 0, 10);
            float prevDifference = prevStepHeight - prevSurfaceHeight;
            float difference = surfaceHeight - stepHeight;
            float t = prevDifference / (prevDifference + difference);
            uvOffset = prevUVOffset - uvDelta * t;
        }
        else {
            float height = tex2D(_ParallaxMap, i.uv.xy);
            height = clamp((lerp(0.5, height, _HeightContrast)), 0, 10);
            height -= 0.5;
            height *= _Parallax;
            uvOffset = i.tangentViewDir.xy * height;
        }
        i.normal.xy += uvOffset;
        i.uv.xy += uvOffset;
        i.uv.zw += uvOffset;
        #if defined(_DETAIL_MULX2)
            i.uvd += uvOffset * (_DetailNormalMap_ST.xy / _MainTex_ST.xy);
        #endif
    #endif

    // Initial color
    float4 albedo = GetAlbedo(i.uv.xy, i.uvd);
    float3 emiss = GetEmission(i.uv);
    float4 diffuse = albedo;

    // Light Color
    UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos);
    lighting o = GetLightingStruct();
    o.indirectCol = ShadeSH9(float4(0,0,0,1));
    o.lightCol = GetLightColor(o.indirectCol);
    float3 lightColor = saturate(o.lightCol + o.indirectCol);
    UNITY_BRANCH
    if (_RenderMode == 0){
        diffuse = GetDiffuse(albedo, o.indirectCol, o.lightCol, 1);
        UNITY_BRANCH
        if (_PreserveCol == 1)
            diffuse.rgb = PreserveColor(diffuse.rgb, albedo.rgb, 0, 0, 0);
    }
    
    // Shading Calculations
    UNITY_BRANCH
    if (_RenderMode == 1 || _RenderMode == 2){
        o.lightDir = GetLightDir(i.worldPos, atten);
        o.viewDir = normalize(_WorldSpaceCameraPos.xyz - i.worldPos);
        o.halfVector = normalize(o.lightDir + o.viewDir);
        o.bumpMap = UnpackScaleNormal(tex2D(_BumpMap, i.uv.xy), _BumpScale);
        #if defined(_DETAIL_MULX2)
            o.detailNormal = UnpackScaleNormal(tex2D(_DetailNormalMap, i.uvd), _DetailNormalMapScale * GetDetailMask(i.uv.xy));
            o.tangentNormals = BlendNormals(o.bumpMap, o.detailNormal);
        #else
            o.tangentNormals = normalize(o.bumpMap);
        #endif
        o.binormal = i.binormal;
        o.normalDir = normalize((o.tangentNormals.x * i.tangent) + (o.tangentNormals.y * o.binormal) + (o.tangentNormals.z * i.normal));
        o.reflectionDir = reflect(-o.viewDir, o.normalDir);
        o.NdotL = DotClamped(o.normalDir, o.lightDir);
    }

    // Toon Shading
    UNITY_BRANCH
    if (_RenderMode == 1){
        float3 SSS = 0;
        UNITY_BRANCH
        if (_Subsurface == 1)
            SSS = GetSSS(o.lightCol, o.indirectCol, o.normalDir, o.viewDir, o.halfVector, atten, o.NdotL, albedo.rgb, i.uv); 

        float3 reflections = 0;
        UNITY_BRANCH
        if (_Reflections == 1)
            reflections = GetWorldReflections(o.reflectionDir, i.worldPos, 1-_ReflSmooth)*0.1;

        float3 toonSpec = 0;
        UNITY_BRANCH
        if (_FakeSpec == 1 && o.NdotL > 0)
            toonSpec = GetToonSpec(albedo.rgb, o.halfVector, o.normalDir, o.indirectCol) * atten;

        float ao = lerp(1, tex2D(_OcclusionMap, i.uv.xy).g, _OcclusionStrength);
        float mask = UNITY_SAMPLE_TEX2D_SAMPLER(_LightMask, _MainTex, i.uv.xy);
        reflections *= mask;
        reflections *= ao;
        toonSpec *= mask;
        toonSpec *= ao;
        o.lightCol *= ao;
        
        float3 toonAtten = GetToonAttenuation(o.NdotL, atten);
        diffuse = GetDiffuse(albedo, o.indirectCol, o.lightCol, toonAtten);
        diffuse.rgb = GetRim(diffuse.rgb, o.viewDir, o.normalDir, i.uv.xy);
        diffuse.rgb += reflections;
        diffuse.rgb += toonSpec;
        diffuse.rgb += SSS;
        UNITY_BRANCH
        if (_PreserveCol == 1)
            diffuse.rgb = PreserveColor(diffuse.rgb, albedo.rgb, toonSpec, reflections, SSS);
    }

    // PBR Shading
    UNITY_BRANCH
    if (_RenderMode == 2){
        lightColor = o.lightCol * atten;
        albedo.rgb = GetRim(albedo.rgb, o.viewDir, o.normalDir, i.uv.xy);
        float ao = lerp(1, tex2D(_OcclusionMap, i.uv.xy).g, _OcclusionStrength);
        float3 MRS = 0;
        float4 spec = 0;

        UNITY_BRANCH
        switch (_PBRWorkflow){
            case 0: MRS = GetMetallicWorkflow(i.uv.xy); break;
            case 1: spec = GetSpecularWorkflow(i.uv.xy, albedo.a); MRS = float3(0, 1-spec.a, spec.a); break;
            default: break;
        }

        // Direct Lighting
        UnityLight light;
        light.color = o.lightCol * atten;
        light.dir = o.lightDir;

        // Indirect Lighting
        UnityIndirect indirectLight;
        indirectLight.diffuse = max(0, ShadeSH9(float4(o.normalDir,1))) * ao;
        float3 reflections = 0; 
        UNITY_BRANCH
        switch (_UseReflCube){
            case 0: reflections = GetWorldReflections(o.reflectionDir, i.worldPos.xyz, MRS.y); break;
            case 1: reflections = GetStaticReflections(o.reflectionDir, i.worldPos.xyz, MRS.y, o.lightCol); break;
            default: break;
        }
        indirectLight.specular = reflections * ao;

        // BRDF Time
        UNITY_BRANCH
        switch (_PBRWorkflow){
            case 0: 
                albedo.rgb = DiffuseAndSpecularFromMetallic(albedo, MRS.x, specularTint, omr);
                diffuse = UNITY_BRDF_PBS(albedo, specularTint.rgb, omr, MRS.z, o.normalDir, o.viewDir, light, indirectLight);
                break;
            case 1: 
                albedo.rgb = EnergyConservationBetweenDiffuseAndSpecular(albedo, spec, omr);
                diffuse = UNITY_BRDF_PBS(albedo, spec.rgb, omr, MRS.z, o.normalDir, o.viewDir, light, indirectLight);
                break;
            default: break;
        }
        #if defined(TRANSPARENT)
            diffuse.a = albedo.a;
        #endif
        #if defined(CUTOUT)
            clip(albedo.a - _Cutoff);
        #endif
    }

    // Apply Emission
    diffuse.rgb += GetLREmission(lightColor, emiss);
    
    // Apply Outline
    UNITY_BRANCH
    if (i.isOutline){
        if (_Outline == 1)
            diffuse.rgb = i.color.rgb;
        if (_Outline == 2)
            diffuse.rgb *= i.color.rgb;
    }

    // Shatter Culling Wireframe
    UNITY_BRANCH
    if (_ShatterToggle == 1){
        float3 deltas = fwidth(i.bCoords);
        float3 smoothing = deltas * _WFSmoothing;
        float3 thickness = deltas * _WFThickness;
        i.bCoords = smootherstep(thickness, thickness+smoothing, i.bCoords);
        float minBary = min(i.bCoords.x, min(i.bCoords.y, i.bCoords.z));
        float4 wfCol = lerp(_WFColor, diffuse, minBary);
        diffuse.rgb = lerp(diffuse.rgb, wfCol, i.WFAmt);
        diffuse.rgb = lerp(diffuse.rgb, _WFColor, i.WFAmt*_WFFill);
    }
    
    #if defined(CUTOUT)
        UNITY_BRANCH
        if (_ATM != 1)
            clip(diffuse.a - _Cutoff);
    #endif
    UNITY_APPLY_FOG(i.fogCoord, diffuse);
    return diffuse;
}
#endif

#if defined(UNITY_PASS_FORWARDADD)

v2f vert (appdata v) {
    v2f o;
    o.pos = UnityObjectToClipPos(v.vertex);
    o.uv = TRANSFORM_TEX(v.uv, _MainTex);
    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
    o.normal = UnityObjectToWorldNormal(v.normal);
    o.tangent = float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
    o.binormal = cross(o.normal, o.tangent.xyz) * (v.tangent.w * unity_WorldTransformParams.w);
    o.uvd = TRANSFORM_TEX(v.uv, _DetailAlbedoMap);
    v.tangent.xyz = normalize(v.tangent.xyz);
    v.normal = normalize(v.normal);
    float3x3 objectToTangent = float3x3(v.tangent.xyz, (cross(v.normal, v.tangent.xyz) * v.tangent.w), v.normal);
    o.tangentViewDir = mul(objectToTangent, ObjSpaceViewDir(v.vertex));
    TRANSFER_SHADOW(o);
    UNITY_TRANSFER_FOG(o, o.pos);
    return o;
}

float4 frag (v2f i) : SV_Target {
    if (_ShatterToggle == 1){
        #if UNITY_SINGLE_PASS_STEREO
            float3 cameraPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1])*0.5;
        #else
            float3 cameraPos = _WorldSpaceCameraPos;
        #endif
        float dist = distance(i.worldPos, cameraPos);
        if(dist < _ShatterMax)
            clip(-1);
    }
    #if defined(_PARALLAXMAP)
        i.tangentViewDir = normalize(i.tangentViewDir);
        i.tangentViewDir.xy /= (i.tangentViewDir.z + 0.42);
        float2 uvOffset = 0;
        UNITY_BRANCH
        if (_March == 1){
            float stepSize = 0.1;
            float2 uvDelta = i.tangentViewDir.xy * (stepSize * _Parallax);
            float stepHeight = 1;
            float surfaceHeight = tex2D(_ParallaxMap, i.uv.xy);
            float2 prevUVOffset = uvOffset;
            float prevStepHeight = stepHeight;
            float prevSurfaceHeight = surfaceHeight;

            [unroll(10)]
            for (int j = 1; j < 10 && stepHeight > surfaceHeight; j++){
                prevUVOffset = uvOffset;
                prevStepHeight = stepHeight;
                prevSurfaceHeight = surfaceHeight;
                uvOffset -= uvDelta;
                stepHeight -= stepSize;
                surfaceHeight = tex2D(_ParallaxMap, i.uv.xy+uvOffset);
            }

            surfaceHeight = clamp((lerp(0.5, surfaceHeight, _HeightContrast)), 0, 10);
            float prevDifference = prevStepHeight - prevSurfaceHeight;
            float difference = surfaceHeight - stepHeight;
            float t = prevDifference / (prevDifference + difference);
            uvOffset = prevUVOffset - uvDelta * t;
        }
        else {
            float height = tex2D(_ParallaxMap, i.uv.xy);
            height = clamp((lerp(0.5, height, _HeightContrast)), 0, 10);
            height -= 0.5;
            height *= _Parallax;
            uvOffset = i.tangentViewDir.xy * height;
        }
        i.uv.xy += uvOffset;
        #if defined(_DETAIL_MULX2)
            i.uvd += uvOffset * (_DetailNormalMap_ST.xy / _MainTex_ST.xy);
        #endif
    #endif

    // Initial Color
    float4 albedo = GetAlbedo(i.uv.xy, i.uvd);
    float4 diffuse = albedo;

    lighting o = GetLightingStruct();
    UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos);
    o.lightCol = _LightColor0 * atten;
    UNITY_BRANCH
    if (_RenderMode == 0)
        diffuse = GetDiffuse(albedo, 0, o.lightCol, atten);

    UNITY_BRANCH
    if (_RenderMode == 1 || _RenderMode == 2){
        o.lightDir = GetLightDir(i.worldPos, atten);
        o.viewDir = normalize(_WorldSpaceCameraPos.xyz - i.worldPos);
        o.halfVector = normalize(o.lightDir + o.viewDir);
        o.bumpMap = UnpackScaleNormal(tex2D(_BumpMap, i.uv.xy), _BumpScale);
        #if defined(_DETAIL_MULX2)
            o.detailNormal = UnpackScaleNormal(tex2D(_DetailNormalMap, i.uvd), _DetailNormalMapScale * GetDetailMask(i.uv.xy));
            o.tangentNormals = BlendNormals(o.bumpMap, o.detailNormal);
        #else
            o.tangentNormals = normalize(o.bumpMap);
        #endif
        o.binormal = i.binormal;
        o.normalDir = normalize((o.tangentNormals.x * i.tangent) + (o.tangentNormals.y * o.binormal) + (o.tangentNormals.z * i.normal));
        o.reflectionDir = reflect(-o.viewDir, o.normalDir);
        o.NdotL = DotClamped(o.normalDir, o.lightDir);
    }

    // Toon Shading
    UNITY_BRANCH
    if (_RenderMode == 1){
        float3 SSS = 0;
        UNITY_BRANCH
        if (_Subsurface == 1)
            SSS = GetSSS(o.lightCol, 0, o.normalDir, o.viewDir, o.halfVector, atten, o.NdotL, albedo.rgb, i.uv); 

        float3 toonSpec = 0;
        UNITY_BRANCH
        if (_FakeSpec == 1 && o.NdotL > 0)
            toonSpec = GetToonSpec(albedo.rgb, o.halfVector, o.normalDir, o.lightCol) * atten;

        float ao = lerp(1, tex2D(_OcclusionMap, i.uv).g, _OcclusionStrength);
        float mask = UNITY_SAMPLE_TEX2D_SAMPLER(_LightMask, _MainTex, i.uv.xy);
        toonSpec *= mask;
        toonSpec *= ao;
        o.lightCol *= ao;

        float3 toonAtten = GetToonAttenuation(o.NdotL, atten);
        diffuse = GetDiffuse(albedo, 0, o.lightCol, toonAtten);
        diffuse.rgb = GetRim(diffuse.rgb, o.viewDir, o.normalDir, i.uv.xy);
        diffuse.rgb += toonSpec;
        diffuse.rgb += SSS;
    }

    // PBR Shading
    UNITY_BRANCH
    if (_RenderMode == 2){
        albedo.rgb = GetRim(albedo.rgb, o.viewDir, o.normalDir, i.uv.xy);
        float ao = lerp(1, tex2D(_OcclusionMap, i.uv.xy).g, _OcclusionStrength);
        float3 MRS = 0;
        float4 spec = 0;

        UNITY_BRANCH
        switch (_PBRWorkflow){
            case 0: MRS = GetMetallicWorkflow(i.uv.xy); break;
            case 1: spec = GetSpecularWorkflow(i.uv.xy, albedo.a); MRS = float3(0, 1-spec.a, spec.a); break;
            default: break;
        }
        
        // Direct Lighting
        UnityLight light;
        light.color = o.lightCol;
        light.dir = o.lightDir;

        // Indirect Lighting
        UnityIndirect indirectLight;
        indirectLight.diffuse = max(0, ShadeSH9(float4(o.normalDir,1))) * ao;
        indirectLight.specular = 0;

        // BRDF Time
        UNITY_BRANCH
        switch (_PBRWorkflow){
            case 0:
                albedo.rgb = DiffuseAndSpecularFromMetallic(albedo, MRS.x, specularTint, omr);
                diffuse = UNITY_BRDF_PBS(albedo, specularTint.rgb, omr, MRS.z, o.normalDir, o.viewDir, light, indirectLight);
                break;
            case 1:            
                albedo.rgb = EnergyConservationBetweenDiffuseAndSpecular(albedo, spec, omr);
                diffuse = UNITY_BRDF_PBS(albedo, spec.rgb, omr, MRS.z, o.normalDir, o.viewDir, light, indirectLight);
                break;
            default: break;
        }
        #if defined(TRANSPARENT)
            diffuse.a = albedo.a;
        #endif
        #if defined(CUTOUT)
            clip(albedo.a - _Cutoff);
        #endif
    }

    UNITY_BRANCH
    if (_RenderMode == 0)
        diffuse.rgb *= o.lightCol;

    #if defined(CUTOUT)
        UNITY_BRANCH
        if (_ATM != 1)
            clip(diffuse.a - _Cutoff);
    #endif
    UNITY_APPLY_FOG(i.fogCoord, diffuse);
    return diffuse;
}
#endif