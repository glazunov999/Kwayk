VARYING vec4 lightStyle;

void MAIN()
{
    lightStyle = COLOR;
    POSITION = MODELVIEWPROJECTION_MATRIX * vec4(VERTEX, 1.0f);
}
