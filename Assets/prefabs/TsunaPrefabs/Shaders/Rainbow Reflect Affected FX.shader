// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:0,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:14,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33350,y:32670,varname:node_4013,prsc:2|emission-577-OUT,custl-8563-OUT;n:type:ShaderForge.SFN_Time,id:8250,x:31418,y:32695,varname:node_8250,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2895,x:31858,y:32696,varname:node_2895,prsc:2|A-8250-T,B-6378-OUT;n:type:ShaderForge.SFN_Fresnel,id:5533,x:32094,y:33005,varname:node_5533,prsc:2|EXP-8918-OUT;n:type:ShaderForge.SFN_Multiply,id:577,x:32369,y:32731,varname:node_577,prsc:2|A-6115-OUT,B-8694-OUT;n:type:ShaderForge.SFN_Slider,id:8918,x:32157,y:33208,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_8918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.75,max:5;n:type:ShaderForge.SFN_Add,id:8694,x:32338,y:32979,varname:node_8694,prsc:2|A-5533-OUT,B-5533-OUT;n:type:ShaderForge.SFN_HsvToRgb,id:6115,x:31879,y:33261,varname:node_6115,prsc:2|H-3420-OUT,S-5948-OUT,V-5436-OUT;n:type:ShaderForge.SFN_Add,id:7800,x:31473,y:33263,varname:node_7800,prsc:2|A-2895-OUT,B-5533-OUT;n:type:ShaderForge.SFN_Slider,id:9406,x:31918,y:32869,ptovrint:False,ptlb:Strength,ptin:_Strength,varname:node_9406,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.75,max:1.5;n:type:ShaderForge.SFN_Multiply,id:856,x:32861,y:32574,varname:node_856,prsc:2|A-4413-OUT,B-9406-OUT;n:type:ShaderForge.SFN_Slider,id:6378,x:31370,y:32949,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_6378,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.75,max:1.5;n:type:ShaderForge.SFN_Slider,id:5436,x:31370,y:33060,ptovrint:False,ptlb:Value,ptin:_Value,varname:node_5436,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.75,max:1.5;n:type:ShaderForge.SFN_Slider,id:5948,x:31722,y:33068,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_5948,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:0.75,max:1.5;n:type:ShaderForge.SFN_Slider,id:3102,x:31359,y:33460,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_3102,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:10;n:type:ShaderForge.SFN_Divide,id:3420,x:31696,y:33381,varname:node_3420,prsc:2|A-7800-OUT,B-3102-OUT;n:type:ShaderForge.SFN_Tex2d,id:8603,x:33147,y:32044,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8603,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:8563,x:33126,y:32446,varname:node_8563,prsc:2,chbt:1|M-7551-RGB,R-8603-RGB,G-8603-RGB,B-8603-RGB,BTM-856-OUT;n:type:ShaderForge.SFN_Tex2d,id:7551,x:32786,y:32079,ptovrint:False,ptlb:AffectMap,ptin:_AffectMap,varname:node_7551,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ChannelBlend,id:4413,x:32642,y:32550,varname:node_4413,prsc:2,chbt:1|M-577-OUT,R-577-OUT,G-577-OUT,B-577-OUT,BTM-6498-OUT;n:type:ShaderForge.SFN_Multiply,id:6498,x:32373,y:32562,varname:node_6498,prsc:2|A-3217-OUT,B-8603-RGB;n:type:ShaderForge.SFN_Multiply,id:4454,x:31612,y:32564,varname:node_4454,prsc:2|A-8250-T,B-33-OUT;n:type:ShaderForge.SFN_Slider,id:33,x:31261,y:32545,ptovrint:False,ptlb:HueSpeed,ptin:_HueSpeed,varname:node_33,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:2;n:type:ShaderForge.SFN_Slider,id:8904,x:31533,y:32364,ptovrint:False,ptlb:SaturationHue,ptin:_SaturationHue,varname:node_8904,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_HsvToRgb,id:3217,x:32024,y:32513,varname:node_3217,prsc:2|H-4454-OUT,S-8904-OUT,V-8015-OUT;n:type:ShaderForge.SFN_Slider,id:8015,x:31533,y:32455,ptovrint:False,ptlb:ValueHue,ptin:_ValueHue,varname:node_8015,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:8918-9406-6378-5436-5948-3102-8603-7551-33-8904-8015;pass:END;sub:END;*/

Shader "Tsuna/Rainbow Reflect Affected FX" {
    Properties {
        _Fresnel ("Fresnel", Range(0.01, 5)) = 0.75
        _Strength ("Strength", Range(0.01, 1.5)) = 0.75
        _Speed ("Speed", Range(0.01, 1.5)) = 0.75
        _Value ("Value", Range(0.01, 1.5)) = 0.75
        _Saturation ("Saturation", Range(0.01, 1.5)) = 0.75
        _Width ("Width", Range(1, 10)) = 1
        _MainTex ("MainTex", 2D) = "white" {}
        _AffectMap ("AffectMap", 2D) = "white" {}
        _HueSpeed ("HueSpeed", Range(0, 2)) = 0.3
        _SaturationHue ("SaturationHue", Range(0, 1)) = 0.5
        _ValueHue ("ValueHue", Range(0, 1)) = 1
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
            uniform float _Fresnel;
            uniform float _Strength;
            uniform float _Speed;
            uniform float _Value;
            uniform float _Saturation;
            uniform float _Width;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _AffectMap; uniform float4 _AffectMap_ST;
            uniform float _HueSpeed;
            uniform float _SaturationHue;
            uniform float _ValueHue;
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
                float3 node_577 = ((lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((((node_8250.g*_Speed)+node_5533)/_Width)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_Saturation)*_Value)*(node_5533+node_5533));
                float3 emissive = node_577;
                float4 _AffectMap_var = tex2D(_AffectMap,TRANSFORM_TEX(i.uv0, _AffectMap));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 finalColor = emissive + (lerp( lerp( lerp( ((lerp( lerp( lerp( ((lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac((node_8250.g*_HueSpeed)+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_SaturationHue)*_ValueHue)*_MainTex_var.rgb), node_577, node_577.r ), node_577, node_577.g ), node_577, node_577.b ))*_Strength), _MainTex_var.rgb, _AffectMap_var.rgb.r ), _MainTex_var.rgb, _AffectMap_var.rgb.g ), _MainTex_var.rgb, _AffectMap_var.rgb.b ));
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
