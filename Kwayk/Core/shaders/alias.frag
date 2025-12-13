void MAIN()
{
    vec3 base_color = texture(colorTex, vec2(UV0.x, 1.0 - UV0.y)).rgb;

    BASE_COLOR = vec4(base_color, alpha);
    EMISSIVE_COLOR = emissiveColor.rgb * emissiveIntensity;
}
