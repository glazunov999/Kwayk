import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".."
import "../../Controls" as C

Item {
    id: root

    width: 320
    height: 200

    Repeater {
        model: "Are you sure you want to\nstart a new game? (Y/N)".split("\n")
        C.Label {
            required property var modelData
            required property int index
            text: modelData
            light: true
            x: (root.width - modelData.length * 8) / 2
            y: 60 + index * 8
        }
    }

    C.Label {
        text: "Escape: Back"
        light: true
        x: 16
        y: 200 - implicitHeight
    }

    C.Label {
        text: "Enter: Select"
        light: true
        x: 320 - implicitWidth
        y: 200 - implicitHeight
    }

    function enter() {
        cmds.command = "disconnect\n";
        cmds.command = "map start\n";
    }

    function processInput() {
        if (currentKey === Qt.Key_Return) {
            enter();
            return;
        }

        if (currentKey === Qt.Key_Escape || currentKey === Qt.Key_N) {
            stackView.pop();
            return;
        }

        if (currentKey === Qt.Key_Y) {
            enter();
            return;
        }
    }
}

