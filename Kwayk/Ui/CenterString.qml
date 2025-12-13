import QtQuick
import QtQuick.Effects

import "Controls" as C

Item {
    id: root

    property string text: ""
    property var tokens: text.split("\n")

    property bool intermission: false

    opacity: 0

    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
    transformOrigin: Item.Center

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
                target: root
                property: "opacity"
                duration: 200
                from: 1
                to: 0
            }
        }
    ]

    SequentialAnimation {
        id: autoHideAnim

        PauseAnimation {
            duration: vars.scr_centertime.value * 1000
        }

        ScriptAction {
            script: root.hide()
        }
    }

    Repeater {
        id: textPrint
        model: tokens
        C.Label {
            required property var modelData
            required property int index
            text: modelData
            light: true
            x: (root.width - modelData.length * 8) / 2
            y: (tokens.length <= 4 ? root.height * 0.35 : 48) + index * 8
            charOpacity: intermission ? 0 : 1.0
        }
    }

    onTextChanged: textPrintTimer.charIndex = textPrintTimer.tokenIndex = 0;

    Timer {
        id: textPrintTimer
        interval: 1000 / Math.max(vars.scr_printspeed.value, 0)
        repeat: true
        property int charIndex: 0
        property int tokenIndex: 0

        onTriggered: {
            if (tokenIndex >= tokens.length) {
                stop();
                return;
            }

            const tokenItem = textPrint.itemAt(tokenIndex);

            if (charIndex < tokenItem.charItems.count) {
                tokenItem.charItems.itemAt(charIndex).opacity = 1;
                charIndex++;
            }

            if (charIndex >= tokens[tokenIndex].length) {
                charIndex = 0;
                tokenIndex++;
            }
        }
    }

    layer.enabled: true
    layer.effect: MultiEffect {
        colorization: 1.0
        colorizationColor: "white"
        brightness: 0.25
    }

    function clear() {
        text = "";
    }

    function show() {
        state = "shown";
        if (intermission)
            textPrintTimer.start();
        else
            autoHideAnim.restart();
    }

    function hide() {
        state = "hidden";
        textPrintTimer.stop();
    }
}
