// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33232,y:32684,varname:node_4013,prsc:2|diff-2285-OUT,emission-5150-OUT,clip-6825-OUT;n:type:ShaderForge.SFN_Tex2d,id:2918,x:31886,y:33155,ptovrint:False,ptlb:AlphaMap,ptin:_AlphaMap,varname:node_2918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Time,id:4207,x:31425,y:32823,varname:node_4207,prsc:2;n:type:ShaderForge.SFN_Sin,id:752,x:31854,y:32767,varname:node_752,prsc:2|IN-7417-OUT;n:type:ShaderForge.SFN_Tex2d,id:2490,x:32059,y:32427,ptovrint:False,ptlb:EmissionMap,ptin:_EmissionMap,varname:node_2490,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5150,x:32251,y:32623,varname:node_5150,prsc:2|A-5118-OUT,B-5677-RGB,C-5797-OUT;n:type:ShaderForge.SFN_Sin,id:2346,x:31938,y:32995,varname:node_2346,prsc:2|IN-4041-OUT;n:type:ShaderForge.SFN_Multiply,id:4174,x:32279,y:33032,varname:node_4174,prsc:2|A-1466-OUT,B-1367-OUT;n:type:ShaderForge.SFN_Multiply,id:4041,x:31765,y:32995,varname:node_4041,prsc:2|A-3047-OUT,B-4207-T;n:type:ShaderForge.SFN_Multiply,id:7417,x:31676,y:32767,varname:node_7417,prsc:2|A-3170-OUT,B-4207-T;n:type:ShaderForge.SFN_Tex2d,id:5253,x:32445,y:32859,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5253,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:118,x:32739,y:32782,varname:node_118,prsc:2|A-302-RGB,B-5253-RGB;n:type:ShaderForge.SFN_Color,id:5677,x:32059,y:32623,ptovrint:False,ptlb:EmissionColor,ptin:_EmissionColor,varname:node_5677,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:302,x:32445,y:32700,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_302,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Blend,id:2285,x:32995,y:32718,varname:node_2285,prsc:2,blmd:5,clmp:True|SRC-5150-OUT,DST-118-OUT;n:type:ShaderForge.SFN_Desaturate,id:1367,x:32097,y:33172,varname:node_1367,prsc:2|COL-2918-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:5797,x:32251,y:32765,ptovrint:False,ptlb:PulseEmissionOn,ptin:_PulseEmissionOn,varname:node_5797,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2330-OUT,B-4608-OUT;n:type:ShaderForge.SFN_Vector1,id:2330,x:32251,y:32898,varname:node_2330,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:919,x:31886,y:33344,ptovrint:False,ptlb:LowerLimit,ptin:_LowerLimit,varname:node_919,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:3047,x:31877,y:32918,ptovrint:False,ptlb:FadeSpeed,ptin:_FadeSpeed,varname:node_3047,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Slider,id:3170,x:31720,y:32685,ptovrint:False,ptlb:SaturationSpeed,ptin:_SaturationSpeed,varname:node_3170,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Blend,id:6825,x:32978,y:32978,varname:node_6825,prsc:2,blmd:10,clmp:True|SRC-5253-A,DST-6163-OUT;n:type:ShaderForge.SFN_Blend,id:5118,x:32445,y:32469,varname:node_5118,prsc:2,blmd:10,clmp:True|SRC-2490-RGB,DST-5253-A;n:type:ShaderForge.SFN_RemapRange,id:4608,x:32034,y:32765,varname:node_4608,prsc:2,frmn:-1,frmx:1,tomn:0.5,tomx:1|IN-752-OUT;n:type:ShaderForge.SFN_RemapRange,id:1466,x:32097,y:32995,varname:node_1466,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2346-OUT;n:type:ShaderForge.SFN_Add,id:4891,x:32492,y:33069,varname:node_4891,prsc:2|A-4174-OUT,B-919-OUT;n:type:ShaderForge.SFN_Clamp01,id:6163,x:32684,y:33036,varname:node_6163,prsc:2|IN-4891-OUT;proporder:2918-2490-5253-5677-302-5797-919-3047-3170;pass:END;sub:END;*/

Shader "Tsuna/Fade Pulse FX" {
    Properties {
        _AlphaMap ("AlphaMap", 2D) = "white" {}
        _EmissionMap ("EmissionMap", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _EmissionColor ("EmissionColor", Color) = (0,0,0,1)
        _Color ("Color", Color) = (1,1,1,1)
        [MaterialToggle] _PulseEmissionOn ("PulseEmissionOn", Float ) = 1
        _LowerLimit ("LowerLimit", Range(0, 1)) = 0
        _FadeSpeed ("FadeSpeed", Range(0, 2)) = 1
        _SaturationSpeed ("SaturationSpeed", Range(0, 2)) = 1
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _EmissionColor;
            uniform float4 _Color;
            uniform fixed _PulseEmissionOn;
            uniform float _LowerLimit;
            uniform float _FadeSpeed;
            uniform float _SaturationSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_4207 = _Time;
                float4 _AlphaMap_var = tex2D(_AlphaMap,TRANSFORM_TEX(i.uv0, _AlphaMap));
                clip(saturate(( saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit)) > 0.5 ? (1.0-(1.0-2.0*(saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit))-0.5))*(1.0-_MainTex_var.a)) : (2.0*saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit))*_MainTex_var.a) )) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 node_5150 = (saturate(( _MainTex_var.a > 0.5 ? (1.0-(1.0-2.0*(_MainTex_var.a-0.5))*(1.0-_EmissionMap_var.rgb)) : (2.0*_MainTex_var.a*_EmissionMap_var.rgb) ))*_EmissionColor.rgb*lerp( 1.0, (sin((_SaturationSpeed*node_4207.g))*0.25+0.75), _PulseEmissionOn ));
                float3 diffuseColor = saturate(max(node_5150,(_Color.rgb*_MainTex_var.rgb)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = node_5150;
/// Final Color:
                float3 finalColor = diffuse + emissive;
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _EmissionColor;
            uniform float4 _Color;
            uniform fixed _PulseEmissionOn;
            uniform float _LowerLimit;
            uniform float _FadeSpeed;
            uniform float _SaturationSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_4207 = _Time;
                float4 _AlphaMap_var = tex2D(_AlphaMap,TRANSFORM_TEX(i.uv0, _AlphaMap));
                clip(saturate(( saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit)) > 0.5 ? (1.0-(1.0-2.0*(saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit))-0.5))*(1.0-_MainTex_var.a)) : (2.0*saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit))*_MainTex_var.a) )) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 node_5150 = (saturate(( _MainTex_var.a > 0.5 ? (1.0-(1.0-2.0*(_MainTex_var.a-0.5))*(1.0-_EmissionMap_var.rgb)) : (2.0*_MainTex_var.a*_EmissionMap_var.rgb) ))*_EmissionColor.rgb*lerp( 1.0, (sin((_SaturationSpeed*node_4207.g))*0.25+0.75), _PulseEmissionOn ));
                float3 diffuseColor = saturate(max(node_5150,(_Color.rgb*_MainTex_var.rgb)));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _LowerLimit;
            uniform float _FadeSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_4207 = _Time;
                float4 _AlphaMap_var = tex2D(_AlphaMap,TRANSFORM_TEX(i.uv0, _AlphaMap));
                clip(saturate(( saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit)) > 0.5 ? (1.0-(1.0-2.0*(saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit))-0.5))*(1.0-_MainTex_var.a)) : (2.0*saturate((((sin((_FadeSpeed*node_4207.g))*0.5+0.5)*dot(_AlphaMap_var.rgb,float3(0.3,0.59,0.11)))+_LowerLimit))*_MainTex_var.a) )) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
