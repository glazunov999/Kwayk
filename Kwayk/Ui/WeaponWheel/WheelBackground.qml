import QtQuick
 import QtQuick.Effects

Item {
    id: root

    width: 180
    height: 180

    layer.enabled: true
    layer.effect: MultiEffect {
        blurEnabled: true
        blur: 0.2
        blurMax: 16
    }

    ShaderEffect {
        anchors.fill: parent

        property Image source: Image {
            source: "qrc:/Assets/images/box_mm2.png"
        }

        opacity: 0.6

        vertexShader: "qrc:/Kwayk/Ui/WeaponWheel/shaders/backgroundMask.vert.qsb"
        fragmentShader: "qrc:/Kwayk/Ui/WeaponWheel/shaders/backgroundMask.frag.qsb"
    }

    Rectangle {
        width: 180
        height: width
        radius: width / 2
        anchors.centerIn: parent
        color: "transparent"
        border.width: 2
        border.color: "#572b17"
        opacity: 0.8
    }

    Rectangle {
        width: 110
        height: width
        radius: width / 2
        anchors.centerIn: parent
        color: "transparent"
        border.width: 2
        border.color: "#572b17"
        opacity: 0.8
    }

}
