import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls" as C
import "../Delegates" as D

Item {
    id: root

    property int vWidth: 0
    property int vHeight: 0
    property int vFullscreen: 0

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

        ListElement {
            section: "Video Settings"; delegateName: "Resolution";
            options: [
                ListElement { name: "640x480"; width: 640; height: 480 },
                ListElement { name: "800x600"; width: 800; height: 600 },
                ListElement { name: "1024x768"; width: 1024; height: 768 },
                ListElement { name: "1152x864"; width: 1152; height: 864 },
                ListElement { name: "1280x600"; width: 1280; height: 600 },
                ListElement { name: "1280x720"; width: 1280; height: 720 },
                ListElement { name: "1280x768"; width: 1280; height: 768 },
                ListElement { name: "1280x800"; width: 1280; height: 800 },
                ListElement { name: "1280x960"; width: 1280; height: 960 },
                ListElement { name: "1280x1024"; width: 1280; height: 1024 },
                ListElement { name: "1360x768"; width: 1360; height: 768 },
                ListElement { name: "1366x768"; width: 1366; height: 768 },
                ListElement { name: "1400x1050"; width: 1400; height: 1050 },
                ListElement { name: "1440x900"; width: 1440; height: 900 },
                ListElement { name: "1600x900"; width: 1600; height: 900 },
                ListElement { name: "1680x1050"; width: 1680; height: 1050 },
                ListElement { name: "1920x1080"; width: 1920; height: 1080 }
            ]
        }
        ListElement {
            section: "Video Settings"; delegateName: "WindowMode";
            options: [
                ListElement { name: "Windowed" },
                ListElement { name: "Fullscreen" }
            ]
        }
        ListElement { section: ""; delegateName: "ApplySettings" }
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
                roleValue: "Resolution"
                D.SelectDelegate {
                    id: del
                    name: "Resolution"
                    currentIndex: {
                        for (let i = 0; i < options.count; ++i) {
                            if (options.get(i).width === vars.v_width.value && options.get(i).height === vars.v_height.value)
                                return i;
                        }
                        return 0;
                    }
                    onCurrentIndexChanged: {
                        vWidth = options.get(currentIndex).width;
                        vHeight = options.get(currentIndex).height;
                    }
                }
            }
            DelegateChoice {
                roleValue: "WindowMode"
                D.SelectDelegate {
                    name: "Window Mode"
                    currentIndex: vars.v_fullscreen.value
                    onCurrentIndexChanged: vFullscreen = currentIndex;
                }
            }
            DelegateChoice {
                roleValue: "ApplySettings"
                D.LabelDelegate {
                    text: "Apply Settings"
                    light: false
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

        switch (listView.currentIndex) {
        case 2:
            applySettings();
            break;
        default:
            listView.currentItem.increase();
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

    function applySettings() {
        if (!vWidth || !vHeight)
            return;

        vars.val = { name: "v_width", value: vWidth };
        vars.val = { name: "v_height", value: vHeight };
        vars.val = { name: "v_fullscreen", value: vFullscreen };
    }
}
