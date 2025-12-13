void MAIN()
{
    vec4 c = texture(tex, TEXTURE_UV);
    FRAGCOLOR = mix(texture(INPUT, INPUT_UV), c, alpha);
}
