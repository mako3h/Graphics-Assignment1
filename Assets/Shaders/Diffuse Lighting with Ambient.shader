Shader "Custom/Diffuse Lighting with Ambient"
{
    Properties{
       _MainTex("Texture", 2D) = "white" {}
       _LightColor("Light Color", Color) = (1, 1, 1, 1)
       _AmbientStrength("Ambient Strength", Float) = 0.2
       _DiffuseStrength("Diffuse Strength", Float) = 1.0
    }

        SubShader{
            Tags {"RenderType" = "Opaque"}
            Tags {"LightMode" = "ForwardBase"}
            LOD 200

            Pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "UnityCG.cginc"

                struct appdata {
                    float4 vertex : POSITION;
                    float2 uv : TEXCOORD0;
                };

                struct v2f {
                    float2 uv : TEXCOORD0;
                    float3 worldPos : TEXCOORD1;
                    float3 worldNormal : TEXCOORD2;
                };

                sampler2D _MainTex;
                float4 _MainTex_ST;
                float4 _LightColor;
                float _AmbientStrength;
                float _DiffuseStrength;

                v2f vert(appdata v) {
                    v2f o;
                    o.uv = mul(v.uv, _MainTex_ST.xy);
                    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                    o.worldNormal = normalize(mul(float4(0, 0, 1, 0), unity_WorldToObject).xyz);
                    return o;
                }

                fixed4 frag(v2f i) : SV_Target {
                    fixed4 col = tex2D(_MainTex, i.uv);
                    float diffuse = max(0, dot(i.worldNormal, normalize(_WorldSpaceLightPos0.xyz)));
                    return col * (_LightColor * (diffuse * _DiffuseStrength + _AmbientStrength) * _LightColor.w);
                }
                ENDCG
            }
            UsePass "Lighting/GI/Prepass"
            UsePass "Lighting/GI/Base"
       }
           FallBack "Diffuse"
}