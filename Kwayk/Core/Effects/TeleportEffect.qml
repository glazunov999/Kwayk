import QtQuick
import QtQuick3D

Effect {
    id: root

    property real intensity: 0

    function start() {
        anim.restart();
    }

    Shader {
        id: frag
        stage: Shader.Fragment
        shader: "qrc:/Kwayk/Core/shaders/teleport.frag"
    }

    passes: Pass {
        shaders: [ frag ]
    }

    SequentialAnimation {
        id: anim
        NumberAnimation {
            target: root
            property: "intensity"
            from: 0
            to: 1
            duration: 150
            easing.type: Easing.OutQuad
        }
        NumberAnimation {
            target: root
            property: "intensity"
            from: 1
            to: 0
            duration: 250
            easing.type: Easing.InOutQuad
        }
    }
}

