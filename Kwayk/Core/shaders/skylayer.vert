VARYING vec3 texCoord;

void MAIN()
{
    vec3 pos = VERTEX;
    texCoord = pos - CAMERA_POSITION;
    texCoord.y *= 3.0;
    POSITION = MODELVIEWPROJECTION_MATRIX * vec4(pos, 1.0f);
}
