import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.JoltPhysics

import Kwayk.Game

Node {
    id: root

    property vector3d endpos: Qt.vector3d(0, 0, 0)
    property var bolts: []
    property int count: 0

    property int type: 2

    eulerRotation: Quaternion.lookAt(position, endpos).toEulerAngles()

    Component {
        id: boltComponent
        Alias {
            mdl.source: "qrc:/Assets/progs/bolt" + (type === 3 ? "3" : type === 2 ? "2" : "") + ".mdl"
            skin.source: "qrc:/Assets/progs/skins/bolt" + (type === 3 ? "3" : type === 2 ? "2" : "") + ".png"
            active: false
        }
    }

    Think {
        id: updateTimer
        enabled: false
        think: root.update
    }

    function update() {
        if (bolts.length === 0)
            return;

        for (let i = 0; i < count; ++i) {
            const bolt = bolts[i];
            bolt.visible = false;
        }
        const dist = endpos.minus(position);
        count = Math.floor(dist.length() / 0.3);
        for (let i = 0; i < count; ++i) {
            const bolt = bolts[i];
            bolt.visible = true;
            bolt.eulerRotation.z = Math.random() * 360;
        }

        updateTimer.nextthink = time + 0.016
    }

    Think {
        id: removeTimer
        enabled: false
        think: remove
    }

    function remove() {
        updateTimer.enabled = false;
        removeTimer.enabled = false;
        for (let i = 0; i < bolts.length; ++i) {
            const bolt = bolts[i];
            bolt.destroy();
        }
        bolts = [];
    }

    function fire() {
        if (removeTimer.enabled) {
            removeTimer.nextthink = time + 0.2
            return;
        }

        count = 21;
        const org = Qt.vector3d(0, 0, 0);
        for (let i = 0; i < count; ++i) {
            const bolt = boltComponent.createObject(root, { position: org });
            bolts.push(bolt);
            org.z -= 0.3;
        }

        removeTimer.nextthink = time + 0.2
        removeTimer.enabled = true;
        updateTimer.nextthink = time + 0.016
        updateTimer.enabled = true;
        update();
    }
}
