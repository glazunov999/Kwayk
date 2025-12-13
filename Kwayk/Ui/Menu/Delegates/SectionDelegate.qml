import QtQuick
import QtQuick.Layouts

import "../../Controls" as C

ColumnLayout {
    id: root

    required property string section

    width: parent.width
    spacing: 0

    Item {
        height: 8
        Layout.fillWidth: true
    }
    C.Label {
        text: section
        Layout.alignment: Qt.AlignLeft
    }
    C.Label {
        text: "\u001E".repeat(30)
    }
}
