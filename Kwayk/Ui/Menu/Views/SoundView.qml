import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls" as C
import "../Delegates" as D

Item {
    id: root

    Image {
        source: "qrc:/Assets/images/qplaque.png"
        x: 16
        y: 4
    }

    Image {
        source: "qrc:/Assets/images/p_option.png"
        x: 160 - implicitWidth / 2
        y: 4
    }

    ListModel {
        id: listModel

        ListElement { section: "Sound"; delegateName: "Volume"; }
    }

    ListView {
        id: listView

        x: 70
        y: 32

        width: 320 - x
        height: 176 - y

        contentWidth: width - 8

        boundsBehavior: Flickable.StopAtBounds
        boundsMovement: Flickable.StopAtBounds

        clip: true

        model: listModel

        section.property: "section"
        section.criteria: ViewSection.FullString
        section.delegate: D.SectionDelegate {
            width: ListView.view.width;
        }

        delegate: DelegateChooser {
            role: "delegateName"
            DelegateChoice {
                roleValue: "Volume"
                D.SliderDelegate {
                    name: "Volume"
                    from: 0
                    to: 10
                    stepSize: 1
                    value: vars.snd_volume.value
                    onValueChanged: vars.val = { name: "snd_volume", value };
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPressed: (mouse) => {
                enter();
                mouse.accepted = false;
            }
            onPositionChanged: (mouse) => {
                const index = listView.indexAt(listView.contentX + mouse.x, listView.contentY + mouse.y);
                if (index < 0)
                    return;
                listView.currentIndex = index;
            }
        }

        ScrollBar.vertical: C.ScrollBar {}
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

    C.Label {
        text: "\r"
        x: 62
        y: listView.currentItem ? 32 + listView.currentItem.y - listView.contentY : 0

        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { from: 0; to: 1; duration: 250 }
            NumberAnimation { from: 1; to: 0; duration: 250 }
        }

        visible: y >= 28 && y <= listView.height + 28
    }

    function enter() {
        menu2Sound.stop();
        menu2Sound.play();
        listView.currentItem.increase();
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

        if (currentKey === Qt.Key_Left) {
            menu3Sound.stop();
            menu3Sound.play();
            listView.currentItem.decrease();
            return;
        }

        if (currentKey === Qt.Key_Right) {
            menu3Sound.stop();
            menu3Sound.play();
            listView.currentItem.increase();
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
