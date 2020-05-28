// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:14,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33350,y:32670,varname:node_4013,prsc:2|emission-577-OUT,custl-4347-OUT;n:type:ShaderForge.SFN_Time,id:8250,x:31574,y:32695,varname:node_8250,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2895,x:31858,y:32696,varname:node_2895,prsc:2|A-8250-T,B-6378-OUT;n:type:ShaderForge.SFN_Fresnel,id:5533,x:32094,y:33005,varname:node_5533,prsc:2|EXP-8918-OUT;n:type:ShaderForge.SFN_Tex2d,id:8365,x:31998,y:32354,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8365,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:577,x:32417,y:32821,varname:node_577,prsc:2|A-6115-OUT,B-8694-OUT;n:type:ShaderForge.SFN_Slider,id:8918,x:32157,y:33208,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_8918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:10;n:type:ShaderForge.SFN_Add,id:8694,x:32338,y:32979,varname:node_8694,prsc:2|A-5533-OUT,B-5533-OUT;n:type:ShaderForge.SFN_HsvToRgb,id:6115,x:31827,y:33253,varname:node_6115,prsc:2|H-2895-OUT,S-5948-OUT,V-5436-OUT;n:type:ShaderForge.SFN_Blend,id:4347,x:32871,y:32571,varname:node_4347,prsc:2,blmd:7,clmp:True|SRC-856-OUT,DST-8033-OUT;n:type:ShaderForge.SFN_Subtract,id:4931,x:32443,y:32633,varname:node_4931,prsc:2|A-577-OUT,B-1753-RGB;n:type:ShaderForge.SFN_Color,id:1753,x:32182,y:32645,ptovrint:False,ptlb:white,ptin:_white,varname:node_1753,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:9406,x:31952,y:32873,ptovrint:False,ptlb:Strength,ptin:_Strength,varname:node_9406,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:856,x:32656,y:32458,varname:node_856,prsc:2|A-4931-OUT,B-9406-OUT;n:type:ShaderForge.SFN_Slider,id:6378,x:31370,y:32949,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_6378,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:2;n:type:ShaderForge.SFN_Slider,id:5436,x:31370,y:33060,ptovrint:False,ptlb:Value,ptin:_Value,varname:node_5436,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:5948,x:31722,y:33068,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_5948,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:8033,x:32274,y:32417,varname:node_8033,prsc:2|A-8365-RGB,B-3244-RGB;n:type:ShaderForge.SFN_Color,id:3244,x:31998,y:32556,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_3244,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;proporder:8365-3244-8918-9406-1753-6378-5436-5948;pass:END;sub:END;*/

Shader "Tsuna/Rainbow Reflect Shade FX" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Fresnel ("Fresnel", Range(0.01, 10)) = 1
        _Strength ("Strength", Range(0.01, 10)) = 1
        [HideInInspector]_white ("white", Color) = (1,1,1,1)
        _Speed ("Speed", Range(0.01, 2)) = 1
        _Value ("Value", Range(0.01, 10)) = 1
        _Saturation ("Saturation", Range(0.01, 10)) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            ColorMask RGB
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Fresnel;
            uniform float4 _white;
            uniform float _Strength;
            uniform float _Speed;
            uniform float _Value;
            uniform float _Saturation;
            uniform float4 _Color;
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
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_8250 = _Time;
                float node_5533 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel);
                float3 node_577 = ((lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((node_8250.g*_Speed)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_Saturation)*_Value)*(node_5533+node_5533));
                float3 emissive = node_577;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = emissive + saturate(((_MainTex_var.rgb*_Color.rgb)/(1.0-((node_577-_white.rgb)*_Strength))));
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            ColorMask RGB
            
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
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
