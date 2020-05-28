Shader "Toybox/RimLight" { 
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
        [HDR] _RimColor ("Rim Color", Color) = (1, 1, 1, 1)
		[HDR] _CoreColor ("Core Color", Color) = (1, 1, 1, 1)
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _RimWidth ("Rim Width", Range(0,20.0)) = 0.7
		_CoreWidth ("Core Width", Range(0,20.0)) = 0.1
		_MinCoreDistance ("Min Core Distance", Range(0,20.0)) = 0.1
    } 
 
    SubShader {
        Tags { "RenderType" = "Transparent" "IgnoreProjector"="True"  "Queue" = "Transparent"}
        Cull off
        Lighting Off
        ZWrite Off
        Fog { Mode Off }
        Blend SrcAlpha OneMinusSrcAlpha
		
		Pass {
			ZWrite On
			ColorMask 0
		}
		
        Pass {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
				#include "RimLight.cginc"
            ENDCG
        }
    }
}