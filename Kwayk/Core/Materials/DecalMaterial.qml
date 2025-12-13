import QtQuick
import QtQuick3D

CustomMaterial {
    id: root

    property alias colorMap: colorTexInput.texture

    property real depthBias: 0.01
    property real alpha: 1.0

    property TextureInput colorTex: TextureInput {
        id: colorTexInput
    }

    shadingMode: CustomMaterial.Unshaded
    sourceBlend: CustomMaterial.Zero
    destinationBlend: CustomMaterial.OneMinusSrcColor

    vertexShader: "qrc:/Kwayk/Core/shaders/decal.vert"
    fragmentShader: "qrc:/Kwayk/Core/shaders/decal.frag"
}
