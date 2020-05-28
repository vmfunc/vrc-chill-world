// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:2,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:True,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Emission,coma:14,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32845,y:32933,varname:node_4013,prsc:2|diff-1362-OUT,emission-7311-OUT;n:type:ShaderForge.SFN_Time,id:8250,x:31908,y:32934,varname:node_8250,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2895,x:32088,y:32934,varname:node_2895,prsc:2|A-8250-TSL,B-567-OUT;n:type:ShaderForge.SFN_HsvToRgb,id:1719,x:32274,y:32934,varname:node_1719,prsc:2|H-2895-OUT,S-4955-OUT,V-1304-OUT;n:type:ShaderForge.SFN_Fresnel,id:5533,x:32088,y:33070,varname:node_5533,prsc:2;n:type:ShaderForge.SFN_InverseLerp,id:2764,x:32456,y:33070,varname:node_2764,prsc:2|A-1719-OUT,B-1315-OUT,V-5234-OUT;n:type:ShaderForge.SFN_Slider,id:96,x:31931,y:33214,ptovrint:False,ptlb:Strength,ptin:_Strength,varname:node_96,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:1315,x:32274,y:33070,varname:node_1315,prsc:2|A-5533-OUT,B-96-OUT;n:type:ShaderForge.SFN_Clamp01,id:7311,x:32634,y:33070,varname:node_7311,prsc:2|IN-2764-OUT;n:type:ShaderForge.SFN_Clamp01,id:4212,x:32456,y:32934,varname:node_4212,prsc:2|IN-1719-OUT;n:type:ShaderForge.SFN_Slider,id:5234,x:31931,y:33321,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_5234,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:4955,x:31918,y:32766,ptovrint:False,ptlb:Saturate,ptin:_Saturate,varname:node_4955,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:1304,x:31918,y:32671,ptovrint:False,ptlb:Value,ptin:_Value,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:567,x:31918,y:32858,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_567,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:1362,x:32634,y:32934,varname:node_1362,prsc:2|A-4212-OUT,B-6823-RGB;n:type:ShaderForge.SFN_Tex2d,id:6823,x:32351,y:32659,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6823,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:96-5234-4955-1304-567-6823;pass:END;sub:END;*/

Shader "Tsuna/Yuna Rainbow FX" {
    Properties {
        _Strength ("Strength", Range(0.01, 10)) = 1
        _Fresnel ("Fresnel", Range(0, 10)) = 1
        _Saturate ("Saturate", Range(0.01, 10)) = 1
        _Value ("Value", Range(0.1, 10)) = 1
        _Speed ("Speed", Range(0.1, 10)) = 1
        _MainTex ("MainTex", 2D) = "white" {}
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
            
            ColorMask RGB
            
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
            uniform float _Strength;
            uniform float _Fresnel;
            uniform float _Saturate;
            uniform float _Value;
            uniform float _Speed;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
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
                float4 node_8250 = _Time;
                float3 node_1719 = (lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((node_8250.r*_Speed)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_Saturate)*_Value);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuseColor = (saturate(node_1719)*_MainTex_var.rgb);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float node_1315 = ((1.0-max(0,dot(normalDirection, viewDirection)))*_Strength);
                float3 emissive = saturate(((float3(_Fresnel,_Fresnel,_Fresnel)-node_1719)/(float3(node_1315,node_1315,node_1315)-node_1719)));
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
            
            ColorMask RGB
            
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
            uniform float _Strength;
            uniform float _Fresnel;
            uniform float _Saturate;
            uniform float _Value;
            uniform float _Speed;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 node_8250 = _Time;
                float3 node_1719 = (lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((node_8250.r*_Speed)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_Saturate)*_Value);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuseColor = (saturate(node_1719)*_MainTex_var.rgb);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
