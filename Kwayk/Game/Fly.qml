import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Game

Entity {
    id: root

    readonly property alias combat: combat

    property Component bodyComponent

    Combat {
        id: combat
    }

    FlyTrail {
        target: root
    }

    function initFly() {
        const target = position.plus(velocity);
        const angles = Quaternion.lookAt(position, target).toEulerAngles();
        body = bodyComponent.createObject(world, { position: root.position, eulerRotation: angles });
        position = Qt.binding(function() { return body.position });
        eulerRotation = Qt.binding(function() { return body.eulerRotation });
        if (owner?.body)
            contactListener.addRejectedBodyPair(body.bodyID, owner.body.bodyID);
        body.setLinearVelocity(velocity);
    }

    function remove() {
        root.destroy();
        body.destroy();
    }

    Component.onDestruction: {
        if (owner?.body)
            contactListener.removeRejectedBodyPair(body.bodyID, owner.body.bodyID);
    }
}
