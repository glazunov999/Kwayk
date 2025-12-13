VARYING vec3 texCoord;

void MAIN()
{
    vec2 uv = normalize(texCoord).xz * (189.0 / 64.0);
    uv.y = -uv.y;

    vec4 alpha_color = texture(alphaColorTex, uv + time1);
    vec4 solid_color = texture(solidColorTex, uv + time2);

    FRAGCOLOR = vec4(mix(solid_color.rgb, alpha_color.rgb, alpha_color.a), 1.0);
}
