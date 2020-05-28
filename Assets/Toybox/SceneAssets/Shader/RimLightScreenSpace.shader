Shader "Toybox/RimLightScreenSpace" { 
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
        [HDR] _RimColor ("Rim Color", Color) = (1, 1, 1, 1)
		[HDR] _CoreColor ("Core Color", Color) = (1, 1, 1, 1)
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _RimWidth ("Rim Width", Range(0,20.0)) = 0.7
		_CoreWidth ("Core Width", Range(0,20.0)) = 0.1
		_MinCoreDistance ("Min Core Distance", Range(0,20.0)) = 0.1
		_MaxDistance ("Max Distance", Float) = 250
		_NormalDistance ("Normal Distance", Float) = 100
    }
 
    SubShader {
        Tags { "RenderType" = "Transparent" "IgnoreProjector"="True"  "Queue" = "Transparent"}
        Cull back
        Lighting Off
		ZTest Always
        ZWrite Off
        Fog { Mode Off }
        Blend SrcAlpha OneMinusSrcAlpha
		
		Pass {
			ZWrite On
			ColorMask 0
			
			CGPROGRAM
				#pragma vertex ScreenSpace_vert
				#pragma fragment frag
				#include "RimLight.cginc"
			ENDCG
		}
		
        Pass {
            CGPROGRAM
				#pragma vertex ScreenSpace_vert
                #pragma fragment frag
				#include "RimLight.cginc"
            ENDCG
        }
    }
}