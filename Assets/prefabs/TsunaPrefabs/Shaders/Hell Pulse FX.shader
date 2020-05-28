// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2100,x:33200,y:32652,varname:node_2100,prsc:2|custl-6018-OUT,voffset-5550-OUT;n:type:ShaderForge.SFN_TexCoord,id:4854,x:31163,y:32842,varname:node_4854,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Noise,id:6845,x:31696,y:32851,varname:node_6845,prsc:2|XY-2827-OUT;n:type:ShaderForge.SFN_NormalVector,id:4567,x:32009,y:32482,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector1,id:1752,x:32380,y:33075,varname:node_1752,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Vector1,id:8812,x:31406,y:32984,varname:node_8812,prsc:2,v1:0.001;n:type:ShaderForge.SFN_Time,id:9173,x:31406,y:32652,varname:node_9173,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2827,x:31406,y:32805,varname:node_2827,prsc:2|A-9173-TSL,B-4854-UVOUT,C-8812-OUT;n:type:ShaderForge.SFN_Multiply,id:5550,x:32380,y:32954,varname:node_5550,prsc:2|A-5411-OUT,B-592-OUT,C-4567-OUT,D-1752-OUT;n:type:ShaderForge.SFN_Slider,id:592,x:32380,y:32869,ptovrint:False,ptlb:Strength,ptin:_Strength,varname:node_592,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:1,max:10;n:type:ShaderForge.SFN_Tex2d,id:6788,x:32600,y:32498,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6788,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Blend,id:5411,x:31973,y:33013,varname:node_5411,prsc:2,blmd:18,clmp:True|SRC-6845-OUT,DST-5956-OUT;n:type:ShaderForge.SFN_Round,id:5956,x:31696,y:32988,varname:node_5956,prsc:2|IN-6845-OUT;n:type:ShaderForge.SFN_Multiply,id:6018,x:32600,y:32684,varname:node_6018,prsc:2|A-6788-RGB,B-4567-OUT,C-3565-OUT;n:type:ShaderForge.SFN_Noise,id:3565,x:31696,y:32701,varname:node_3565,prsc:2|XY-4854-UVOUT;n:type:ShaderForge.SFN_Sin,id:467,x:31059,y:32493,varname:node_467,prsc:2|IN-9173-TSL;proporder:592-6788;pass:END;sub:END;*/

Shader "Tsuna/Hell Pulse FX" {
    Properties {
        _Strength ("Strength", Range(-10, 10)) = 1
        _MainTex ("MainTex", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _Strength;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_9173 = _Time;
                float2 node_2827 = (node_9173.r*o.uv0*0.001);
                float2 node_6845_skew = node_2827 + 0.2127+node_2827.x*0.3713*node_2827.y;
                float2 node_6845_rnd = 4.789*sin(489.123*(node_6845_skew));
                float node_6845 = frac(node_6845_rnd.x*node_6845_rnd.y*(1+node_6845_skew.x));
                v.vertex.xyz += (saturate((0.5 - 2.0*(node_6845-0.5)*(round(node_6845)-0.5)))*_Strength*v.normal*0.01);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float2 node_3565_skew = i.uv0 + 0.2127+i.uv0.x*0.3713*i.uv0.y;
                float2 node_3565_rnd = 4.789*sin(489.123*(node_3565_skew));
                float node_3565 = frac(node_3565_rnd.x*node_3565_rnd.y*(1+node_3565_skew.x));
                float3 finalColor = (_MainTex_var.rgb*i.normalDir*node_3565);
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
            Cull Back
            
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
            uniform float _Strength;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_9173 = _Time;
                float2 node_2827 = (node_9173.r*o.uv0*0.001);
                float2 node_6845_skew = node_2827 + 0.2127+node_2827.x*0.3713*node_2827.y;
                float2 node_6845_rnd = 4.789*sin(489.123*(node_6845_skew));
                float node_6845 = frac(node_6845_rnd.x*node_6845_rnd.y*(1+node_6845_skew.x));
                v.vertex.xyz += (saturate((0.5 - 2.0*(node_6845-0.5)*(round(node_6845)-0.5)))*_Strength*v.normal*0.01);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
