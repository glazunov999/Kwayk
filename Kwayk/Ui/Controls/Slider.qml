import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Slider {
    id: control

    leftPadding: 8
    rightPadding: 8

    background: Row {
        id: content
        y: control.topPadding + control.availableHeight / 2 - height / 2
        width: control.leftPadding + control.rightPadding + control.availableWidth
        height: 8
        spacing: 0
        Image {
            source: "qrc:/Assets/images/CONCHARS_128.png"
        }
        Image {
            fillMode: Image.Tile
            width: parent.width - 16
            source: "qrc:/Assets/images/CONCHARS_129.png"
        }
        Image {
            source: "qrc:/Assets/images/CONCHARS_130.png"
        }
    }

    handle: Image {
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        source: "qrc:/Assets/images/CONCHARS_131.png"
    }
}
