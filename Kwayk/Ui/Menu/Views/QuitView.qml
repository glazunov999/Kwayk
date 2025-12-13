import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls" as C

Item {
    id: root

    property var quitMessage: [
        ["Are you gonna quit this game", "just like everything else?"],
        ["Milord, methinks that thou art a", "lowly quitter. Is this true?"],
        ["Do I need to bust your face open", "for trying to quit?"],
        ["Man, I oughta smack you for", "trying to quit! Press Y to get", "smacked out."],
        ["Press Y to quit like a big loser", "in life. Press N to stay proud", "and successful!"],
        ["If you press Y to quit, I will", "summon Satan all over your hard", "drive!"],
        ["Um, Asmodeus dislikes his", "children trying to quit. Press Y", "to return to your Tinkertoys."],
        ["If you quit now, I'll throw a", "blanket-party for you next time!"]
    ]

    Item {
        width: msg.implicitWidth + 8
        height: msg.implicitHeight + 8

        x: (320 - width) / 2
        y: (200 - height) / 2

        Image {
            width: parent.width
            height: parent.height
            source: "qrc:/Assets/images/box_mm2.png"
            fillMode: Image.Tile
        }

        Column {
            id: msg

            anchors.centerIn: parent

            Repeater {
                model: quitMessage[Math.floor(Math.random() * quitMessage.length)];

                C.Label {
                    required property var modelData
                    text: modelData
                    light: true
                }
            }
        }

        Image {
            x: -8
            y: -8
            source: "qrc:/Assets/images/box_tl.png"
        }

        Image {
            x: -8
            y: 0
            height: parent.height
            source: "qrc:/Assets/images/box_ml.png"
            fillMode: Image.Tile
        }

        Image {
            x: -8
            y: parent.height
            source: "qrc:/Assets/images/box_bl.png"
        }

        Image {
            x: 0
            y: -8
            width: parent.width
            source: "qrc:/Assets/images/box_tm.png"
            fillMode: Image.Tile
        }

        Image {
            x: 0
            y: parent.height
            width: parent.width
            source: "qrc:/Assets/images/box_bm.png"
            fillMode: Image.Tile
        }

        Image {
            x: parent.width
            y: -8
            source: "qrc:/Assets/images/box_tr.png"
        }

        Image {
            x: parent.width
            y: 0
            height: parent.height
            source: "qrc:/Assets/images/box_mr.png"
            fillMode: Image.Tile
        }

        Image {
            x: parent.width
            y: parent.height
            source: "qrc:/Assets/images/box_br.png"
        }
    }

    C.Label {
        text: "N or Escape: Back"
        light: true
        x: 16
        y: 200 - implicitHeight
    }

    C.Label {
        text: "Y or Enter: Quit"
        light: true
        x: 320 - implicitWidth
        y: 200 - implicitHeight
    }

    function processInput() {
        if (currentKey === Qt.Key_Return || currentKey === Qt.Key_Y) {
            Qt.quit();
            return;
        }

        if (currentKey === Qt.Key_Escape || currentKey === Qt.Key_N) {
            stackView.pop();
            return;
        }
    }
}
