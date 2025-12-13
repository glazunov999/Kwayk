import QtQuick

Image {
    id: root

    property string ch: " "

    source: "qrc:/Assets/images/CONCHARS_" + (ch.charCodeAt(0) + 128) + ".png"
}
