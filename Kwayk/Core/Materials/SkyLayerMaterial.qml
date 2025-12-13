import QtQuick3D

CustomMaterial {
    id: root

    property real time1: (main.time / 8) % 1.0
    property real time2: (main.time / 16) % 1.0

    property alias alphaColorMap: alphaColorTexInput.texture
    property alias solidColorMap: solidColorTexInput.texture

    property TextureInput alphaColorTex: TextureInput {
        id: alphaColorTexInput
    }

    property TextureInput solidColorTex: TextureInput {
        id: solidColorTexInput
    }

    shadingMode: CustomMaterial.Unshaded

    vertexShader: "qrc:/Kwayk/Core/shaders/skylayer.vert"
    fragmentShader: "qrc:/Kwayk/Core/shaders/skylayer.frag"
}
