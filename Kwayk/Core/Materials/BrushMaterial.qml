import QtQuick
import QtQuick3D

CustomMaterial {
    id: root

    property var frameMaps: []
    property var alternateFrameMaps: []
    property int frame: 0
    property int frameDuration: 200
    property var currentFrameMaps: frame === 0 || !alternateFrameMaps.length ? frameMaps : alternateFrameMaps

    property int currentFrame1: (Math.floor(time)) % currentFrameMaps.length
    property int currentFrame2: (Math.floor(time) + 1) % currentFrameMaps.length
    property real time: (main.time * 1000 / frameDuration)

    property alias lightmapColorMap: lightmapColorTexInput.texture
    property alias lightStyleColorMap: lightStyleColorTexInput.texture

    property bool useLightmap: lightmapColorTexInput.texture !== null
    property bool useFullbright1: fullbrightColorTex1Input.texture !== null
    property bool useFullbright2: fullbrightColorTex2Input.texture !== null

    property real emissiveIntensity: 0.0
    property color emissiveColor: "#000000"

    property TextureInput colorTex1: TextureInput {
        texture: currentFrameMaps[currentFrame1]?.colorMap ?? null
    }

    property TextureInput colorTex2: TextureInput {
        texture: currentFrameMaps[currentFrame2]?.colorMap ?? null
    }

    property TextureInput fullbrightColorTex1: TextureInput {
        id: fullbrightColorTex1Input
        texture: currentFrameMaps[currentFrame1]?.fullbrightColorMap ?? null
    }

    property TextureInput fullbrightColorTex2: TextureInput {
        id: fullbrightColorTex2Input
        texture: currentFrameMaps[currentFrame2]?.fullbrightColorMap ?? null
    }

    property TextureInput lightmapColorTex: TextureInput {
        id: lightmapColorTexInput
    }

    property TextureInput lightStyleColorTex: TextureInput {
        id: lightStyleColorTexInput
    }

    shadingMode: CustomMaterial.Shaded

    vertexShader: "qrc:/Kwayk/Core/shaders/brush.vert"
    fragmentShader: "qrc:/Kwayk/Core/shaders/brush.frag"
}

