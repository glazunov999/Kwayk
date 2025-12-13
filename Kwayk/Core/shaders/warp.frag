#define PI 3.14159265359

vec2 warpOffset(vec2 uv);
vec2 warpAmp(vec2 uv);

void MAIN()
{
    vec2 uv = INPUT_UV;

    if (warped) {
        vec2 warp = time * 0.25 + uv;
        uv = (uv +  warpOffset(warp) * warpAmp(uv));
    }

    vec4 color = texture(INPUT, uv);

    FRAGCOLOR = color;
}

vec2 warpAmp(vec2 uv)
{
    float fx = sin(PI * 0.5);
    float fy = sin(PI * 0.5);

    fx = min(fx, fy);

    return (0.010 / 0.625) * vec2(fx, fx);
}

vec2 warpOffset(vec2 uv)
{
    float fx = sin(uv.y * PI * 2);
    float fy = cos(uv.x * PI * 2);

    return vec2(fx, fy);
}
