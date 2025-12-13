void MAIN()
{
    vec4 col = texture(INPUT, INPUT_UV);
    col.rgb = mix(col.rgb, color.rgb, color.a);
    FRAGCOLOR = col;
}
