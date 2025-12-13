import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls" as C

Item {
    id: root

    Image {
        source: "qrc:/Assets/images/qplaque.png"
        x: 16
        y: 4
    }

    Image {
        source: "qrc:/Assets/images/p_multi.png"
        x: 160 - implicitWidth / 2
        y: 4
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

    C.Label {
        text: "Not yet..."
        x: 70
        y: 32
    }

    function processInput() {
        if (currentKey === Qt.Key_Escape) {
            stackView.pop();
            return;
        }
    }
}
