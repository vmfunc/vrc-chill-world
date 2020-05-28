// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tsuna/Rainbow Reflect Chroma FX"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_Saturation("Saturation", Range( -10 , 10)) = 1
		_Strength("Strength", Range( -10 , 10)) = 1
		_Speed("Speed", Range( -2 , 2)) = 1
		_Value("Value", Range( -10 , 10)) = 1
		_Width("Width", Range( -10 , 10)) = 1
		_R("R", Range( -10 , 10)) = 1
		_G("G", Range( -10 , 10)) = 1
		_B("B", Range( -10 , 10)) = 1
		_Color0("Color 0", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float2 uv_texcoord;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float _Strength;
		uniform float _Speed;
		uniform float _R;
		uniform float _Width;
		uniform float _G;
		uniform float _B;
		uniform float _Saturation;
		uniform float _Value;
		uniform float4 _Color0;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV20 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode20 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV20, 5.0 ) );
			float clampResult31 = clamp( fresnelNode20 , 0.0 , 1.0 );
			float3 break16 = ( ase_worldNormal / _Width );
			float4 appendResult12 = (float4(( _R * break16.x ) , ( _G * break16.y ) , ( _B * break16.z ) , 0.0));
			float3 hsvTorgb17 = HSVToRGB( float3(( ( _Time.y * _Speed ) + appendResult12 ).x,_Saturation,_Value) );
			float3 clampResult32 = clamp( hsvTorgb17 , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 temp_output_21_0 = ( clampResult31 * clampResult32 );
			float4 color30 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float4 blendOpSrc28 = ( _Strength * ( float4( temp_output_21_0 , 0.0 ) - color30 ) );
			float4 blendOpDest28 = ( _Color0 * tex2D( _MainTex, uv_MainTex ) );
			o.Albedo = ( saturate( ( blendOpDest28/ ( 1.0 - blendOpSrc28 ) ) )).rgb;
			o.Emission = temp_output_21_0;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float3 worldNormal : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16500
717;469;2179;1352;467.6727;459.4716;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;14;-1934.239,516.6477;Float;False;Property;_Width;Width;5;0;Create;True;0;0;False;0;1;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;5;-1912.239,292.6477;Float;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;13;-1650.239,286.6477;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;16;-1473.239,355.6477;Float;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;9;-1119.239,277.6477;Float;False;Property;_R;R;6;0;Create;True;0;0;False;0;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-1121.239,488.6477;Float;False;Property;_G;G;7;0;Create;True;0;0;False;0;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1124.239,715.6477;Float;False;Property;_B;B;8;0;Create;True;0;0;False;0;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-1064.239,588.6477;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-1112.239,123.6477;Float;False;Property;_Speed;Speed;3;0;Create;True;0;0;False;0;1;1;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1;-1138.239,-55.35229;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-1058.239,821.6477;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1067.239,385.6477;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-875.239,-71.35229;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;12;-760.239,352.6477;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4;-557.239,186.6477;Float;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-419.239,706.6477;Float;False;Property;_Saturation;Saturation;1;0;Create;True;0;0;False;0;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-419.239,815.6477;Float;False;Property;_Value;Value;4;0;Create;True;0;0;False;0;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;17;-369.239,417.6477;Float;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FresnelNode;20;-410.6011,169.331;Float;True;Standard;WorldNormal;ViewDir;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;32;-104.324,426.3265;Float;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;31;-74.08273,241.5002;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;30;-172.8662,2.043152;Float;False;Constant;_white;white;10;0;Create;True;0;0;False;0;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;173.5338,327.3432;Float;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;29;105.1338,13.04315;Float;False;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;23;-493.8662,-197.9568;Float;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;24;-437.8662,-392.9568;Float;False;Property;_Color0;Color 0;9;0;Create;True;0;0;False;0;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;27;-197.8662,-484.9568;Float;False;Property;_Strength;Strength;2;0;Create;True;0;0;False;0;1;1;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-88.86621,-235.9568;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;177.1338,-394.9568;Float;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;28;503.0219,-316.537;Float;True;ColorDodge;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;914,-32;Float;False;True;2;Float;ASEMaterialInspector;0;0;CustomLighting;Tsuna/Rainbow Reflect Chroma FX;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;13;0;5;0
WireConnection;13;1;14;0
WireConnection;16;0;13;0
WireConnection;7;0;10;0
WireConnection;7;1;16;1
WireConnection;8;0;11;0
WireConnection;8;1;16;2
WireConnection;6;0;9;0
WireConnection;6;1;16;0
WireConnection;2;0;1;0
WireConnection;2;1;3;0
WireConnection;12;0;6;0
WireConnection;12;1;7;0
WireConnection;12;2;8;0
WireConnection;4;0;2;0
WireConnection;4;1;12;0
WireConnection;17;0;4;0
WireConnection;17;1;19;0
WireConnection;17;2;18;0
WireConnection;32;0;17;0
WireConnection;31;0;20;0
WireConnection;21;0;31;0
WireConnection;21;1;32;0
WireConnection;29;0;21;0
WireConnection;29;1;30;0
WireConnection;25;0;24;0
WireConnection;25;1;23;0
WireConnection;26;0;27;0
WireConnection;26;1;29;0
WireConnection;28;0;26;0
WireConnection;28;1;25;0
WireConnection;0;0;28;0
WireConnection;0;2;21;0
ASEEND*/
//CHKSM=8E7695CC081E304B7638091327975DFD4673768B