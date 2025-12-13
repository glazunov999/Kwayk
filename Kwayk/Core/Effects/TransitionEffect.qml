import QtQuick
import QtQuick3D

Effect {
    id: root

    property alias source: img.source
    property real alpha: 0

    property TextureInput tex: TextureInput {
        texture: Texture {
            sourceItem: Image { id: img }
        }
    }

    Shader {
        id: frag
        stage: Shader.Fragment
        shader: "qrc:/Kwayk/Core/shaders/transition.frag"
    }

    passes: Pass {
        shaders: [ frag ]
    }

    function start() {
        anim.restart();
    }

    NumberAnimation {
        id: anim
        target: root
        property: "alpha"
        from: 0.5
        to: 0.0
        duration: 1000
    }
}
