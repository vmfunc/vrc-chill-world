// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tsuna/Overlay Shift FX"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_Color("Color", Color) = (0,0,0,0)
		[Toggle]_MainEmission("MainEmission", Float) = 0
		_EmissionMap("EmissionMap", 2D) = "white" {}
		_EmissionColor("EmissionColor", Color) = (0,0,0,0)
		[Toggle]_MainPulse("MainPulse", Float) = 0
		_MainPulseSpeed("MainPulseSpeed", Range( 0 , 1)) = 0.3
		_OverlayMainMap("OverlayMainMap", 2D) = "white" {}
		_OverlayMainColor("OverlayMainColor", Color) = (0,0,0,0)
		[Toggle]_OverlayEmission("OverlayEmission", Float) = 0
		_OverlayEmissiveMap("OverlayEmissiveMap", 2D) = "white" {}
		_OverlayEmissiveColor("OverlayEmissiveColor", Color) = (0,0,0,0)
		[Toggle]_OverlayPulse("OverlayPulse", Float) = 0
		_OverlayPulseSpeed("OverlayPulseSpeed", Range( 0 , 1)) = 0.3
		_SpeedY("SpeedY", Range( 0 , 1)) = 0.01
		_SpeedX("SpeedX", Range( 0 , 1)) = 0.01
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform float4 _Color;
		uniform sampler2D _OverlayMainMap;
		uniform float _SpeedX;
		uniform float _SpeedY;
		uniform float4 _OverlayMainColor;
		uniform float _MainEmission;
		uniform float _MainPulse;
		uniform sampler2D _EmissionMap;
		uniform float4 _EmissionMap_ST;
		uniform float4 _EmissionColor;
		uniform float _MainPulseSpeed;
		uniform float _OverlayEmission;
		uniform float _OverlayPulse;
		uniform sampler2D _OverlayEmissiveMap;
		uniform float4 _OverlayEmissiveColor;
		uniform float _OverlayPulseSpeed;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 appendResult27 = (float2(_SpeedX , _SpeedY));
			float2 panner23 = ( 1.0 * _Time.y * appendResult27 + i.uv_texcoord);
			o.Albedo = ( ( tex2D( _MainTex, uv_MainTex ) * _Color ) + ( tex2D( _OverlayMainMap, panner23 ) * _OverlayMainColor ) ).rgb;
			float4 color2 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float2 uv_EmissionMap = i.uv_texcoord * _EmissionMap_ST.xy + _EmissionMap_ST.zw;
			float4 temp_output_29_0 = ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissionColor );
			float mulTime38 = _Time.y * _MainPulseSpeed;
			float4 color37 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 temp_output_35_0 = ( tex2D( _OverlayEmissiveMap, panner23 ) * _OverlayEmissiveColor );
			float mulTime16 = _Time.y * _OverlayPulseSpeed;
			o.Emission = ( lerp(color2,lerp(temp_output_29_0,( temp_output_29_0 * (0.0 + (sin( mulTime38 ) - -1.0) * (3.0 - 0.0) / (1.0 - -1.0)) ),_MainPulse),_MainEmission) * lerp(color37,lerp(temp_output_35_0,( temp_output_35_0 * (0.0 + (sin( mulTime16 ) - -1.0) * (3.0 - 0.0) / (1.0 - -1.0)) ),_OverlayPulse),_OverlayEmission) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
809;887;1906;1004;2698.963;704.2228;1.3;True;False
Node;AmplifyShaderEditor.RangedFloatNode;26;-2559.371,234.6939;Float;False;Property;_SpeedY;SpeedY;14;0;Create;True;0;0;False;0;0.01;0.417;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-2560.572,71.794;Float;False;Property;_SpeedX;SpeedX;15;0;Create;True;0;0;False;0;0.01;0.322;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;22;-2326.072,-117.706;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;27;-2214.889,106.4496;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1211.139,756.0596;Float;False;Property;_OverlayPulseSpeed;OverlayPulseSpeed;13;0;Create;True;0;0;False;0;0.3;0.486;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-1221.518,-629.8867;Float;False;Property;_MainPulseSpeed;MainPulseSpeed;6;0;Create;True;0;0;False;0;0.3;0.486;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;23;-2043.668,56.49395;Float;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;16;-1402.01,756.5937;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;38;-1397.191,-628.9763;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;28;-1658.962,-839.2628;Float;False;Property;_EmissionColor;EmissionColor;4;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;7;-1699.676,-1048.848;Float;True;Property;_EmissionMap;EmissionMap;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;33;-1692.655,251.8244;Float;True;Property;_OverlayEmissiveMap;OverlayEmissiveMap;10;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;13;-1380.686,671.7231;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;34;-1651.148,496.2378;Float;False;Property;_OverlayEmissiveColor;OverlayEmissiveColor;11;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinOpNode;40;-1375.735,-746.3275;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;41;-1233.422,-852.282;Float;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;11;-1222.389,497.208;Float;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-1183.745,344.6013;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-1180.792,-959.0573;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;43;-945.6587,415.9882;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-929.0931,-861.121;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;2;-894.9133,-731.3505;Float;False;Constant;_Color0;Color 0;1;1;[HideInInspector];Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;8;-1707.544,-552.4164;Float;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;9;-1714.987,-126.8476;Float;True;Property;_OverlayMainMap;OverlayMainMap;7;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;30;-1661.838,-346.5803;Float;False;Property;_Color;Color;1;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;37;-926.9908,535.1545;Float;False;Constant;_Color1;Color 1;1;1;[HideInInspector];Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;42;-729.9501,339.3622;Float;False;Property;_OverlayPulse;OverlayPulse;12;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;45;-740.2816,-962.2987;Float;False;Property;_MainPulse;MainPulse;5;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;18;-1664.577,69.38193;Float;False;Property;_OverlayMainColor;OverlayMainColor;8;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-1315.124,-486.5911;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;1;-496.0107,-856.2256;Float;False;Property;_MainEmission;MainEmission;2;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;36;-440.4965,415.996;Float;False;Property;_OverlayEmission;OverlayEmission;9;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1305.445,-70.14789;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-162.6439,-195.1058;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;48;-890.6738,-324.0089;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;198.8733,-326.0334;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Tsuna/Overlay Shift FX;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;27;0;25;0
WireConnection;27;1;26;0
WireConnection;23;0;22;0
WireConnection;23;2;27;0
WireConnection;16;0;15;0
WireConnection;38;0;39;0
WireConnection;33;1;23;0
WireConnection;13;0;16;0
WireConnection;40;0;38;0
WireConnection;41;0;40;0
WireConnection;11;0;13;0
WireConnection;35;0;33;0
WireConnection;35;1;34;0
WireConnection;29;0;7;0
WireConnection;29;1;28;0
WireConnection;43;0;35;0
WireConnection;43;1;11;0
WireConnection;44;0;29;0
WireConnection;44;1;41;0
WireConnection;9;1;23;0
WireConnection;42;0;35;0
WireConnection;42;1;43;0
WireConnection;45;0;29;0
WireConnection;45;1;44;0
WireConnection;31;0;8;0
WireConnection;31;1;30;0
WireConnection;1;0;2;0
WireConnection;1;1;45;0
WireConnection;36;0;37;0
WireConnection;36;1;42;0
WireConnection;32;0;9;0
WireConnection;32;1;18;0
WireConnection;47;0;1;0
WireConnection;47;1;36;0
WireConnection;48;0;31;0
WireConnection;48;1;32;0
WireConnection;0;0;48;0
WireConnection;0;2;47;0
ASEEND*/
//CHKSM=93E35D7EFED75E1A6528CDA58F6CF1CBF4AFA1B8