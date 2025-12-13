import QtQuick

import Kwayk.Game

import "Controls" as C

Image {
    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200)
    transformOrigin: Item.Center

    source: "qrc:/Assets/images/conback.png"

    C.Label {
        text: "Kwayk"
        x: 228
        y: 186
    }

    C.Label {
        text: Defs.version
        x: 276
        y: 186
    }
}
