import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

ScrollBar {
    id: control

    visible: control.policy !== ScrollBar.AlwaysOff

    contentItem: Rectangle {
        implicitWidth: control.interactive ? 4 : 2
        implicitHeight: control.interactive ? 4 : 2
        color: control.pressed ? "#733723" : "#572b17"
        radius: 1

        opacity: (control.policy === ScrollBar.AlwaysOn || control.size < 1.0) ? 0.8 : 0.0
        Behavior on opacity {
            NumberAnimation {}
        }
    }
}
