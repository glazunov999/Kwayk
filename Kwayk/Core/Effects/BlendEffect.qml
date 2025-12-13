import QtQuick
import QtQuick3D

Effect {
    id: root

    property color color: Qt.rgba(0, 0, 0, 0)

    Shader {
        id: frag
        stage: Shader.Fragment
        shader: "qrc:/Kwayk/Core/shaders/blend.frag"
    }

    passes: Pass {
        shaders: [ frag ]
    }
}
