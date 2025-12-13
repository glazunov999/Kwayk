import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.Effects

import Backend

import "Effects"

View3D {
    id: root

    camera: camera

    readonly property alias env: env
    readonly property alias light: light
    readonly property alias hdrBloomTonemap: hdrBloomTonemap
    readonly property alias depthOfField: depthOfField
    readonly property alias blendEffect: blendEffect
    readonly property alias warpEffect: warpEffect
    readonly property alias teleportEffect: teleportEffect
    readonly property alias transitionEffect: transitionEffect
    readonly property alias particles: particles
    readonly property alias decals: decals
    readonly property alias worldLoader: worldLoader

    environment: ExtendedSceneEnvironment {
        id: env
        backgroundMode: SceneEnvironment.Transparent
        tonemapMode: SceneEnvironment.TonemapModeAces
        antialiasingMode: SceneEnvironment.MSAA
        antialiasingQuality: SceneEnvironment.High
        fog: theFog

        Fog {
            id: theFog
            enabled: true
            depthEnabled: true
        }

        effects: [ hdrBloomTonemap, depthOfField, blendEffect, warpEffect, teleportEffect, transitionEffect ]
    }

    HDRBloomTonemap {
        id: hdrBloomTonemap
        blurFalloff: 0.1
        tonemappingLerp: 0.5
    }

    TiltShift {
        id: depthOfField
        blurAmount: 0
        focusPosition: 0.5
        focusWidth: 0.6
        isInverted: true

        Behavior on blurAmount {
            NumberAnimation { duration: 200; easing.type: Easing.InQuad }
        }
    }

    MotionBlur {
        id: moitionBlur
    }

    BlendEffect {
        id: blendEffect
    }

    WarpEffect {
        id: warpEffect
    }

    TeleportEffect {
        id: teleportEffect
    }

    TransitionEffect {
        id: transitionEffect
    }

    Particles {
        id: particles
        running: false
        time: main.time * 1000
    }

    Decals {
        id: decals
    }

    PerspectiveCamera {
        id: camera
        clipNear: 0.01
        clipFar: 50
    }

    DirectionalLight {
        id: light
        eulerRotation.x: -45
        eulerRotation.y: -45
        ambientColor: Qt.rgba(1.0, 0.9, 0.9, 1.0)
        castsShadow: false
        shadowFactor: 100
        pcfFactor: 0.01
        shadowBias: 0.1
    }

    Loader3D {
        id: worldLoader
    }
}
