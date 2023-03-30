Shader "Custom/OutliningShader"
{
    Properties
    {
        _Outline ("Outline Width", Range(0.002,0.1)) = 0.005
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _OutlineColor2 ("Outline Color2", Color) = (0,0,0,1)
        _Color ("Color", Color) = (1,0,0,1)
        _MainTex ("Texture", 2D) = "white" {}
        
    }
    SubShader
    {
        ZWrite off
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };
        float _Outline;
        float4 _OutlineColor;
        float4 _Color;
        void vert(inout appdata_full v) {
            v.vertex.xyz += v.normal * _Outline;
        }

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Emission = _OutlineColor.rgb;

        }
        ENDCG
            ZWrite on
            ZWrite off
        Tags { "RenderType" = "Opaque" }
        CGPROGRAM
            // Physically based Standard lighting model, and enable shadows on all light types
            #pragma surface surf Lambert vertex:vert

            sampler2D _MainTex;

            struct Input
            {
                float2 uv_MainTex;
            };
            float _Outline;
            float4 _OutlineColor2;
            float4 _Color;
            void vert(inout appdata_full v) {
                v.vertex.xyz += v.normal * _Outline*0.5;
            }

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Emission = _OutlineColor2.rgb;

            }
            ENDCG
                ZWrite on
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        float4 _Color;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
        }
}
