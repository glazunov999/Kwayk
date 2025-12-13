import QtQuick

Image {
    id: root

    width: 48
    height: 16

    property bool highlighted: false

    source: !highlighted ?  "qrc:/Assets/images/INV_LIGHTNG.png" : "qrc:/Assets/images/INV2_LIGHTNG.png"
}
