import QtQuick
import QtQuick.Layouts

import "Controls"

Item {
    id: root

    opacity: 0

    anchors.fill: parent

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

    function show() {
        state = "shown"
    }

    function hide() {
        state = "hidden";
    }

    Item {
        width: 320
        height: 200

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
        transformOrigin: Item.Bottom

        Rectangle {
            color: "black"
            anchors.centerIn: layout
            width: layout.implicitWidth + 8
            height: layout.implicitHeight + 8
        }

        GridLayout {
            id: layout

            x: 160 - layout.implicitWidth / 2
            y: 160 - layout.implicitHeight

            rows: 4
            columns: 2

            Label {
                text: world?.displayName ?? ""
                light: true
                Layout.row: 0
                Layout.column: 0
                Layout.columnSpan: 2
            }

            Label {
                text: "Time"
                light: true
                Layout.row: 1
                Layout.column: 0
            }

            Label {
                text: world?.intermission_running ?
                        Math.floor((world?.completed_time ?? 0) / 60) + ":" + Math.floor((world?.completed_time ?? 0) % 60).toString().padStart(2, "0") :
                        Math.floor(time / 60) + ":" + Math.floor(time % 60).toString().padStart(2, "0")
                light: true
                Layout.row: 1
                Layout.column: 1
            }

            Label {
                text: "Secrets"
                light: true
                Layout.row: 3
                Layout.column: 0
            }

            Label {
                text: (world?.found_secrets ?? 0) + "/" + (world?.total_secrets ?? 0)
                light: true
                Layout.row: 3
                Layout.column: 1
            }

            Label {
                text: "Monsters"
                light: true
                Layout.row: 2
                Layout.column: 0
            }

            Label {
                text: (world?.killed_monsters ?? 0) + "/" + (world?.total_monsters ?? 0)
                light: true
                Layout.row: 2
                Layout.column: 1
            }
        }
    }
}
