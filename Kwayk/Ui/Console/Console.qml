import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../Controls" as C

Rectangle {
    id: root

    width: parent.width
    height: parent.height * (2 / 3)

    color: "black"
    opacity: 0.85

    onVisibleChanged: {
        if (visible)
            editLine.textField.forceActiveFocus();
        else
            main.forceActiveFocus();
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8

        spacing: 4

        ListView {
            id: logView
            Layout.fillHeight: true
            Layout.fillWidth: true

            contentWidth: width - 8
            
            model: consoleLog
            clip: true
            
            verticalLayoutDirection: ListView.BottomToTop

            delegate: Label {
                required property var model
                width: logView.contentWidth
                wrapMode: Text.Wrap
                color: model.textColor || "white"
                text: model.text
                font.weight: 600
                font.pixelSize: 12
            }
            
            ScrollBar.vertical: C.ScrollBar {}
        }

        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "white"
        }

        EditLine {
            id: editLine
            Layout.fillWidth: true
        }
    }
}
