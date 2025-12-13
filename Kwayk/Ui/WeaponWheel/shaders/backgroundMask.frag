#version 440

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
     mat4 qt_Matrix;
     float qt_Opacity;
 };
layout(binding = 1) uniform sampler2D source;

void main() {
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(texCoord, center);

    float innerAlpha = step(0.3, dist);
    float outerAlpha = step(dist, 0.5);

    float alpha = innerAlpha * outerAlpha;
    if (alpha < 0.5)
        discard;

    vec4 texColor = texture(source, fract(texCoord * 10.0));
    fragColor = vec4(texColor.rgb, texColor.a) * qt_Opacity;
}
