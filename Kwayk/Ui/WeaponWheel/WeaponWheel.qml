import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import Kwayk.Game as G

import "../Controls" as C
import "../Sbar"
import "../../js/vec.js" as Vec

Item {
    id: root

    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
    transformOrigin: Item.Center

    opacity: 0

    property int items: 0
    property var item_gettime: []
    property int currentWeaponIndex: 0
    property real wheelRadius: 112.5
    property real wheelScale: 0.5

    property real arrowAngle: (currentWeaponIndex * 360 / weaponModel.count) - 90

    Behavior on arrowAngle {
        RotationAnimation { duration: 200; direction: RotationAnimation.Shortest }
    }

    state: "hidden"

    states: [
        State {
            name: "shown"
            PropertyChanges { target: root; opacity: 1.0; wheelScale: 1.0; wheelRadius: 72.5 }
        },
        State {
            name: "hidden"
            PropertyChanges { target: root; opacity: 0.0; wheelScale: 0.5; wheelRadius: 112.5 }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "shown"
            NumberAnimation {
                properties: "opacity, wheelScale, wheelRadius"
                duration: 300
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "shown"; to: "*"
            NumberAnimation {
                properties: "opacity, wheelScale, wheelRadius"
                duration: 300
                easing.type: Easing.InQuad
            }
        }
    ]

    WheelBackground {
        anchors.centerIn: parent
        scale: wheelScale
    }

    ListModel {
        id: weaponModel
        ListElement { name: "Axe"; source: "InvAxe.qml"; weapon: 4096; ammo: 0; }
        ListElement { name: "Lightning Gun"; source: "InvLightning.qml"; weapon: 64; ammo: 2048; }
        ListElement { name: "Rocket Launcher"; source: "InvRocketLauncher.qml"; weapon: 32; ammo: 1024; }
        ListElement { name: "Grenade Launcher"; source: "InvGrenadeLauncher.qml"; weapon: 16; ammo: 1024; }
        ListElement { name: "Super Nailgun"; source: "InvSuperNailgun.qml"; weapon: 8; ammo: 512; }
        ListElement { name: "Nailgun"; source: "InvNailgun.qml"; weapon: 4; ammo: 512; }
        ListElement { name: "Super Shotgun"; source: "InvSuperShotgun.qml"; weapon: 2; ammo: 256; }
        ListElement { name: "Shotgun"; source: "InvShotgun.qml"; weapon: 1; ammo: 256; }
    }

    PathView {
        id: wheelView
        anchors.centerIn: parent
        width: 180
        height: 180

        model: weaponModel
        interactive: false

        delegate: Loader {
            required property var model
            required property int index
            required property int weapon

            source: model.source

            opacity: player && player.items & weapon ? 1.0 : 0.5

            readonly property bool isSelected: index === root.currentWeaponIndex && opacity >= 1.0
            scale: isSelected ? 1.25 : 1.0

            Behavior on scale {
                NumberAnimation { duration: 200; easing.type: Easing.OutQuad }
            }

            layer.enabled: isSelected
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowOpacity: 0.8
                shadowBlur: 0.2
                shadowHorizontalOffset: 2.5
                shadowVerticalOffset: 2.5
            }

            onIsSelectedChanged: if (item) item.highlighted = isSelected;
            onLoaded: item.highlighted = isSelected;
        }

        path: Path {
            startX: wheelView.width / 2
            startY: wheelView.height / 2 - wheelRadius

            PathArc {
                x: wheelView.width / 2
                y: wheelView.height / 2 + wheelRadius
                radiusX: wheelRadius
                radiusY: wheelRadius
                useLargeArc: false
            }

            PathArc {
                x: wheelView.width / 2
                y: wheelView.height / 2 - wheelRadius
                radiusX: wheelRadius
                radiusY: wheelRadius
                useLargeArc: false
            }
        }
    }

    C.Label {
        id: arrow

        x: 154
        y: 94

        text: "\r"

        scale: 1.5

        transform: [
            Translate { x: 43 },
            Rotation { origin.x: 6; origin.y: 6; angle: root.arrowAngle }
        ]
    }

    RowLayout {
        anchors.centerIn: parent
        C.Label {
            id: ammoNum
            Layout.alignment: Qt.AlignHCenter
            light: true
        }
        Ammo {
            id: ammo
            Layout.alignment: Qt.AlignHCenter
            scale: 0.8
        }
    }

    property vector2d pointer: Qt.vector2d(0, 0)
    readonly property real maxRadius: (72.5 * scaleFactor)

    function show() {
        if (state === "shown")
            return;

        state = "shown";
        for (let i = 0; i < weaponModel.count; ++i) {
            if (weaponModel.get(i).weapon === player.weapon) {
                currentWeaponIndex = i;
                break;
            }
        }

        timeFactor = 0.1;
        view.depthOfField.blurAmount = 10;

        pointer = Qt.vector2d(0, 0);
    }

    function hide() {
        if (state === "hidden")
            return;

        state = "hidden";

        timeFactor = 1.0;

        const mod = weaponModel.get(currentWeaponIndex);
        if (player && (player.items & mod.weapon))
            player.weapon = mod.weapon;
        
        view.depthOfField.blurAmount = 0;
    }

    function processInput(dm) {
        if (root.state !== "shown")
            return;

        const sens = maxRadius / 100;

        pointer.x = pointer.x - dm.x * sens;
        pointer.y = pointer.y - dm.y * sens;

        const len = pointer.length();
        if (len > maxRadius) {
            pointer.x = (pointer.x / len) * maxRadius;
            pointer.y = (pointer.y / len) * maxRadius;
        }

        if (len < 10)
            return;

        let angle = Math.atan2(pointer.y, pointer.x) * 180 / Math.PI + 90;
        angle = Vec.anglemod(angle);
        const sectorSize = 360 / weaponModel.count;

        root.currentWeaponIndex = Math.round(angle / sectorSize) % weaponModel.count;
    }

    function update() {
        if (state !== "shown")
            return;

        const mod = weaponModel.get(currentWeaponIndex);
        ammo.items = mod.ammo;
        if ((mod.weapon === G.Defs.itShotgun) || (mod.weapon === G.Defs.itSuperShotgun))
            ammoNum.text = player.ammo_shells.toString().padStart(3, ' ');
        else if ((mod.weapon === G.Defs.itNailgun) || (mod.weapon === G.Defs.itSuperNailgun))
            ammoNum.text = player.ammo_nails.toString().padStart(3, ' ');
        else if ((mod.weapon === G.Defs.itGrenadeLauncher) || (mod.weapon === G.Defs.itRocketLauncher))
            ammoNum.text = player.ammo_rockets.toString().padStart(3, ' ');
        else if (mod.weapon === G.Defs.itLightning)
            ammoNum.text = player.ammo_cells.toString().padStart(3, ' ');
        else
            ammoNum.text = "";
    }
}
