VARYING vec2 texCoord;
VARYING float fade;

void MAIN()
{
    texCoord = UV0;
    fade = COLOR.a;
    vec3 pos = VERTEX + (NORMAL * depthBias);
    POSITION = MODELVIEWPROJECTION_MATRIX * vec4(pos, 1.0);
}
