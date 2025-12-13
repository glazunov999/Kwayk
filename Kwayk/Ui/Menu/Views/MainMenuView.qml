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
        source: "qrc:/Assets/images/ttl_main.png"
        x: 160 - implicitWidth / 2
        y: 4
    }

    Image {
        id: mainMenuPic
        source: "qrc:/Assets/images/mainmenu.png"
        x: 72
        y: 32
    }

    ListView {
        id: listView

        x: 72
        y: 32

        width: mainMenuPic.implicitWidth
        height: mainMenuPic.implicitHeight

        contentWidth: width - 8

        boundsBehavior: Flickable.StopAtBounds
        boundsMovement: Flickable.StopAtBounds

        clip: true

        model: ["single player", "multiplayer", "options", "help", "quit"]

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
            stackView.push(spMenuViewComponent);
            break;
        case 1:
            stackView.push(mpMenuViewComponent);
            break;
        case 2:
            stackView.push(optionsViewComponent);
            break;
        case 3:
            stackView.push(helpViewComponent);
            break;
        case 4:
            stackView.push(quitViewComponent);
            break;
        default:
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
    }
}
