import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers

import Kwayk.Core

Window {
    id: app
    width: 1024
    height: 768
    visible: true
    title: "Kwayk"
    color: "black"

    Main {
        id: main
        anchors.fill: parent
    }
}
