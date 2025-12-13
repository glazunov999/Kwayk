import QtQuick
import QtQuick.Layouts

Row {
    id: control

    property string text: ""
    property bool light: false

    property real charOpacity: 1.0

    readonly property alias charItems: chars

    spacing: 0

    Repeater {
        id: chars
        model: text.split("")

        Image {
            id: img
            required property var modelData
            source: "qrc:/Assets/images/CONCHARS_" + (modelData.charCodeAt(0) + (control.light ? 0 : 128)) + ".png"
            opacity: control.charOpacity
        }
    }
}
