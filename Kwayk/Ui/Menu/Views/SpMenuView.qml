import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".."
import "../../Controls" as C

Item {
    id: root

    Image {
        source: "qrc:/Assets/images/qplaque.png"
        x: 16
        y: 4
    }

    Image {
        source: "qrc:/Assets/images/ttl_sgl.png"
        x: 160 - implicitWidth / 2
        y: 4
    }

    Image {
        id: spMenuPic
        source: "qrc:/Assets/images/sp_menu.png"
        x: 72
        y: 32
    }

    ListView {
        id: listView

        x: 72
        y: 32

        width: spMenuPic.implicitWidth
        height: spMenuPic.implicitHeight

        contentWidth: width - 8

        boundsBehavior: Flickable.StopAtBounds
        boundsMovement: Flickable.StopAtBounds

        clip: true

        model: ["new main", "load", "save"]

        delegate: Item {
            width: ListView.view.width
            height: 20
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: enter()
            onPositionChanged: (mouse) => {
                const index = listView.indexAt(listView.contentX + mouse.x, listView.contentY + mouse.y);
                if (index < 0)
                    return;
                listView.currentIndex = index;
            }
        }
    }

    C.Label {
        text: "Escape: Back"
        light: true
        x: 16
        y: 200 - implicitHeight
    }

    C.Label {
        text: "Enter: Select"
        light: true
        x: 320 - implicitWidth
        y: 200 - implicitHeight
    }

    MenuDot {
        x: 54
        y: 32 + listView.currentIndex * 20
    }

    function enter() {
        menu2Sound.stop();
        menu2Sound.play();

        switch (listView.currentIndex) {
        case 0:
            if (player)
                stackView.push(newGameConfirmViewComponent);
            else
                cmds.command = "map start\n";
            break;
        case 1: // Load
            // TODO: implement load game
            break;
        case 2: // Save
            // TODO: implement save game
            break;
        }
    }

    function processInput() {
        if (currentKey === Qt.Key_Up) {
            menu1Sound.stop();
            menu1Sound.play();
            listView.decrementCurrentIndex();
            return
        }

        if (currentKey === Qt.Key_Down) {
            menu1Sound.stop();
            menu1Sound.play();
            listView.incrementCurrentIndex();
            return;
        }

        if (currentKey === Qt.Key_Return) {
            enter();
            return;
        }

        if (currentKey === Qt.Key_Escape) {
            stackView.pop();
            return;
        }
    }
}
