import QtQuick
import QtQuick.Effects

import "Controls" as C

Item {
    id: root

    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
    transformOrigin: Item.Center

    opacity: 0

    state: "hidden"

    states: [
        State {
            name: "shown"
            PropertyChanges { target: root; opacity: 1.0 }
        },
        State {
            name: "hidden"
            PropertyChanges { target: root; opacity: 0.0 }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "shown"
            NumberAnimation {
                properties: "opacity"
                duration: 300
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "shown"; to: "*"
            NumberAnimation {
                properties: "opacity"
                duration: 300
                easing.type: Easing.InQuad
            }
        }
    ]

    property string text: ""
    property color color: "white"

    C.Label {
        id: label
        text: root.text
        light: true
        x: 160 - 4
        y: 100 - 4
    }

    layer.enabled: true
    layer.effect: MultiEffect {
        colorization: 1.0
        colorizationColor: root.color
        brightness: 0.5
    }

    function updateCrosshairStyle() {
        if (vars.crosshair_style.value !== "Off")
            root.text = vars.crosshair_style.value;
        else
            root.text = "";
    }

    function updateCrosshairColor() {
        root.color = Qt.rgba(vars.crosshair_red.value,
                             vars.crosshair_green.value,
                             vars.crosshair_blue.value,
                             1.0);
    }

    function show() {
        state = "shown";
    }

    function hide() {
        state = "hidden";
    }
}
