import QtQuick
import QtQuick3D

CustomMaterial {
    id: root

    property alias colorMap: colorTexInput.texture

    property real alpha: 1.0

    property real emissiveIntensity: 0.0
    property color emissiveColor: "#000000"

    property TextureInput colorTex: TextureInput {
        id: colorTexInput
    }

    shadingMode: CustomMaterial.Shaded
    sourceBlend: root.alpha < 1.0 ? CustomMaterial.SrcAlpha : CustomMaterial.NoBlend
    destinationBlend: root.alpha < 1.0 ? CustomMaterial.OneMinusSrcAlpha : CustomMaterial.NoBlend

    fragmentShader: "qrc:/Kwayk/Core/shaders/alias.frag"
}
