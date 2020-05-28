// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:Toon/Basic,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:1042,x:35578,y:32520,varname:node_1042,prsc:2|normal-7134-RGB,emission-5958-OUT,custl-1303-OUT;n:type:ShaderForge.SFN_LightVector,id:5384,x:31624,y:32823,varname:node_5384,prsc:2;n:type:ShaderForge.SFN_Dot,id:6037,x:31624,y:32955,varname:node_6037,prsc:2,dt:4|A-5384-OUT,B-9218-OUT;n:type:ShaderForge.SFN_Append,id:6675,x:32286,y:32601,varname:node_6675,prsc:2|A-4405-OUT,B-9596-OUT;n:type:ShaderForge.SFN_Tex2d,id:4610,x:32510,y:32601,ptovrint:False,ptlb:RampMap,ptin:_RampMap,varname:node_4610,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-6675-OUT;n:type:ShaderForge.SFN_LightColor,id:147,x:32754,y:32862,cmnt:FALLOFF ONLY,varname:node_147,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:7134,x:35613,y:32330,ptovrint:False,ptlb:BumpMap,ptin:_BumpMap,varname:node_7134,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:7207,x:35162,y:32261,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7207,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4859,x:35162,y:32074,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4859,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1558,x:34693,y:32464,ptovrint:False,ptlb:EmissionMap,ptin:_EmissionMap,varname:node_1558,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:9978,x:34693,y:32664,ptovrint:False,ptlb:EmissionColor,ptin:_EmissionColor,varname:node_9978,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:4178,x:35361,y:32159,varname:node_4178,prsc:2|A-4859-RGB,B-7207-RGB;n:type:ShaderForge.SFN_Tex2d,id:6640,x:32995,y:31448,ptovrint:False,ptlb:SphereMap,ptin:_SphereMap,varname:node_6640,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False|UVIN-5961-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:1279,x:33904,y:31415,ptovrint:False,ptlb:Add (0) or Multiply (1) Sphere,ptin:_Add0orMultiply1Sphere,varname:node_1279,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-277-OUT,B-2510-OUT;n:type:ShaderForge.SFN_Multiply,id:2510,x:33660,y:31528,varname:node_2510,prsc:2|A-9945-OUT,B-2223-OUT;n:type:ShaderForge.SFN_Slider,id:2232,x:33150,y:31624,ptovrint:False,ptlb:SphereStrength,ptin:_SphereStrength,varname:node_2232,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_SwitchProperty,id:5179,x:34693,y:32901,ptovrint:False,ptlb:SphereMapOn?,ptin:_SphereMapOn,varname:node_5179,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3315-OUT,B-3295-OUT;n:type:ShaderForge.SFN_Multiply,id:4694,x:34989,y:32815,varname:node_4694,prsc:2|A-2631-OUT,B-5179-OUT;n:type:ShaderForge.SFN_Transform,id:754,x:32095,y:31448,varname:node_754,prsc:2,tffrom:0,tfto:3|IN-6850-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5961,x:32804,y:31448,varname:node_5961,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9634-OUT;n:type:ShaderForge.SFN_Normalize,id:925,x:32263,y:31448,varname:node_925,prsc:2|IN-754-XYZ;n:type:ShaderForge.SFN_Vector1,id:2793,x:32439,y:31582,varname:node_2793,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:9682,x:32439,y:31448,varname:node_9682,prsc:2|A-925-OUT,B-2793-OUT;n:type:ShaderForge.SFN_Add,id:9634,x:32618,y:31448,varname:node_9634,prsc:2|A-9682-OUT,B-9361-OUT;n:type:ShaderForge.SFN_Color,id:1165,x:32754,y:32560,ptovrint:False,ptlb:RampColor,ptin:_RampColor,varname:node_1165,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_NormalVector,id:9218,x:31624,y:33113,prsc:2,pt:True;n:type:ShaderForge.SFN_NormalVector,id:6850,x:31933,y:31448,prsc:2,pt:True;n:type:ShaderForge.SFN_Set,id:1173,x:35576,y:32159,varname:DiffuseData,prsc:2|IN-4178-OUT;n:type:ShaderForge.SFN_Get,id:3315,x:34449,y:32815,varname:node_3315,prsc:2|IN-1173-OUT;n:type:ShaderForge.SFN_Set,id:918,x:34275,y:31415,varname:DiffuseSphereData,prsc:2|IN-7045-OUT;n:type:ShaderForge.SFN_Get,id:3295,x:34449,y:32901,varname:node_3295,prsc:2|IN-918-OUT;n:type:ShaderForge.SFN_Get,id:9945,x:33639,y:31451,varname:node_9945,prsc:2|IN-1173-OUT;n:type:ShaderForge.SFN_Vector1,id:9361,x:32618,y:31582,varname:node_9361,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Blend,id:1303,x:35243,y:32789,varname:node_1303,prsc:2,blmd:5,clmp:True|SRC-5958-OUT,DST-4694-OUT;n:type:ShaderForge.SFN_Set,id:716,x:33628,y:32966,varname:LightData,prsc:2|IN-7395-OUT;n:type:ShaderForge.SFN_Get,id:2631,x:34682,y:32815,varname:node_2631,prsc:2|IN-716-OUT;n:type:ShaderForge.SFN_Add,id:277,x:33660,y:31309,varname:node_277,prsc:2|A-2223-OUT,B-9945-OUT;n:type:ShaderForge.SFN_Clamp01,id:7045,x:34089,y:31415,varname:node_7045,prsc:2|IN-1279-OUT;n:type:ShaderForge.SFN_Multiply,id:2223,x:33228,y:31448,varname:node_2223,prsc:2|A-6640-RGB,B-2232-OUT;n:type:ShaderForge.SFN_Multiply,id:4521,x:32754,y:32718,varname:node_4521,prsc:2|A-1165-RGB,B-4610-RGB,C-9596-OUT,D-147-RGB;n:type:ShaderForge.SFN_Multiply,id:5958,x:34989,y:32604,varname:node_5958,prsc:2|A-1558-RGB,B-9978-RGB;n:type:ShaderForge.SFN_Code,id:456,x:32450,y:33153,varname:node_456,prsc:2,code:cgBlAHQAdQByAG4AIABTAGgAYQBkAGUAUwBIADkAKABoAGEAbABmADQAKABuAG8AcgBtAGEAbAAsACAAMQAuADAAKQApADsACgA=,output:2,fname:Sample,width:317,height:112,input:2,input_1_label:normal|A-9218-OUT;n:type:ShaderForge.SFN_Vector1,id:4405,x:32286,y:32519,varname:node_4405,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:2543,x:35243,y:32652,cmnt:use?,varname:node_2543,prsc:2|A-8387-OUT,B-5958-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:9480,x:34989,y:32448,varname:node_9480,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:2586,x:31624,y:32517,cmnt:shadows only,varname:node_2586,prsc:2;n:type:ShaderForge.SFN_Dot,id:9528,x:31624,y:32666,varname:node_9528,prsc:2,dt:4|A-2586-OUT,B-5384-OUT;n:type:ShaderForge.SFN_Normalize,id:8387,x:35243,y:32448,varname:node_8387,prsc:2|IN-9480-OUT;n:type:ShaderForge.SFN_Multiply,id:9596,x:32005,y:32778,varname:node_9596,prsc:2|A-9528-OUT,B-6037-OUT;n:type:ShaderForge.SFN_Add,id:7395,x:33168,y:32957,varname:node_7395,prsc:2|A-4521-OUT,B-456-OUT;proporder:4859-7207-4610-1165-7134-1558-9978-5179-6640-1279-2232;pass:END;sub:END;*/

Shader "Tsuna/Shading FX" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _RampMap ("RampMap", 2D) = "bump" {}
        _RampColor ("RampColor", Color) = (1,1,1,1)
        _BumpMap ("BumpMap", 2D) = "bump" {}
        _EmissionMap ("EmissionMap", 2D) = "white" {}
        [HDR]_EmissionColor ("EmissionColor", Color) = (0,0,0,1)
        [MaterialToggle] _SphereMapOn ("SphereMapOn?", Float ) = 0
        _SphereMap ("SphereMap", 2D) = "black" {}
        [MaterialToggle] _Add0orMultiply1Sphere ("Add (0) or Multiply (1) Sphere", Float ) = 0
        _SphereStrength ("SphereStrength", Range(0, 5)) = 1
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _RampMap; uniform float4 _RampMap_ST;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform float4 _EmissionColor;
            uniform sampler2D _SphereMap; uniform float4 _SphereMap_ST;
            uniform fixed _Add0orMultiply1Sphere;
            uniform float _SphereStrength;
            uniform fixed _SphereMapOn;
            uniform float4 _RampColor;
            float3 Sample( float3 normal ){
            return ShadeSH9(half4(normal, 1.0));
            
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 node_5958 = (_EmissionMap_var.rgb*_EmissionColor.rgb);
                float3 emissive = node_5958;
                float node_9596 = (0.5*dot(attenuation,lightDirection)+0.5*0.5*dot(lightDirection,normalDirection)+0.5);
                float2 node_6675 = float2(0.5,node_9596);
                float4 _RampMap_var = tex2D(_RampMap,TRANSFORM_TEX(node_6675, _RampMap));
                float3 LightData = ((_RampColor.rgb*_RampMap_var.rgb*node_9596*_LightColor0.rgb)+Sample( normalDirection ));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 DiffuseData = (_MainTex_var.rgb*_Color.rgb);
                float2 node_5961 = ((normalize(mul( UNITY_MATRIX_V, float4(normalDirection,0) ).xyz.rgb)*0.5)+0.5).rg;
                float4 _SphereMap_var = tex2D(_SphereMap,TRANSFORM_TEX(node_5961, _SphereMap));
                float3 node_2223 = (_SphereMap_var.rgb*_SphereStrength);
                float3 node_9945 = DiffuseData;
                float3 DiffuseSphereData = saturate(lerp( (node_2223+node_9945), (node_9945*node_2223), _Add0orMultiply1Sphere ));
                float3 finalColor = emissive + saturate(max(node_5958,(LightData*lerp( DiffuseData, DiffuseSphereData, _SphereMapOn ))));
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _RampMap; uniform float4 _RampMap_ST;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform float4 _EmissionColor;
            uniform sampler2D _SphereMap; uniform float4 _SphereMap_ST;
            uniform fixed _Add0orMultiply1Sphere;
            uniform float _SphereStrength;
            uniform fixed _SphereMapOn;
            uniform float4 _RampColor;
            float3 Sample( float3 normal ){
            return ShadeSH9(half4(normal, 1.0));
            
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
                float3 node_5958 = (_EmissionMap_var.rgb*_EmissionColor.rgb);
                float node_9596 = (0.5*dot(attenuation,lightDirection)+0.5*0.5*dot(lightDirection,normalDirection)+0.5);
                float2 node_6675 = float2(0.5,node_9596);
                float4 _RampMap_var = tex2D(_RampMap,TRANSFORM_TEX(node_6675, _RampMap));
                float3 LightData = ((_RampColor.rgb*_RampMap_var.rgb*node_9596*_LightColor0.rgb)+Sample( normalDirection ));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 DiffuseData = (_MainTex_var.rgb*_Color.rgb);
                float2 node_5961 = ((normalize(mul( UNITY_MATRIX_V, float4(normalDirection,0) ).xyz.rgb)*0.5)+0.5).rg;
                float4 _SphereMap_var = tex2D(_SphereMap,TRANSFORM_TEX(node_5961, _SphereMap));
                float3 node_2223 = (_SphereMap_var.rgb*_SphereStrength);
                float3 node_9945 = DiffuseData;
                float3 DiffuseSphereData = saturate(lerp( (node_2223+node_9945), (node_9945*node_2223), _Add0orMultiply1Sphere ));
                float3 finalColor = saturate(max(node_5958,(LightData*lerp( DiffuseData, DiffuseSphereData, _SphereMapOn ))));
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
