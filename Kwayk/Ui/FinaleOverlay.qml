import QtQuick

Item {
    id: root

    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
    transformOrigin: Item.Center

    Image {
        id: finaleImage
        source: "qrc:/Assets/images/finale.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 16
    }
}

