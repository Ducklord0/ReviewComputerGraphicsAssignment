Shader "Custom/WaterShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Tint("Colour Tint",Color) = (1,1,1,1)
        _Freq("Frequency",Range(0,5)) = 3
        _Speed("Speed",Range(0,100)) = 10
        _Amp("Applitude",Range(0,1)) = 0.5
        //_Time("Time",Range(0,10)) = 3
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 vertColor;
        };

        float4 _Tint;
        float _Freq;
        float _Speed;
        float _Amp;
        //float _Time;

        struct appdata {
            float4 vertex : POSITION;
            float3 normal : NORMAL; 
            float4 texcoord: TEXCOORD0;
            float4 texcoord1: TEXCOORD1;
            float4 texcoord2: TEXCOORD2;
        };

        void vert(inout appdata v, out Input o) {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            float t = _Time * _Speed;
            float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp +
                sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp;
            if (waveHeight>0) {
                waveHeight = 1*_Amp;
            }
            else {
                waveHeight = 0*_Amp;
            }
            v.vertex.y = v.vertex.y + waveHeight;
            v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
            o.vertColor = waveHeight + 2;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            float4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c * IN.vertColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
