// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2100,x:32719,y:32712,varname:node_2100,prsc:2|diff-7294-OUT,custl-2334-OUT,voffset-9439-OUT;n:type:ShaderForge.SFN_TexCoord,id:4854,x:31572,y:32483,varname:node_4854,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:1807,x:31589,y:32671,varname:node_1807,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Tex2d,id:9223,x:32112,y:32422,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_9223,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7294,x:32126,y:32782,varname:node_7294,prsc:2|A-9223-RGB,B-6845-OUT;n:type:ShaderForge.SFN_Multiply,id:1749,x:31816,y:32504,varname:node_1749,prsc:2|A-4854-UVOUT,B-1807-OUT;n:type:ShaderForge.SFN_Rotator,id:3819,x:31589,y:32866,varname:node_3819,prsc:2|UVIN-1749-OUT,ANG-2827-OUT,SPD-5602-OUT;n:type:ShaderForge.SFN_Noise,id:6845,x:31786,y:32964,varname:node_6845,prsc:2|XY-3819-UVOUT;n:type:ShaderForge.SFN_Clamp01,id:9439,x:32361,y:32956,varname:node_9439,prsc:2|IN-4007-OUT;n:type:ShaderForge.SFN_NormalVector,id:4567,x:32400,y:33226,prsc:2,pt:True;n:type:ShaderForge.SFN_Multiply,id:4007,x:32097,y:33152,varname:node_4007,prsc:2|A-6246-OUT,B-6845-OUT;n:type:ShaderForge.SFN_Divide,id:6246,x:31992,y:32964,varname:node_6246,prsc:2|A-6845-OUT,B-1752-OUT;n:type:ShaderForge.SFN_Vector1,id:1752,x:31832,y:33214,varname:node_1752,prsc:2,v1:25;n:type:ShaderForge.SFN_Vector1,id:5602,x:31338,y:32996,varname:node_5602,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:8812,x:31353,y:32885,varname:node_8812,prsc:2,v1:0.001;n:type:ShaderForge.SFN_Time,id:9173,x:31285,y:32711,varname:node_9173,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2827,x:31468,y:32767,varname:node_2827,prsc:2|A-9173-TSL,B-8812-OUT;n:type:ShaderForge.SFN_Multiply,id:2334,x:32361,y:32819,varname:node_2334,prsc:2|A-7294-OUT,B-4567-OUT;proporder:9223;pass:END;sub:END;*/

Shader "Tsuna/Hell Glitch X" {
    Properties {
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
                float node_3819_ang = (node_9173.r*0.001);
                float node_3819_spd = 0.5;
                float node_3819_cos = cos(node_3819_spd*node_3819_ang);
                float node_3819_sin = sin(node_3819_spd*node_3819_ang);
                float2 node_3819_piv = float2(0.5,0.5);
                float2 node_3819 = (mul((o.uv0*0.1)-node_3819_piv,float2x2( node_3819_cos, -node_3819_sin, node_3819_sin, node_3819_cos))+node_3819_piv);
                float2 node_6845_skew = node_3819 + 0.2127+node_3819.x*0.3713*node_3819.y;
                float2 node_6845_rnd = 4.789*sin(489.123*(node_6845_skew));
                float node_6845 = frac(node_6845_rnd.x*node_6845_rnd.y*(1+node_6845_skew.x));
                float node_9439 = saturate(((node_6845/25.0)*node_6845));
                v.vertex.xyz += float3(node_9439,node_9439,node_9439);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_9173 = _Time;
                float node_3819_ang = (node_9173.r*0.001);
                float node_3819_spd = 0.5;
                float node_3819_cos = cos(node_3819_spd*node_3819_ang);
                float node_3819_sin = sin(node_3819_spd*node_3819_ang);
                float2 node_3819_piv = float2(0.5,0.5);
                float2 node_3819 = (mul((i.uv0*0.1)-node_3819_piv,float2x2( node_3819_cos, -node_3819_sin, node_3819_sin, node_3819_cos))+node_3819_piv);
                float2 node_6845_skew = node_3819 + 0.2127+node_3819.x*0.3713*node_3819.y;
                float2 node_6845_rnd = 4.789*sin(489.123*(node_6845_skew));
                float node_6845 = frac(node_6845_rnd.x*node_6845_rnd.y*(1+node_6845_skew.x));
                float3 node_7294 = (_MainTex_var.rgb*node_6845);
                float3 finalColor = (node_7294*normalDirection);
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
                float4 node_9173 = _Time;
                float node_3819_ang = (node_9173.r*0.001);
                float node_3819_spd = 0.5;
                float node_3819_cos = cos(node_3819_spd*node_3819_ang);
                float node_3819_sin = sin(node_3819_spd*node_3819_ang);
                float2 node_3819_piv = float2(0.5,0.5);
                float2 node_3819 = (mul((o.uv0*0.1)-node_3819_piv,float2x2( node_3819_cos, -node_3819_sin, node_3819_sin, node_3819_cos))+node_3819_piv);
                float2 node_6845_skew = node_3819 + 0.2127+node_3819.x*0.3713*node_3819.y;
                float2 node_6845_rnd = 4.789*sin(489.123*(node_6845_skew));
                float node_6845 = frac(node_6845_rnd.x*node_6845_rnd.y*(1+node_6845_skew.x));
                float node_9439 = saturate(((node_6845/25.0)*node_6845));
                v.vertex.xyz += float3(node_9439,node_9439,node_9439);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
