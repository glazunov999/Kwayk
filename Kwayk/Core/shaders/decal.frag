VARYING vec2 texCoord;
VARYING float fade;

void MAIN()
{
    vec4 color = texture(colorTex, texCoord);
    FRAGCOLOR = vec4(color.rgb * alpha * fade, 0.0);
}
