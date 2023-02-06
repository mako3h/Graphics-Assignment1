Shader "Custom/Specular"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)  //base color
        _MetallicTex("Metallic (R)", 2D) = "white" {}  //2d texture that controls the metallic reflection
        _SpecColor("Specular", Color) = (1,1,1,1)   //color of specular lighting
    }
        SubShader{
            Tags
            {
                "Queue" = "Geometry"
            }

            CGPROGRAM

            #pragma surface surf StandardSpecular

            sampler2D _MetallicTex;
            half _Metallic;
            fixed4 _Color;

            struct Input
            {
                float2 uv_MetallicTex;
            };

            void surf(Input IN, inout SurfaceOutputStandardSpecular o)
            {
                o.Albedo = _Color.rgb;  //base color
                o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r; //this determines lvl of smoothness
                o.Specular = _Metallic; //specular reflection strength
                o.Specular = _SpecColor.rgb; //color of specular
            }
            ENDCG
        }
            FallBack "Diffuse"  //if cant be rendered, then it fallback to the original diffuse shader
}