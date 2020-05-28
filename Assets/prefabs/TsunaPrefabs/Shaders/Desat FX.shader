// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Tsuna/Shading FX,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:8128,x:32719,y:32712,varname:node_8128,prsc:2|custl-961-OUT;n:type:ShaderForge.SFN_Transform,id:4358,x:30658,y:32317,varname:node_4358,prsc:2,tffrom:0,tfto:1|IN-4011-RGB;n:type:ShaderForge.SFN_SceneColor,id:4011,x:30415,y:32317,varname:node_4011,prsc:2;n:type:ShaderForge.SFN_Desaturate,id:1204,x:31774,y:32579,varname:node_1204,prsc:2|COL-4358-XYZ;n:type:ShaderForge.SFN_Posterize,id:139,x:32284,y:32388,varname:node_139,prsc:2|IN-1204-OUT,STPS-7877-OUT;n:type:ShaderForge.SFN_Slider,id:7877,x:31673,y:32295,ptovrint:False,ptlb:Colors,ptin:_Colors,varname:node_7877,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:25,max:255;n:type:ShaderForge.SFN_SwitchProperty,id:961,x:32272,y:32597,ptovrint:False,ptlb:Reduce Colors?,ptin:_ReduceColors,varname:node_961,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1204-OUT,B-139-OUT;proporder:961-7877;pass:END;sub:END;*/

Shader "Tsuna/Desat FX" {
    Properties {
        [MaterialToggle] _ReduceColors ("Reduce Colors?", Float ) = 0.477
        _Colors ("Colors", Range(0, 255)) = 25
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _Colors;
            uniform fixed _ReduceColors;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 projPos : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float node_1204 = dot(mul( unity_WorldToObject, float4(sceneColor.rgb,0) ).xyz.rgb,float3(0.3,0.59,0.11));
                float node_961 = lerp( node_1204, floor(node_1204 * _Colors) / (_Colors - 1), _ReduceColors );
                float3 finalColor = float3(node_961,node_961,node_961);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Tsuna/Shading FX"
    CustomEditor "ShaderForgeMaterialInspector"
}
