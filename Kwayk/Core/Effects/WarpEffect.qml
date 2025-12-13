import QtQuick
import QtQuick3D

Effect {
    id: root

    property real time: warped ? main.time : 0
    property bool warped: false

    Shader {
        id: frag
        stage: Shader.Fragment
        shader: "qrc:/Kwayk/Core/shaders/warp.frag"
    }

    passes: Pass {
        shaders: [ frag ]
    }
}
