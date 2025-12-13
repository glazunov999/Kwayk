void MAIN()
{
    vec2 uv = INPUT_UV;
    vec2 center = vec2(0.5, 0.5);
    vec2 dir = uv - center;
    float dist = length(dir);

    float warp = intensity * 0.5;
    float distortion = 1.0 + warp * (1.0 - dist * 2.0);
    vec2 warpedUV = center + dir * distortion;

    vec4 col = texture(INPUT, warpedUV);

    FRAGCOLOR = col;
}

