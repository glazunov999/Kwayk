#define PI 3.14159265359

void MAIN()
{
    vec2 uv = vec2(UV0.x, 1.0 - UV0.y) + vec2(sin(UV0.y * PI + time), sin(UV0.x * PI + time)) * 0.125;
    vec3 baseColor = texture(colorTex, uv).rgb;
    BASE_COLOR = vec4(baseColor.rgb, alpha);
    EMISSIVE_COLOR = emissiveColor.rgb * emissiveIntensity;
}
