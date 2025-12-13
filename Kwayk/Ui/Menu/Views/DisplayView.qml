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

        ListElement { section: "Display"; delegateName: "OpenVideoSettings"; }
        ListElement { section: "Display"; delegateName: "Brightness"; }
        ListElement { section: "Display"; delegateName: "Contrast"; }
        ListElement { section: "Display"; delegateName: "Saturation"; }
        ListElement { section: "Display"; delegateName: "Fov"; }
        ListElement {
            section: "Enhancements"; delegateName: "HDRBloomTonemap";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "Antialiasing";
            options: [
                ListElement { name: "NoAA" },
                ListElement { name: "SSAA" },
                ListElement { name: "MSAA" },
                ListElement { name: "ProgressiveAA" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "AntialiasingQuality";
            options: [
                ListElement { name: "Medium" },
                ListElement { name: "High" },
                ListElement { name: "Very High" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "FXAA";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "AmbientOcclusion";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "DepthOfField";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "TeleportEffect";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "TransitionEffect";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "Dithering";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "ColorLightmaps";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "Fog";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "Decals";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "DynamicShadows";
            options: [
                ListElement { name: "Off" },
                ListElement { name: "On" }
            ]
        }
        ListElement {
            section: "Enhancements"; delegateName: "ShadowMapQuality";
            options: [
                ListElement { name: "Low" },
                ListElement { name: "Medium" },
                ListElement { name: "High" },
                ListElement { name: "Very High" },
                ListElement { name: "Ultra" }
            ]
        }

        Component.onCompleted: {
            if (Qt.platform.os !== "wasm")
                return;

            for (let i = 0; i < count; i++) {
                if (get(i).delegateName === "ColorLightmaps") {
                    remove(i);
                    break;
                }
            }
        }
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
                roleValue: "OpenVideoSettings"
                D.LabelDelegate {
                    text: "Open Video Settings..."
                    light: true
                }
            }
            DelegateChoice {
                roleValue: "Brightness"
                D.SliderDelegate {
                    name: "Brightness"
                    from: 0
                    to: 20
                    stepSize: 1
                    value: vars.r_brightness.value
                    onValueChanged: vars.val = { name: "r_brightness", value };
                }
            }
            DelegateChoice {
                roleValue: "Contrast"
                D.SliderDelegate {
                    name: "Contrast"
                    from: 0
                    to: 20
                    stepSize: 1
                    value: vars.r_contrast.value
                    onValueChanged: vars.val = { name: "r_contrast", value };
                }
            }
            DelegateChoice {
                roleValue: "Saturation"
                D.SliderDelegate {
                    name: "Saturation"
                    from: 0
                    to: 20
                    stepSize: 1
                    value: vars.r_saturation.value
                    onValueChanged: vars.val = { name: "r_saturation", value };
                }
            }
            DelegateChoice {
                roleValue: "Fov"
                D.SliderDelegate {
                    name: "Field of View"
                    from: 70
                    to: 130
                    stepSize: 5
                    value: vars.r_fov.value
                    onValueChanged: vars.val = { name: "r_fov", value };
                }
            }
            DelegateChoice {
                roleValue: "HDRBloomTonemap"
                D.SelectDelegate {
                    name: "HDR Bloom Tonemap"
                    currentIndex: vars.r_hdrbloomtonemap.value
                    onCurrentIndexChanged: vars.val = { name: "r_hdrbloomtonemap", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "Antialiasing"
                D.SelectDelegate {
                    name: "Antialiasing"
                    currentIndex: vars.r_antialiasing.value
                    onCurrentIndexChanged: vars.val = { name: "r_antialiasing", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "AntialiasingQuality"
                D.SelectDelegate {
                    name: "Antialiasing Quality"
                    currentIndex: vars.r_antialiasingquality.value
                    onCurrentIndexChanged: vars.val = { name: "r_antialiasingquality", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "FXAA"
                D.SelectDelegate {
                    name: "FXAA"
                    currentIndex: vars.r_fxaa.value
                    onCurrentIndexChanged: vars.val = { name: "r_fxaa", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "AmbientOcclusion"
                D.SelectDelegate {
                    name: "Ambient Occlusion"
                    currentIndex: vars.r_ambientocclusion.value
                    onCurrentIndexChanged: vars.val = { name: "r_ambientocclusion", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "DepthOfField"
                D.SelectDelegate {
                    name: "Depth of Field"
                    currentIndex: vars.r_depthoffield.value
                    onCurrentIndexChanged: vars.val = { name: "r_depthoffield", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "TeleportEffect"
                D.SelectDelegate {
                    name: "Teleport Effect"
                    currentIndex: vars.r_teleporteffect.value
                    onCurrentIndexChanged: vars.val = { name: "r_teleporteffect", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "TransitionEffect"
                D.SelectDelegate {
                    name: "Transition Effect"
                    currentIndex: vars.r_transitioneffect.value
                    onCurrentIndexChanged: vars.val = { name: "r_transitioneffect", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "Dithering"
                D.SelectDelegate {
                    name: "Dithering"
                    currentIndex: vars.r_dithering.value
                    onCurrentIndexChanged: vars.val = { name: "r_dithering", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "ColorLightmaps"
                D.SelectDelegate {
                    name: "Color Lightmaps"
                    currentIndex: vars.r_colorlightmaps.value
                    onCurrentIndexChanged: vars.val = { name: "r_colorlightmaps", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "Fog"
                D.SelectDelegate {
                    name: "Fog"
                    currentIndex: vars.r_fog.value
                    onCurrentIndexChanged: vars.val = { name: "r_fog", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "Decals"
                D.SelectDelegate {
                    name: "Decals"
                    currentIndex: vars.r_decals.value
                    onCurrentIndexChanged: vars.val = { name: "r_decals", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "DynamicShadows"
                D.SelectDelegate {
                    name: "Dynamic Shadows"
                    currentIndex: vars.r_dynamicshadows.value
                    onCurrentIndexChanged: vars.val = { name: "r_dynamicshadows", value: currentIndex };
                }
            }
            DelegateChoice {
                roleValue: "ShadowMapQuality"
                D.SelectDelegate {
                    name: "Shadow Map Quality"
                    currentIndex: vars.r_shadowmapquality.value
                    onCurrentIndexChanged: vars.val = { name: "r_shadowmapquality", value: currentIndex };
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
        case 0:
            stackView.push(videoSettingsViewComponent);
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
}
