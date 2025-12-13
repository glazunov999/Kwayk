import QtQuick

Image {
    id: root

    width: 24
    height: 16

    property bool highlighted: false

    source: !highlighted ?  "qrc:/Assets/images/INV_SSHOTGUN.png" : "qrc:/Assets/images/INV2_SSHOTGUN.png"
}
