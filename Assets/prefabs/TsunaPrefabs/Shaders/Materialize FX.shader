// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32414,y:33591,varname:node_2865,prsc:2|diff-669-OUT,spec-9882-OUT,gloss-2091-OUT,emission-4782-OUT,clip-9177-OUT;n:type:ShaderForge.SFN_Tex2d,id:7736,x:31816,y:33804,ptovrint:True,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:358,x:31791,y:34030,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:_Metallic,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1813,x:31816,y:34239,ptovrint:False,ptlb:Glossiness,ptin:_Glossiness,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_If,id:9177,x:31170,y:33591,cmnt:End of Fade In,varname:node_9177,prsc:2|A-7979-OUT,B-9028-OUT,GT-7402-OUT,EQ-5843-OUT,LT-5843-OUT;n:type:ShaderForge.SFN_Multiply,id:6296,x:30008,y:33581,varname:node_6296,prsc:2|A-7979-OUT,B-5244-OUT;n:type:ShaderForge.SFN_Sin,id:8201,x:30172,y:33581,varname:node_8201,prsc:2|IN-6296-OUT;n:type:ShaderForge.SFN_RemapRange,id:8783,x:30340,y:33581,varname:node_8783,prsc:2,frmn:-1,frmx:1,tomn:3,tomx:0|IN-8201-OUT;n:type:ShaderForge.SFN_Tex2d,id:2770,x:30937,y:33766,ptovrint:False,ptlb:Summon Color,ptin:_SummonColor,varname:_Phase,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Desaturate,id:1073,x:30531,y:33728,varname:node_1073,prsc:2|COL-9536-OUT;n:type:ShaderForge.SFN_Step,id:5843,x:30531,y:33581,varname:node_5843,prsc:2|A-8783-OUT,B-1073-OUT;n:type:ShaderForge.SFN_Tex2d,id:9814,x:31860,y:34402,ptovrint:False,ptlb:EmissionMap,ptin:_EmissionMap,varname:_Emission,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:438,x:30348,y:34404,varname:node_438,prsc:2|A-7979-OUT,B-2757-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2757,x:29454,y:34431,ptovrint:False,ptlb:Emissive Speed,ptin:_EmissiveSpeed,varname:_GlowSpeed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.4;n:type:ShaderForge.SFN_Sin,id:6268,x:30553,y:34404,varname:node_6268,prsc:2|IN-438-OUT;n:type:ShaderForge.SFN_RemapRange,id:1770,x:30744,y:34404,varname:node_1770,prsc:2,frmn:-1,frmx:1,tomn:1,tomx:10|IN-6268-OUT;n:type:ShaderForge.SFN_Multiply,id:8468,x:30948,y:34404,cmnt:Summmon Emissive,varname:node_8468,prsc:2|A-2770-RGB,B-1770-OUT;n:type:ShaderForge.SFN_Multiply,id:3155,x:32054,y:34478,varname:node_3155,prsc:2|A-9814-RGB,B-5204-RGB;n:type:ShaderForge.SFN_Vector1,id:7402,x:31390,y:33625,varname:node_7402,prsc:2,v1:1;n:type:ShaderForge.SFN_If,id:851,x:31170,y:33766,varname:node_851,prsc:2|A-7979-OUT,B-9028-OUT,GT-8269-OUT,EQ-2770-RGB,LT-2770-RGB;n:type:ShaderForge.SFN_If,id:669,x:31617,y:33760,varname:node_669,prsc:2|A-7979-OUT,B-8366-OUT,GT-9536-OUT,EQ-9536-OUT,LT-851-OUT;n:type:ShaderForge.SFN_If,id:7300,x:31170,y:33999,varname:node_7300,prsc:2|A-7979-OUT,B-9028-OUT,GT-3851-OUT,EQ-834-OUT,LT-834-OUT;n:type:ShaderForge.SFN_If,id:9882,x:31617,y:33992,varname:node_9882,prsc:2|A-7979-OUT,B-8366-OUT,GT-358-OUT,EQ-358-OUT,LT-7300-OUT;n:type:ShaderForge.SFN_If,id:7482,x:31170,y:34196,varname:node_7482,prsc:2|A-7979-OUT,B-9028-OUT,GT-1132-OUT,EQ-2137-OUT,LT-2137-OUT;n:type:ShaderForge.SFN_If,id:2091,x:31649,y:34196,varname:node_2091,prsc:2|A-7979-OUT,B-8366-OUT,GT-1813-OUT,EQ-1813-OUT,LT-7482-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:8269,x:31390,y:33760,varname:node_8269,prsc:2,chbt:1|M-5843-OUT,R-2770-RGB,BTM-9536-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:3851,x:31390,y:33992,varname:node_3851,prsc:2,chbt:1|M-5843-OUT,R-834-OUT,BTM-358-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:1132,x:31390,y:34198,varname:node_1132,prsc:2,chbt:1|M-5843-OUT,R-2137-OUT,BTM-1813-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:3856,x:31390,y:34402,varname:node_3856,prsc:2,chbt:1|M-5843-OUT,R-8468-OUT,BTM-3242-OUT;n:type:ShaderForge.SFN_If,id:5597,x:31170,y:34404,varname:node_5597,prsc:2|A-7979-OUT,B-9028-OUT,GT-3856-OUT,EQ-8468-OUT,LT-8468-OUT;n:type:ShaderForge.SFN_If,id:4782,x:31649,y:34402,varname:node_4782,prsc:2|A-7979-OUT,B-8366-OUT,GT-3242-OUT,EQ-3242-OUT,LT-5597-OUT;n:type:ShaderForge.SFN_Slider,id:834,x:30791,y:34055,ptovrint:False,ptlb:Summon Metallic,ptin:_SummonMetallic,varname:node_834,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:2137,x:30819,y:34229,ptovrint:False,ptlb:Summon Gloss,ptin:_SummonGloss,varname:node_2137,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:3242,x:32234,y:34391,ptovrint:False,ptlb:Emissive?,ptin:_Emissive,varname:node_3242,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2261-OUT,B-3155-OUT;n:type:ShaderForge.SFN_Vector1,id:2261,x:32054,y:34351,varname:node_2261,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:5204,x:31860,y:34609,ptovrint:False,ptlb:EmissionColor,ptin:_EmissionColor,varname:node_5204,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:9028,x:29438,y:33656,ptovrint:False,ptlb:Phase 2,ptin:_Phase2,varname:node_9028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5244,x:29438,y:33847,ptovrint:False,ptlb:Phase Speed,ptin:_PhaseSpeed,varname:node_5244,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.8;n:type:ShaderForge.SFN_ValueProperty,id:8366,x:29438,y:33750,ptovrint:False,ptlb:Phase 3,ptin:_Phase3,varname:node_8366,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:2039,x:31816,y:33594,varname:node_2039,prsc:2|A-7736-RGB,B-8994-RGB;n:type:ShaderForge.SFN_Color,id:8994,x:31592,y:33584,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_8994,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:9536,x:32096,y:33600,varname:node_9536,prsc:2|A-2039-OUT,B-3242-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7979,x:29438,y:33942,ptovrint:False,ptlb:ShaderTime,ptin:_ShaderTime,varname:node_7979,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;proporder:7736-2770-8994-358-834-1813-2137-3242-9814-5204-2757-9028-5244-8366-7979;pass:END;sub:END;*/

Shader "Tsuna/Materialize FX" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _SummonColor ("Summon Color", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Metallic ("Metallic", Range(0, 1)) = 0
        _SummonMetallic ("Summon Metallic", Range(0, 1)) = 0
        _Glossiness ("Glossiness", Range(0, 1)) = 0
        _SummonGloss ("Summon Gloss", Range(0, 1)) = 0
        [MaterialToggle] _Emissive ("Emissive?", Float ) = 0
        _EmissionMap ("EmissionMap", 2D) = "white" {}
        _EmissionColor ("EmissionColor", Color) = (1,1,1,1)
        _EmissiveSpeed ("Emissive Speed", Float ) = 1.4
        _Phase2 ("Phase 2", Float ) = 1
        _PhaseSpeed ("Phase Speed", Float ) = 1.8
        _Phase3 ("Phase 3", Float ) = 2
        _ShaderTime ("ShaderTime", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Glossiness;
            uniform sampler2D _SummonColor; uniform float4 _SummonColor_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform float _EmissiveSpeed;
            uniform float _SummonMetallic;
            uniform float _SummonGloss;
            uniform fixed _Emissive;
            uniform float4 _EmissionColor;
            uniform float _Phase2;
            uniform float _PhaseSpeed;
            uniform float _Phase3;
            uniform float4 _Color;
            uniform float _ShaderTime;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float node_9177_if_leA = step(_ShaderTime,_Phase2);
                float node_9177_if_leB = step(_Phase2,_ShaderTime);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 _Emissive_var = lerp( 0.0, (_EmissionMap_var.rgb*_EmissionColor.rgb), _Emissive );
                float3 node_9536 = ((_MainTex_var.rgb*_Color.rgb)+_Emissive_var);
                float node_5843 = step((sin((_ShaderTime*_PhaseSpeed))*-1.5+1.5),dot(node_9536,float3(0.3,0.59,0.11)));
                clip(lerp((node_9177_if_leA*node_5843)+(node_9177_if_leB*1.0),node_5843,node_9177_if_leA*node_9177_if_leB) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float node_2091_if_leA = step(_ShaderTime,_Phase3);
                float node_2091_if_leB = step(_Phase3,_ShaderTime);
                float node_7482_if_leA = step(_ShaderTime,_Phase2);
                float node_7482_if_leB = step(_Phase2,_ShaderTime);
                float gloss = lerp((node_2091_if_leA*lerp((node_7482_if_leA*_SummonGloss)+(node_7482_if_leB*(lerp( _Glossiness, _SummonGloss, node_5843.r ))),_SummonGloss,node_7482_if_leA*node_7482_if_leB))+(node_2091_if_leB*_Glossiness),_Glossiness,node_2091_if_leA*node_2091_if_leB);
                float perceptualRoughness = 1.0 - lerp((node_2091_if_leA*lerp((node_7482_if_leA*_SummonGloss)+(node_7482_if_leB*(lerp( _Glossiness, _SummonGloss, node_5843.r ))),_SummonGloss,node_7482_if_leA*node_7482_if_leB))+(node_2091_if_leB*_Glossiness),_Glossiness,node_2091_if_leA*node_2091_if_leB);
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float node_9882_if_leA = step(_ShaderTime,_Phase3);
                float node_9882_if_leB = step(_Phase3,_ShaderTime);
                float node_7300_if_leA = step(_ShaderTime,_Phase2);
                float node_7300_if_leB = step(_Phase2,_ShaderTime);
                float3 specularColor = lerp((node_9882_if_leA*lerp((node_7300_if_leA*_SummonMetallic)+(node_7300_if_leB*(lerp( _Metallic, _SummonMetallic, node_5843.r ))),_SummonMetallic,node_7300_if_leA*node_7300_if_leB))+(node_9882_if_leB*_Metallic),_Metallic,node_9882_if_leA*node_9882_if_leB);
                float specularMonochrome;
                float node_669_if_leA = step(_ShaderTime,_Phase3);
                float node_669_if_leB = step(_Phase3,_ShaderTime);
                float node_851_if_leA = step(_ShaderTime,_Phase2);
                float node_851_if_leB = step(_Phase2,_ShaderTime);
                float4 _SummonColor_var = tex2D(_SummonColor,TRANSFORM_TEX(i.uv0, _SummonColor));
                float3 diffuseColor = lerp((node_669_if_leA*lerp((node_851_if_leA*_SummonColor_var.rgb)+(node_851_if_leB*(lerp( node_9536, _SummonColor_var.rgb, node_5843.r ))),_SummonColor_var.rgb,node_851_if_leA*node_851_if_leB))+(node_669_if_leB*node_9536),node_9536,node_669_if_leA*node_669_if_leB); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float node_4782_if_leA = step(_ShaderTime,_Phase3);
                float node_4782_if_leB = step(_Phase3,_ShaderTime);
                float node_5597_if_leA = step(_ShaderTime,_Phase2);
                float node_5597_if_leB = step(_Phase2,_ShaderTime);
                float3 node_8468 = (_SummonColor_var.rgb*(sin((_ShaderTime*_EmissiveSpeed))*4.5+5.5)); // Summmon Emissive
                float3 emissive = lerp((node_4782_if_leA*lerp((node_5597_if_leA*node_8468)+(node_5597_if_leB*(lerp( _Emissive_var, node_8468, node_5843.r ))),node_8468,node_5597_if_leA*node_5597_if_leB))+(node_4782_if_leB*_Emissive_var),_Emissive_var,node_4782_if_leA*node_4782_if_leB);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Glossiness;
            uniform sampler2D _SummonColor; uniform float4 _SummonColor_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform float _EmissiveSpeed;
            uniform float _SummonMetallic;
            uniform float _SummonGloss;
            uniform fixed _Emissive;
            uniform float4 _EmissionColor;
            uniform float _Phase2;
            uniform float _PhaseSpeed;
            uniform float _Phase3;
            uniform float4 _Color;
            uniform float _ShaderTime;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float node_9177_if_leA = step(_ShaderTime,_Phase2);
                float node_9177_if_leB = step(_Phase2,_ShaderTime);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 _Emissive_var = lerp( 0.0, (_EmissionMap_var.rgb*_EmissionColor.rgb), _Emissive );
                float3 node_9536 = ((_MainTex_var.rgb*_Color.rgb)+_Emissive_var);
                float node_5843 = step((sin((_ShaderTime*_PhaseSpeed))*-1.5+1.5),dot(node_9536,float3(0.3,0.59,0.11)));
                clip(lerp((node_9177_if_leA*node_5843)+(node_9177_if_leB*1.0),node_5843,node_9177_if_leA*node_9177_if_leB) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float node_2091_if_leA = step(_ShaderTime,_Phase3);
                float node_2091_if_leB = step(_Phase3,_ShaderTime);
                float node_7482_if_leA = step(_ShaderTime,_Phase2);
                float node_7482_if_leB = step(_Phase2,_ShaderTime);
                float gloss = lerp((node_2091_if_leA*lerp((node_7482_if_leA*_SummonGloss)+(node_7482_if_leB*(lerp( _Glossiness, _SummonGloss, node_5843.r ))),_SummonGloss,node_7482_if_leA*node_7482_if_leB))+(node_2091_if_leB*_Glossiness),_Glossiness,node_2091_if_leA*node_2091_if_leB);
                float perceptualRoughness = 1.0 - lerp((node_2091_if_leA*lerp((node_7482_if_leA*_SummonGloss)+(node_7482_if_leB*(lerp( _Glossiness, _SummonGloss, node_5843.r ))),_SummonGloss,node_7482_if_leA*node_7482_if_leB))+(node_2091_if_leB*_Glossiness),_Glossiness,node_2091_if_leA*node_2091_if_leB);
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float node_9882_if_leA = step(_ShaderTime,_Phase3);
                float node_9882_if_leB = step(_Phase3,_ShaderTime);
                float node_7300_if_leA = step(_ShaderTime,_Phase2);
                float node_7300_if_leB = step(_Phase2,_ShaderTime);
                float3 specularColor = lerp((node_9882_if_leA*lerp((node_7300_if_leA*_SummonMetallic)+(node_7300_if_leB*(lerp( _Metallic, _SummonMetallic, node_5843.r ))),_SummonMetallic,node_7300_if_leA*node_7300_if_leB))+(node_9882_if_leB*_Metallic),_Metallic,node_9882_if_leA*node_9882_if_leB);
                float specularMonochrome;
                float node_669_if_leA = step(_ShaderTime,_Phase3);
                float node_669_if_leB = step(_Phase3,_ShaderTime);
                float node_851_if_leA = step(_ShaderTime,_Phase2);
                float node_851_if_leB = step(_Phase2,_ShaderTime);
                float4 _SummonColor_var = tex2D(_SummonColor,TRANSFORM_TEX(i.uv0, _SummonColor));
                float3 diffuseColor = lerp((node_669_if_leA*lerp((node_851_if_leA*_SummonColor_var.rgb)+(node_851_if_leB*(lerp( node_9536, _SummonColor_var.rgb, node_5843.r ))),_SummonColor_var.rgb,node_851_if_leA*node_851_if_leB))+(node_669_if_leB*node_9536),node_9536,node_669_if_leA*node_669_if_leB); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform fixed _Emissive;
            uniform float4 _EmissionColor;
            uniform float _Phase2;
            uniform float _PhaseSpeed;
            uniform float4 _Color;
            uniform float _ShaderTime;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float2 uv1 : TEXCOORD2;
                float2 uv2 : TEXCOORD3;
                float4 posWorld : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float node_9177_if_leA = step(_ShaderTime,_Phase2);
                float node_9177_if_leB = step(_Phase2,_ShaderTime);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 _Emissive_var = lerp( 0.0, (_EmissionMap_var.rgb*_EmissionColor.rgb), _Emissive );
                float3 node_9536 = ((_MainTex_var.rgb*_Color.rgb)+_Emissive_var);
                float node_5843 = step((sin((_ShaderTime*_PhaseSpeed))*-1.5+1.5),dot(node_9536,float3(0.3,0.59,0.11)));
                clip(lerp((node_9177_if_leA*node_5843)+(node_9177_if_leB*1.0),node_5843,node_9177_if_leA*node_9177_if_leB) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Glossiness;
            uniform sampler2D _SummonColor; uniform float4 _SummonColor_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform float _EmissiveSpeed;
            uniform float _SummonMetallic;
            uniform float _SummonGloss;
            uniform fixed _Emissive;
            uniform float4 _EmissionColor;
            uniform float _Phase2;
            uniform float _PhaseSpeed;
            uniform float _Phase3;
            uniform float4 _Color;
            uniform float _ShaderTime;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float node_4782_if_leA = step(_ShaderTime,_Phase3);
                float node_4782_if_leB = step(_Phase3,_ShaderTime);
                float node_5597_if_leA = step(_ShaderTime,_Phase2);
                float node_5597_if_leB = step(_Phase2,_ShaderTime);
                float4 _SummonColor_var = tex2D(_SummonColor,TRANSFORM_TEX(i.uv0, _SummonColor));
                float3 node_8468 = (_SummonColor_var.rgb*(sin((_ShaderTime*_EmissiveSpeed))*4.5+5.5)); // Summmon Emissive
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 _Emissive_var = lerp( 0.0, (_EmissionMap_var.rgb*_EmissionColor.rgb), _Emissive );
                float3 node_9536 = ((_MainTex_var.rgb*_Color.rgb)+_Emissive_var);
                float node_5843 = step((sin((_ShaderTime*_PhaseSpeed))*-1.5+1.5),dot(node_9536,float3(0.3,0.59,0.11)));
                o.Emission = lerp((node_4782_if_leA*lerp((node_5597_if_leA*node_8468)+(node_5597_if_leB*(lerp( _Emissive_var, node_8468, node_5843.r ))),node_8468,node_5597_if_leA*node_5597_if_leB))+(node_4782_if_leB*_Emissive_var),_Emissive_var,node_4782_if_leA*node_4782_if_leB);
                
                float node_669_if_leA = step(_ShaderTime,_Phase3);
                float node_669_if_leB = step(_Phase3,_ShaderTime);
                float node_851_if_leA = step(_ShaderTime,_Phase2);
                float node_851_if_leB = step(_Phase2,_ShaderTime);
                float3 diffColor = lerp((node_669_if_leA*lerp((node_851_if_leA*_SummonColor_var.rgb)+(node_851_if_leB*(lerp( node_9536, _SummonColor_var.rgb, node_5843.r ))),_SummonColor_var.rgb,node_851_if_leA*node_851_if_leB))+(node_669_if_leB*node_9536),node_9536,node_669_if_leA*node_669_if_leB);
                float specularMonochrome;
                float3 specColor;
                float node_9882_if_leA = step(_ShaderTime,_Phase3);
                float node_9882_if_leB = step(_Phase3,_ShaderTime);
                float node_7300_if_leA = step(_ShaderTime,_Phase2);
                float node_7300_if_leB = step(_Phase2,_ShaderTime);
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, lerp((node_9882_if_leA*lerp((node_7300_if_leA*_SummonMetallic)+(node_7300_if_leB*(lerp( _Metallic, _SummonMetallic, node_5843.r ))),_SummonMetallic,node_7300_if_leA*node_7300_if_leB))+(node_9882_if_leB*_Metallic),_Metallic,node_9882_if_leA*node_9882_if_leB), specColor, specularMonochrome );
                float node_2091_if_leA = step(_ShaderTime,_Phase3);
                float node_2091_if_leB = step(_Phase3,_ShaderTime);
                float node_7482_if_leA = step(_ShaderTime,_Phase2);
                float node_7482_if_leB = step(_Phase2,_ShaderTime);
                float roughness = 1.0 - lerp((node_2091_if_leA*lerp((node_7482_if_leA*_SummonGloss)+(node_7482_if_leB*(lerp( _Glossiness, _SummonGloss, node_5843.r ))),_SummonGloss,node_7482_if_leA*node_7482_if_leB))+(node_2091_if_leB*_Glossiness),_Glossiness,node_2091_if_leA*node_2091_if_leB);
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
