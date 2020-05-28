// Global
int _RenderMode, _CullingMode, _Outline, _ZWrite, _ATM, _ShatterToggle, _PreserveCol;
float4 _OutlineCol, _WFColor;
float _Opacity, _Cutoff, _OutlineThicc;
float _ShatterMax, _ShatterMin, _ShatterSpread, _ShatterCull, _WFFill, _WFSmoothing, _WFThickness;

// Post Filters
int _FilterModel, _AutoShift;
float _SaturationRGB, _Contrast, _Brightness, _RAmt, _GAmt, _BAmt;
float _SaturationHSL, _AutoShiftSpeed, _Hue, _Luminance, _HSLMin, _HSLMax;

// Base
UNITY_DECLARE_TEX2D(_MainTex); float4 _MainTex_ST;
UNITY_DECLARE_TEX2D(_EmissionMap); float4 _EmissionMap_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissMask); float4 _EmissMask_ST;
float4 _Color, _EmissionColor;

// Advanced Emission
int _UsingMask, _ReactToggle, _CrossMode;
float _XScroll, _YScroll, _PulseSpeed, _Crossfade, _ReactThresh;

// Global Shading
sampler2D _BumpMap;
sampler2D _DetailNormalMap; float4 _DetailNormalMap_ST;
sampler2D _RimMask; float4 _RimMask_ST;
sampler2D _RimTex; float4 _RimTex_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap); float4 _DetailAlbedoMap_ST;
UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailMask); float4 _DetailMask_ST;
float4 _RimCol;
float _RimMaskStr, _RimStrength, _RimWidth, _RimEdge;
float _BumpScale, _DetailNormalMapScale, _DetailMaskStr;

// Toon Shading
sampler2D _ShadowRamp;
UNITY_DECLARE_TEX2D_NOSAMPLER(_TranslucencyMap);
UNITY_DECLARE_TEX2D_NOSAMPLER(_LightMask);
int _EnableShadowRamp, _Reflections, _FakeSpec, _Subsurface;
float4 _SpecCol, _SColor;
float _ShadowStr, _RampWidth;
float _ReflSmooth;
float _SpecStr, _SpecSize, _SpecBias;
float _SStrength, _SPen, _SSharp;

// PBR Shading
sampler2D _MetallicGlossMap;
sampler2D _SpecGlossMap;
sampler2D _OcclusionMap;
sampler2D _ParallaxMap;
samplerCUBE _ReflCube;
int _PBRWorkflow, _SourceAlpha, _InvertRough, _March, _UseReflCube, _ReflCubeFallback;
float4 _PBRSpecCol;
float _Metallic, _Glossiness, _GlossMapScale, _OcclusionStrength, _Parallax, _HeightContrast;

// Outputs
float omr;
float3 specularTint;

struct appdata {
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
    float4 tangent : TANGENT;
    float3 normal : NORMAL;
};

struct v2g {
    float4 pos : POSITION;
    float4 uv : TEXCOORD0;
    float3 cameraPos : TEXCOORD1;
    float3 worldPos : TEXCOORD2;
    float3 binormal : TEXCOORD3; 
    float2 uvd : TEXCOORD4;
    float3 tangentViewDir : TEXCOORD5;
    float4 vertex : TEXCOORD6;
    float4 tangent : TANGENT;
    float3 normal : NORMAL;
    SHADOW_COORDS(13)
    UNITY_FOG_COORDS(14)
};
            
struct g2f {
    float4 pos : SV_POSITION;
    float4 uv : TEXCOORD0;
    float3 cameraPos : TEXCOORD1;
    float3 worldPos : TEXCOORD2;
    float3 binormal : TEXCOORD3;
    float2 uvd : TEXCOORD4;
    float3 tangentViewDir : TEXCOORD5;
    float3 bCoords : TEXCOORD6;
    float WFAmt : TEXCOORD7;
    bool isOutline : TEXCOORD8;
    float4 tangent : TANGENT;
    float3 normal : NORMAL;
    float4 color : COLOR;
    SHADOW_COORDS(13)
    UNITY_FOG_COORDS(14)
};

struct v2f {
    float4 pos : SV_POSITION;
    float2 uv : TEXCOORD0;
    float3 worldPos : TEXCOORD1;
    float3 binormal : TEXCOORD2;
    float2 uvd : TEXCOORD3;
    float3 tangentViewDir : TEXCOORD4;
    float4 tangent : TANGENT;
    float3 normal : NORMAL;
    SHADOW_COORDS(13)
    UNITY_FOG_COORDS(14)
};

struct lighting {
    float NdotL;
    float3 lightCol;
    float3 indirectCol;
    float3 lightDir; 
    float3 viewDir; 
    float3 halfVector; 
    float3 bumpMap;
    float3 detailNormal; 
    float3 tangentNormals; 
    float3 binormal;
    float3 normalDir;
    float3 reflectionDir;
};