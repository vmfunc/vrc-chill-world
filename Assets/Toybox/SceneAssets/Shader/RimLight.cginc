#include "UnityCG.cginc"

struct appdata {
	float4 vertex : POSITION;
	float3 normal : NORMAL;
	float2 texcoord : TEXCOORD0;
};

struct v2f {
	float4 pos : SV_POSITION;
	float2 uv : TEXCOORD0;
	float4 worldPos : TEXCOORD1;
	float3 worldNormal : TEXCOORD2;
};

uniform sampler2D _MainTex;
uniform float4 _MainTex_ST;
uniform float4 _Color;
uniform float4 _RimColor;
uniform float4 _CoreColor;
half _RimWidth;
half _CoreWidth;
half _MinCoreDistance;
half _MaxDistance;
half _NormalDistance;

v2f ScreenSpace_vert (appdata_base v) {
	float distance = length(WorldSpaceViewDir(float4(0,0,0,1)));
	float scale = min(distance / _NormalDistance, _MaxDistance);
	
	v2f o;
	o.pos = UnityObjectToClipPos(v.vertex * scale);
	o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
	o.worldPos = v.vertex;
	o.worldNormal = v.normal;
 
	return o;
}

v2f vert (appdata_base v) {				
	v2f o;
	o.pos = UnityObjectToClipPos(v.vertex);
	o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
	o.worldPos = v.vertex;
	o.worldNormal = v.normal;
 
	return o;
}

float4 frag(v2f i) : COLOR {
	float3 viewVec = ObjSpaceViewDir(i.worldPos);
	float3 viewDir = normalize(viewVec);
	float viewLen = length(viewVec);
	float dotProduct = abs(dot(i.worldNormal, viewDir));
	float oneMinusDot = 1 - dotProduct;
	float distanceFactor = max(saturate(viewLen / _MinCoreDistance), 0.3);
	
	float rimWeight = saturate(smoothstep(1 - _RimWidth, 1.0, oneMinusDot));
	float coreWeight = saturate(smoothstep(1 - _CoreWidth, 1.0, dotProduct)) * distanceFactor;

	float4 color = tex2D(_MainTex, i.uv) * _Color;
	color += _RimColor * rimWeight;
	color += _CoreColor * coreWeight;
	color.a = saturate(color.a);
	return color;
}