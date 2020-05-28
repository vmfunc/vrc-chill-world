// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:30435,y:32566,varname:node_2865,prsc:2|diff-1498-OUT,emission-2100-OUT,custl-1498-OUT,clip-9562-OUT;n:type:ShaderForge.SFN_Tex2d,id:7736,x:29167,y:32527,ptovrint:True,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2151-UVOUT;n:type:ShaderForge.SFN_Color,id:1674,x:29112,y:32761,ptovrint:False,ptlb:Glow Color,ptin:_GlowColor,varname:node_1674,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7322515,c2:1,c3:0.8559698,c4:1;n:type:ShaderForge.SFN_Tex2d,id:3768,x:29282,y:33095,ptovrint:False,ptlb:Flow Mask,ptin:_FlowMask,varname:node_3768,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3275-UVOUT;n:type:ShaderForge.SFN_Desaturate,id:3940,x:29700,y:33243,varname:node_3940,prsc:2|COL-3567-OUT;n:type:ShaderForge.SFN_Add,id:9562,x:29915,y:33243,varname:node_9562,prsc:2|A-3940-OUT,B-7897-OUT;n:type:ShaderForge.SFN_Multiply,id:1744,x:28875,y:33369,varname:node_1744,prsc:2|A-4601-OUT,B-9145-OUT;n:type:ShaderForge.SFN_Multiply,id:4163,x:28875,y:33112,varname:node_4163,prsc:2|A-2108-OUT,B-4601-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2108,x:28768,y:32917,ptovrint:False,ptlb:Saturate Speed,ptin:_SaturateSpeed,varname:node_2108,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:9145,x:29190,y:33453,ptovrint:False,ptlb:Flow Speed,ptin:_FlowSpeed,varname:node_9145,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:7090,x:29358,y:32670,ptovrint:False,ptlb:White,ptin:_White,varname:node_7090,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9419,x:29907,y:32524,varname:node_9419,prsc:2|A-7736-RGB,B-4459-OUT;n:type:ShaderForge.SFN_Multiply,id:9706,x:29358,y:32831,varname:node_9706,prsc:2|A-1674-RGB,B-4163-OUT;n:type:ShaderForge.SFN_Add,id:4459,x:29708,y:32665,varname:node_4459,prsc:2|A-7090-RGB,B-9706-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:2100,x:29708,y:32806,varname:node_2100,prsc:2,min:0,max:1|IN-9706-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:1498,x:30160,y:32524,varname:node_1498,prsc:2,min:0,max:1|IN-9419-OUT;n:type:ShaderForge.SFN_Subtract,id:3567,x:28875,y:33241,varname:node_3567,prsc:2|A-3768-RGB,B-4601-OUT;n:type:ShaderForge.SFN_TexCoord,id:2151,x:28974,y:32527,varname:node_2151,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:3275,x:29052,y:33112,varname:node_3275,prsc:2,uv:1,uaff:False;n:type:ShaderForge.SFN_OneMinus,id:7897,x:29700,y:33390,varname:node_7897,prsc:2|IN-1744-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2848,x:28065,y:33230,ptovrint:False,ptlb:ShaderTime,ptin:_ShaderTime,varname:node_2848,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Divide,id:4601,x:28414,y:33290,varname:node_4601,prsc:2|A-2848-OUT,B-9131-OUT;n:type:ShaderForge.SFN_Vector1,id:9131,x:28065,y:33331,varname:node_9131,prsc:2,v1:20;proporder:7736-1674-3768-2108-9145-7090-2848;pass:END;sub:END;*/

Shader "Tsuna/Disint FX" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        [HDR]_GlowColor ("Glow Color", Color) = (0.7322515,1,0.8559698,1)
        _FlowMask ("Flow Mask", 2D) = "white" {}
        _SaturateSpeed ("Saturate Speed", Float ) = 1
        _FlowSpeed ("Flow Speed", Float ) = 1
        [HideInInspector]_White ("White", Color) = (1,1,1,1)
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _GlowColor;
            uniform sampler2D _FlowMask; uniform float4 _FlowMask_ST;
            uniform float _SaturateSpeed;
            uniform float _FlowSpeed;
            uniform float4 _White;
            uniform float _ShaderTime;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _FlowMask_var = tex2D(_FlowMask,TRANSFORM_TEX(i.uv1, _FlowMask));
                float node_4601 = (_ShaderTime/20.0);
                clip((dot((_FlowMask_var.rgb-node_4601),float3(0.3,0.59,0.11))+(1.0 - (node_4601*_FlowSpeed))) - 0.5);
////// Lighting:
////// Emissive:
                float3 node_9706 = (_GlowColor.rgb*(_SaturateSpeed*node_4601));
                float3 emissive = clamp(node_9706,0,1);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_1498 = clamp((_MainTex_var.rgb*(_White.rgb+node_9706)),0,1);
                float3 finalColor = emissive + node_1498;
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
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _FlowMask; uniform float4 _FlowMask_ST;
            uniform float _FlowSpeed;
            uniform float _ShaderTime;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv1 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _FlowMask_var = tex2D(_FlowMask,TRANSFORM_TEX(i.uv1, _FlowMask));
                float node_4601 = (_ShaderTime/20.0);
                clip((dot((_FlowMask_var.rgb-node_4601),float3(0.3,0.59,0.11))+(1.0 - (node_4601*_FlowSpeed))) - 0.5);
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
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _GlowColor;
            uniform float _SaturateSpeed;
            uniform float4 _White;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float node_4601 = (_ShaderTime/20.0);
                float3 node_9706 = (_GlowColor.rgb*(_SaturateSpeed*node_4601));
                o.Emission = clamp(node_9706,0,1);
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
