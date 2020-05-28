#include "MUSDefines.cginc"
// Upgrade NOTE: excluded shader from OpenGL ES 2.0 because it uses non-square matrices
#pragma exclude_renderers gles

float linearstep(float j, float k, float x) {
	x = clamp((x - j) / (k - j), 0.0, 1.0); 
	return x;
}

float smootherstep(float edge0, float edge1, float x) {
    x = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
    return x * x * x * (x * (x * 6 - 15) + 10);    
}

float AverageRGB(float3 rgb){
    return (rgb.r + rgb.g + rgb.b)/3;
}

// Hue Shift
const static float EPS = 1e-10;
float3 RGBtoHCV(in float3 rgb) {
    float4 P = lerp(float4(rgb.bg, -1.0, 2.0/3.0), float4(rgb.gb, 0.0, -1.0/3.0), step(rgb.b, rgb.g));
    float4 Q = lerp(float4(P.xyw, rgb.r), float4(rgb.r, P.yzx), step(P.x, rgb.r));
    float C = Q.x - min(Q.w, Q.y);
    float H = abs((Q.w - Q.y) / (6 * C + EPS) + Q.z);
    return float3(H, C, Q.x);
}

float3 RGBtoHSL(in float3 rgb) {
    float3 HCV = RGBtoHCV(rgb);
    float L = HCV.z - HCV.y * 0.5;
    float S = HCV.y / (1 - abs(L * 2 - 1) + EPS);
    return float3(HCV.x, S, L);
}

float3 HSLtoRGB(float3 c) {
    c = float3(frac(c.x), clamp(c.yz, 0.0, 1.0));
    float3 rgb = clamp(abs(fmod(c.x * 6.0 + float3(0.0, 4.0, 2.0), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    return c.z + c.y * (rgb - 0.5) * (1.0 - abs(2.0 * c.z - 1.0));
}

float3 GetHSLFilter(float3 albedo){
    UNITY_BRANCH
    if (_AutoShift == 1)
        _Hue += frac(_Time.y*_AutoShiftSpeed);
    float3 shift = float3(_Hue, _SaturationHSL, _Luminance);
    float3 hsl = RGBtoHSL(albedo);
    float hslRange = step(_HSLMin, hsl) * step(hsl, _HSLMax);
    albedo = HSLtoRGB(hsl + shift * hslRange);
    return albedo;
}

float3 GetRGBFilter(float3 albedo){
    albedo.r *= _RAmt;
    albedo.g *= _GAmt;
    albedo.b *= _BAmt;
    albedo = clamp((lerp(float3(0.5,0.5,0.5), albedo, _Contrast)), 0, 10);
    albedo = lerp(dot(albedo.rgb, float3(0.3,0.59,0.11)), albedo, _SaturationRGB);
    albedo += albedo*_Brightness;
    return albedo;
}

lighting GetLightingStruct(){
    lighting o;
    o.NdotL = 0;
    o.lightCol = 0;
    o.indirectCol = 0;
    o.lightDir = 0;
    o.viewDir = 0;
    o.halfVector = 0;
    o.bumpMap = 0;
    o.detailNormal = 0;
    o.tangentNormals = 0;
    o.binormal = 0;
    o.normalDir = 0;
    o.reflectionDir = 0;
    return o;
}

float3 GetLightColor(float3 pc){
    float3 lightCol = _LightColor0;
    UNITY_BRANCH
    if (_RenderMode == 2)
        lightCol = saturate(lightCol + pc);
    else {
        if (!any(_WorldSpaceLightPos0))
            lightCol = pc * 0.2;
    }
    return lightCol;
}

float GetWorldBrightness(float3 ilc){
    float3 col = _LightColor0;
    if (!any(_WorldSpaceLightPos0))
        col = ilc;
    float b = saturate(AverageRGB(col));
    return b;
}

float GetDetailMask(float2 uv){
    float detailMask = UNITY_SAMPLE_TEX2D_SAMPLER(_DetailMask, _MainTex, uv).a;
    detailMask = saturate(detailMask);
    detailMask = lerp(1, detailMask, _DetailMaskStr);
    return detailMask;
}

float4 GetAlbedo(float2 uv0, float2 uv1){
    float4 albedo = UNITY_SAMPLE_TEX2D(_MainTex, uv0);
    albedo.rgb *= _Color.rgb;
    float detailMask = GetDetailMask(uv0);
    float3 detailAlbedo = UNITY_SAMPLE_TEX2D_SAMPLER(_DetailAlbedoMap, _MainTex, uv1).rgb * unity_ColorSpaceDouble;
    albedo.rgb = lerp(albedo.rgb, albedo.rgb*(detailAlbedo), detailMask);
    UNITY_BRANCH
    switch (_FilterModel){
        case 0: albedo.rgb = albedo.rgb; break;
        case 1: albedo.rgb = GetRGBFilter(albedo.rgb); break;
        case 2: albedo.rgb = GetHSLFilter(albedo.rgb); break;
        default: break;
    }
    #if defined(TRANSPARENT)
        albedo.a *= _Opacity;
    #endif
    return albedo;
}


// Diffuse for normal attenuation
float4 GetDiffuse(float4 albedo, float3 pc, float3 lc, float atten){
    float4 diffuse;
    diffuse.rgb = atten * lc + pc;
    diffuse.rgb *= albedo.rgb;
    diffuse.a = albedo.a;
    return diffuse;
}

// Diffuse for colored attenuation
float4 GetDiffuse(float4 albedo, float3 pc, float3 lc, float3 atten){
    float4 diffuse;
    diffuse.rgb = atten * lc + pc;
    diffuse.rgb *= albedo.rgb;
    diffuse.a = albedo.a;
    return diffuse;
}

float3 GetEmission(float4 uv){
    float3 emiss = UNITY_SAMPLE_TEX2D(_EmissionMap, uv.zw);
    emiss *= _EmissionColor.rgb;
    UNITY_BRANCH
    if (_UsingMask == 1)
        emiss.rgb *= UNITY_SAMPLE_TEX2D_SAMPLER(_EmissMask, _EmissionMap, TRANSFORM_TEX(uv.xy, _EmissMask));
    emiss *= smootherstep(-1, 1, sin(_Time.y * _PulseSpeed));
    return emiss;
}

float3 GetLREmission(float3 lc, float3 emiss){
    float brightness = saturate(AverageRGB(lc));
    float interpolator = 0;
    UNITY_BRANCH
    if (_CrossMode == 1 && _ReactToggle == 1){
        float2 threshold = saturate(float2(_ReactThresh-_Crossfade, _ReactThresh+_Crossfade));
        interpolator = smootherstep(threshold.x, threshold.y, brightness); 
    }
    else
        interpolator = brightness*_ReactToggle;
    return lerp(emiss, 0, interpolator);
}

float3 PreserveColor(float3 diff, float3 albedo, float3 ts, float3 refl, float SSS){
    float3 preserved = albedo + ts + refl + SSS;
    float3 diffuse = clamp(diff, 0, preserved);
    return diffuse;
}

float3 GetToonAttenuation(float ndl, float atten){
    #if defined(UNITY_PASS_FORWARDBASE)
        float nAtten = pow(1-atten, 5);
        atten = saturate(atten + (1-nAtten));
        ndl *= atten;
    #endif
    UNITY_BRANCH
    if (_EnableShadowRamp == 1){
        float rampUV = ndl * 0.5 + 0.5;
        float3 ta = tex2D(_ShadowRamp, float2(rampUV, rampUV)).rgb;
        return lerp(1, ta, _ShadowStr);
    }
    else {
        float ramp = lerp(50, 150, _RampWidth);
        float3 ta = saturate((ndl * ramp) / (ramp-49.999));
        return lerp(0.999, ta, _ShadowStr); 
    }
}

float3 GetToonSpec(float3 diff, float3 hv, float3 nd, float3 lc){
    float brightness = GetWorldBrightness(lc)*0.5;
    float minorAdjust = saturate(brightness*6);
    float3 sc = lerp(diff, _SpecCol.rgb, _SpecBias * brightness);
    float power = exp2(_SpecSize * minorAdjust * 20.0 + 1.0);
    float pied = (power + 10) / (10 * UNITY_PI);
    float3 ts = pow(max(0, dot(hv, nd)), power) * pied * sc * (_SpecStr * brightness);
    return ts;
}

float3 GetSSS(float3 lc, float3 pc, float3 nd, float3 vd, float3 hv, float3 atten, float ndl, float3 albedo, float2 uv){
    _SPen = 1-_SPen;
    ndl = smootherstep(_SPen-_SSharp, _SPen+_SSharp, ndl);
    atten = saturate(ndl * atten);
    float3 vLTLight = lc * nd;
    float fLTDot = saturate(dot(vd, -hv));
    float3 fLT = (fLTDot + pc) * UNITY_SAMPLE_TEX2D_SAMPLER(_TranslucencyMap, _MainTex, uv) * _SStrength * atten * _SColor;
    float3 finalSSS = lc * fLT * albedo;
    return finalSSS;
}

float3 GetLightDir(float3 wPos, float atten){
    #if defined(POINT) || defined(POINT_COOKIE) || defined(SPOT)
        float3 lightDir = _WorldSpaceLightPos0.xyz - wPos;
    #else
        float3 lightDir = _WorldSpaceLightPos0.xyz;
        lightDir *= atten * dot(float3(0.2125, 0.7154, 0.0721), _LightColor0);
        float3 probeDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
        lightDir = lightDir + probeDir;
    #endif
    return normalize(lightDir);
}



float3 BoxProjection(float3 dir, float3 pos, float4 cubePos, float3 boxMin, float3 boxMax){
    #if UNITY_SPECCUBE_BOX_PROJECTION
        UNITY_BRANCH
        if (cubePos.w > 0){
            float3 factors = ((dir > 0 ? boxMax : boxMin) - pos) / dir;
            float scalar = min(min(factors.x, factors.y), factors.z);
            dir = dir * scalar + (pos - cubePos);
        }
    #endif
    return dir;
}

float3 GetWorldReflections(float3 reflDir, float3 wPos, float roughness){
    reflDir = BoxProjection(reflDir, wPos, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
    float4 envSample0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
    float3 p0 = DecodeHDR(envSample0, unity_SpecCube0_HDR);
    float interpolator = unity_SpecCube0_BoxMin.w;
    UNITY_BRANCH
    if (interpolator < 0.99999){
        float3 refDirBlend = BoxProjection(reflDir, wPos, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
        float4 envSample1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, refDirBlend, roughness * UNITY_SPECCUBE_LOD_STEPS);
        float3 p1 = DecodeHDR(envSample1, unity_SpecCube1_HDR);
        p0 = lerp(p1, p0, interpolator);
    }
    return p0;
}

float3 GetStaticReflCol(float3 reflDir, float roughness, float3 lc){
    float3 p0 = texCUBElod(_ReflCube, float4(reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS));
    p0 *= saturate(AverageRGB(lc));
    return p0;
}

float3 GetStaticReflections(float3 reflDir, float3 wPos, float roughness, float3 lc){
    float3 p0 = 0;
    float3 wr = GetWorldReflections(reflDir, wPos, roughness);
    UNITY_BRANCH
    if (_ReflCubeFallback == 1){
        if (!any(wr)) 
            p0 = GetStaticReflCol(reflDir, roughness, lc);
        else p0 = wr;
    }
    else p0 = GetStaticReflCol(reflDir, roughness, lc);
    return p0;
}

float3 GetRim(float3 col, float3 vd, float3 nd, float2 uv){
    float rimDot = abs(dot(vd, nd));
    float rim = pow((1-rimDot), (1-_RimWidth) * 10);
    rim = smootherstep(_RimEdge, (1-_RimEdge), rim);
    float3 rimMask = tex2D(_RimMask, TRANSFORM_TEX(uv, _RimMask)).rgb;
    float mask = AverageRGB(rimMask);
    rim = lerp(rim, rim*mask, _RimMaskStr);
    float3 rimCol = tex2D(_RimTex, TRANSFORM_TEX(uv, _RimTex)).rgb * _RimCol.rgb;
    float3 diff = lerp(col, rimCol, (rim*_RimStrength));
    return diff;
}

float4 GetSpecularWorkflow(float2 uv, float albedoAlpha){
    float4 spec = 0;
    #if defined(_SPECGLOSSMAP)
        UNITY_BRANCH
        if (_SourceAlpha == 1){
            spec.rgb = tex2D(_SpecGlossMap, uv).rgb;
            spec.a = albedoAlpha;
        }
        else 
            spec = tex2D(_SpecGlossMap, uv);
        spec.a *= _GlossMapScale;
    #else
        spec.rgb = _PBRSpecCol.rgb;
        UNITY_BRANCH
        if (_SourceAlpha == 1)
            spec.a = albedoAlpha * _GlossMapScale;
        else
            spec.a = _Glossiness;
    #endif
    return spec;
}

float3 GetMetallicWorkflow(float2 uv){
    float metallic = tex2D(_MetallicGlossMap, uv) * _Metallic;
    float roughness = tex2D(_SpecGlossMap, uv);
    if (_InvertRough == 1)
        roughness = 1-roughness;
    roughness *= _Glossiness;
    float smoothness = 1-roughness;
    roughness *= 1.7-0.7*roughness;
    return float3(metallic, roughness, smoothness);
}