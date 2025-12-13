import QtQuick
import QtQuick.Layouts

import Kwayk

Item {
    id: root

    opacity: 0.8

    anchors.fill: parent

    state: "hidden"

    states: [
        State {
            name: "shown"
            PropertyChanges { target: root; opacity: 0.8 }
        },
        State {
            name: "hidden"
            PropertyChanges { target: root; opacity: 0.0 }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "shown"
            NumberAnimation {
                properties: "opacity"
                duration: 300
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "shown"; to: "*"
            NumberAnimation {
                properties: "opacity"
                duration: 300
                easing.type: Easing.InQuad
            }
        }
    ]

    Item {
        width: 320
        height: 200

        anchors.left: parent.left
        anchors.bottom: parent.bottom

        scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
        transformOrigin: Item.BottomLeft

        SbArmor {
            id: armor
            x: 20
            y: 132
        }

        Num {
            id: armorNum
            x: 44
            y: 132
            digits: 3
        }

        Face {
            id: face
            x: 20
            y: 156
        }

        Num {
            id: healthNum
            x: 44
            y: 156
            digits: 3
        }
    }

    Item {
        width: 320
        height: 200

        anchors.right: parent.right
        anchors.bottom: parent.bottom

        scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
        transformOrigin: Item.BottomRight

        Inventory {
            id: inventory
        }

        Num {
            id: ammoNum
            x: 200
            y: 156
            digits: 3
        }

        Ammo {
            id: ammo
            x: 276
            y: 156
        }
    }

    function update() {
        if (state !== "shown")
            return;

        armor.items = player.items;
        armor.visible = player.armorvalue > 0;

        armorNum.visible = player.armorvalue > 0;
        armorNum.str = player.armorvalue;
        armorNum.color = player.armorvalue <= 25 ? 1 : 0;

        face.update();

        healthNum.str = player.health;
        healthNum.color = player.health <= 25 ? 1 : 0;

        inventory.items = player.items;

        ammoNum.str = player.currentammo;
        ammoNum.color = player.currentammo <= 10 ? 1 : 0;

        ammo.items = player.items;
    }

    function show() {
        state = "shown";
    }

    function hide() {
        state = "hidden";
    }
}
