Shader "Toybox/ProjectorSplat" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
		_SplatTex ("Cookie", 2D) = "gray" {}
	}
	Subshader {
		Tags {"Queue"="Transparent"}
		Pass {
			ZWrite Off
			ColorMask RGB
			Blend SrcAlpha OneMinusSrcAlpha
			Offset -1, -1

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fog
			#include "UnityCG.cginc"
			
			struct v2f {
				float4 uvSplat : TEXCOORD0;
				UNITY_FOG_COORDS(2)
				float4 pos : SV_POSITION;
			};
			
			float4x4 unity_Projector;
			float4x4 unity_ProjectorClip;
			
			v2f vert (float4 vertex : POSITION)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(vertex);
				o.uvSplat = mul (unity_Projector, vertex);
				UNITY_TRANSFER_FOG(o,o.pos);
				return o;
			}
			
			fixed4 _Color;
			sampler2D _SplatTex;
			
			fixed4 frag (v2f i) : SV_Target
			{
				if (i.uvSplat.z > 1 || i.uvSplat.z < -1)
					discard;
				fixed4 sample = tex2Dproj (_SplatTex, UNITY_PROJ_COORD(i.uvSplat));
				if (sample.a < 0.1)
					discard;
				sample *= _Color;

				UNITY_APPLY_FOG_COLOR(i.fogCoord, sample, fixed4(1,1,1,1));
				return sample;
			}
			ENDCG
		}
	}
}
