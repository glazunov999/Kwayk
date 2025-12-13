import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

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

        ListElement {
            section: "Gameplay"; delegateName: "AlwaysRun";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Gameplay"; delegateName: "ViewBob";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Crosshair"; delegateName: "CrosshairStyle";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "+" },
                ListElement { name: "X" },
                ListElement { name: "O" },
                ListElement { name: "." },
                ListElement { name: "-" },
                ListElement { name: ":" },
                ListElement { name: "*" }
            ]
            color: "#FFFFFF"
        }
        ListElement { section: "Crosshair"; delegateName: "CrosshairColor"; display: "Red"; variable: "crosshair_red"; }
        ListElement { section: "Crosshair"; delegateName: "CrosshairColor"; display: "Green"; variable: "crosshair_green"; }
        ListElement { section: "Crosshair"; delegateName: "CrosshairColor"; display: "Blue"; variable: "crosshair_blue"; }
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
            width: ListView.view.width
        }

        delegate: DelegateChooser {
            role: "delegateName"
            DelegateChoice {
                roleValue: "AlwaysRun"
                D.SelectDelegate {
                    name: "Always Run"
                    currentIndex: vars.cl_forwardspeed.value > 200 ? 1 : 0
                    onCurrentIndexChanged: {
                        if (currentIndex) {
                            vars.val = { name: "cl_forwardspeed", value: 400 }
                            vars.val = { name: "cl_backspeed", value: 400 }
                        } else {
                            vars.val = { name: "cl_forwardspeed", value: 200 }
                            vars.val = { name: "cl_backspeed", value: 200 }
                        }
                    }
                }
            }
            DelegateChoice {
                roleValue: "ViewBob"
                D.SelectDelegate {
                    name: "View Bob"
                    currentIndex: vars.cl_bob.value > 0 ? 1 : 0
                    onCurrentIndexChanged: {
                        if (currentIndex)
                            vars.val = { name: "cl_bob", value: 0.02 }
                        else
                            vars.val = { name: "cl_bob", value: 0 }
                    }
                }
            }
            DelegateChoice {
                roleValue: "CrosshairStyle"
                D.SelectDelegate {
                    id: del
                    required property string color
                    optionLabel.layer.enabled: del.currentIndex !== 0
                    optionLabel.layer.effect: MultiEffect {
                        colorization: 1.0
                        colorizationColor: del.color
                        brightness: 0.5
                    }
                    name: "Crosshair Style";
                    value: vars.crosshair_style.value
                    onValueChanged: vars.val = { name: "crosshair_style", value }
                }
            }
            DelegateChoice {
                roleValue: "CrosshairColor"
                D.SliderDelegate {
                    required property string display
                    required property var variable
                    name: display
                    from: 0
                    to: 255
                    stepSize: 1
                    value: variable === "crosshair_red" ? vars.crosshair_red.value :
                           variable === "crosshair_green" ? vars.crosshair_green.value :
                           variable === "crosshair_blue" ? vars.crosshair_blue.value : 0
                    onValueChanged: {
                        vars.val = { name: variable, value }
                        const r = vars.crosshair_red.value.toString(16).padStart(2, '0');
                        const g = vars.crosshair_green.value.toString(16).padStart(2, '0');
                        const b = vars.crosshair_blue.value.toString(16).padStart(2, '0');
                        listModel.setProperty(3, "color", "#" + r + g + b);
                    }
                }
            }
        }

        onCurrentIndexChanged: {
            if (currentKey !== -1) {
                menu1Sound.stop();
                menu1Sound.play();
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
