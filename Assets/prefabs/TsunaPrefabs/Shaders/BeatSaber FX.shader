// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Toon/Basic,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1042,x:36035,y:32485,varname:node_1042,prsc:2|custl-9966-OUT,alpha-9519-OUT;n:type:ShaderForge.SFN_Color,id:7207,x:34883,y:32333,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_7207,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4859,x:34872,y:32095,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4859,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4178,x:35156,y:32220,varname:node_4178,prsc:2|A-4859-RGB,B-7207-RGB;n:type:ShaderForge.SFN_Tex2d,id:6640,x:32995,y:31448,ptovrint:False,ptlb:SphereMap,ptin:_SphereMap,varname:node_6640,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-5961-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:1279,x:33904,y:31415,ptovrint:False,ptlb:Add (0) or Multiply (1) Sphere,ptin:_Add0orMultiply1Sphere,varname:node_1279,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-277-OUT,B-2510-OUT;n:type:ShaderForge.SFN_Multiply,id:2510,x:33660,y:31528,varname:node_2510,prsc:2|A-9945-OUT,B-2223-OUT;n:type:ShaderForge.SFN_Slider,id:2232,x:33150,y:31624,ptovrint:False,ptlb:SphereStrength,ptin:_SphereStrength,varname:node_2232,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_SwitchProperty,id:5179,x:33924,y:32639,ptovrint:False,ptlb:SphereMapOn?,ptin:_SphereMapOn,varname:node_5179,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3315-OUT,B-3295-OUT;n:type:ShaderForge.SFN_Transform,id:754,x:32095,y:31448,varname:node_754,prsc:2,tffrom:0,tfto:3|IN-6850-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5961,x:32804,y:31448,varname:node_5961,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9634-OUT;n:type:ShaderForge.SFN_Normalize,id:925,x:32263,y:31448,varname:node_925,prsc:2|IN-754-XYZ;n:type:ShaderForge.SFN_Vector1,id:2793,x:32439,y:31582,varname:node_2793,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:9682,x:32439,y:31448,varname:node_9682,prsc:2|A-925-OUT,B-2793-OUT;n:type:ShaderForge.SFN_Add,id:9634,x:32618,y:31448,varname:node_9634,prsc:2|A-9682-OUT,B-9361-OUT;n:type:ShaderForge.SFN_NormalVector,id:6850,x:31933,y:31448,prsc:2,pt:True;n:type:ShaderForge.SFN_Set,id:1173,x:35699,y:32160,varname:DiffuseData,prsc:2|IN-7338-OUT;n:type:ShaderForge.SFN_Get,id:3315,x:33656,y:32777,varname:node_3315,prsc:2|IN-1173-OUT;n:type:ShaderForge.SFN_Set,id:918,x:34275,y:31415,varname:DiffuseSphereData,prsc:2|IN-7045-OUT;n:type:ShaderForge.SFN_Get,id:3295,x:33656,y:32863,varname:node_3295,prsc:2|IN-918-OUT;n:type:ShaderForge.SFN_Get,id:9945,x:33639,y:31451,varname:node_9945,prsc:2|IN-1173-OUT;n:type:ShaderForge.SFN_Vector1,id:9361,x:32618,y:31582,varname:node_9361,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:277,x:33660,y:31309,varname:node_277,prsc:2|A-2223-OUT,B-9945-OUT;n:type:ShaderForge.SFN_Clamp01,id:7045,x:34089,y:31415,varname:node_7045,prsc:2|IN-1279-OUT;n:type:ShaderForge.SFN_Multiply,id:2223,x:33228,y:31448,varname:node_2223,prsc:2|A-6640-RGB,B-2232-OUT;n:type:ShaderForge.SFN_Slider,id:475,x:34794,y:33058,ptovrint:False,ptlb:Glow,ptin:_Glow,varname:node_475,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:7061,x:34481,y:33512,ptovrint:False,ptlb:EdgeStrength,ptin:_EdgeStrength,varname:node_7061,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Fresnel,id:7282,x:34927,y:33460,varname:node_7282,prsc:2|EXP-7061-OUT;n:type:ShaderForge.SFN_Subtract,id:6252,x:35198,y:33388,varname:node_6252,prsc:2|A-7282-OUT,B-7996-RGB;n:type:ShaderForge.SFN_Color,id:7996,x:34941,y:33251,ptovrint:False,ptlb:node_7996,ptin:_node_7996,varname:node_7996,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:4847,x:35442,y:33133,ptovrint:False,ptlb:EdgeColor,ptin:_EdgeColor,varname:node_4847,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:8814,x:35668,y:33245,varname:node_8814,prsc:2|A-4847-RGB,B-6252-OUT;n:type:ShaderForge.SFN_Add,id:9909,x:35212,y:32995,varname:node_9909,prsc:2|A-475-OUT,B-6252-OUT;n:type:ShaderForge.SFN_Desaturate,id:9519,x:34975,y:32772,varname:node_9519,prsc:2|COL-9909-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:4618,x:34459,y:32764,ptovrint:False,ptlb:Add (0) or Multiply (1) Glow,ptin:_Add0orMultiply1Glow,varname:node_4618,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-248-OUT,B-8816-OUT;n:type:ShaderForge.SFN_Add,id:248,x:34246,y:32715,varname:node_248,prsc:2|A-5179-OUT,B-8814-OUT;n:type:ShaderForge.SFN_Multiply,id:8816,x:34246,y:32848,varname:node_8816,prsc:2|A-5179-OUT,B-8814-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:9966,x:34246,y:32542,ptovrint:False,ptlb:EdgeGlowOn?,ptin:_EdgeGlowOn,varname:node_9966,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5179-OUT,B-4618-OUT;n:type:ShaderForge.SFN_Vector3,id:4409,x:35418,y:32417,varname:node_4409,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_SwitchProperty,id:7338,x:35384,y:32114,ptovrint:False,ptlb:Add (0) or Multiply (1) Color,ptin:_Add0orMultiply1Color,varname:node_7338,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9468-OUT,B-4178-OUT;n:type:ShaderForge.SFN_Add,id:9468,x:35156,y:32077,varname:node_9468,prsc:2|A-4859-RGB,B-7207-RGB;proporder:4859-7338-7207-475-5179-6640-1279-2232-9966-4847-4618-7061-7996;pass:END;sub:END;*/

Shader "Tsuna/BeatSaber FX" {
    Properties {
        _MainTex ("MainTex", 2D) = "black" {}
        [MaterialToggle] _Add0orMultiply1Color ("Add (0) or Multiply (1) Color", Float ) = 1
        _MainColor ("MainColor", Color) = (1,1,1,1)
        _Glow ("Glow", Range(0, 1)) = 0
        [MaterialToggle] _SphereMapOn ("SphereMapOn?", Float ) = 1
        _SphereMap ("SphereMap", 2D) = "black" {}
        [MaterialToggle] _Add0orMultiply1Sphere ("Add (0) or Multiply (1) Sphere", Float ) = 1
        _SphereStrength ("SphereStrength", Range(0, 5)) = 1
        [MaterialToggle] _EdgeGlowOn ("EdgeGlowOn?", Float ) = 1
        _EdgeColor ("EdgeColor", Color) = (1,0,0,1)
        [MaterialToggle] _Add0orMultiply1Glow ("Add (0) or Multiply (1) Glow", Float ) = 0
        _EdgeStrength ("EdgeStrength", Range(0, 1)) = 1
        [HideInInspector]_node_7996 ("node_7996", Color) = (0,0,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
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
            uniform float4 _MainColor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _SphereMap; uniform float4 _SphereMap_ST;
            uniform fixed _Add0orMultiply1Sphere;
            uniform float _SphereStrength;
            uniform fixed _SphereMapOn;
            uniform float _Glow;
            uniform float _EdgeStrength;
            uniform float4 _node_7996;
            uniform float4 _EdgeColor;
            uniform fixed _Add0orMultiply1Glow;
            uniform fixed _EdgeGlowOn;
            uniform fixed _Add0orMultiply1Color;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 DiffuseData = lerp( (_MainTex_var.rgb+_MainColor.rgb), (_MainTex_var.rgb*_MainColor.rgb), _Add0orMultiply1Color );
                float2 node_5961 = ((normalize(mul( UNITY_MATRIX_V, float4(normalDirection,0) ).xyz.rgb)*0.5)+0.5).rg;
                float4 _SphereMap_var = tex2D(_SphereMap,TRANSFORM_TEX(node_5961, _SphereMap));
                float3 node_2223 = (_SphereMap_var.rgb*_SphereStrength);
                float3 node_9945 = DiffuseData;
                float3 DiffuseSphereData = saturate(lerp( (node_2223+node_9945), (node_9945*node_2223), _Add0orMultiply1Sphere ));
                float3 _SphereMapOn_var = lerp( DiffuseData, DiffuseSphereData, _SphereMapOn );
                float3 node_6252 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_EdgeStrength)-_node_7996.rgb);
                float3 node_8814 = (_EdgeColor.rgb*node_6252);
                float3 _EdgeGlowOn_var = lerp( _SphereMapOn_var, lerp( (_SphereMapOn_var+node_8814), (_SphereMapOn_var*node_8814), _Add0orMultiply1Glow ), _EdgeGlowOn );
                float3 finalColor = _EdgeGlowOn_var;
                float node_9519 = dot((_Glow+node_6252),float3(0.3,0.59,0.11));
                fixed4 finalRGBA = fixed4(finalColor,node_9519);
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
    FallBack "Toon/Basic"
    CustomEditor "ShaderForgeMaterialInspector"
}
