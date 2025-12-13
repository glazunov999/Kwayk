import QtQuick

import Kwayk.Game

Entity {
    id: root

    property int bubble_count: 0
    property real air_finished: 0

    th.think: deathBubblesSpawn

    Component.onCompleted: {
        th.nextthink = time + 0.1;
    }

    function deathBubblesSpawn() {
        if (owner.waterlevel !== 3)
            return;

        const pos = owner.position.plus(Qt.vector3d(0, 0.24, 0));
        particles.spawnBubble(pos);

        th.nextthink = time + 0.1;
        if (++air_finished >= bubble_count)
            root.destroy();
    }
}
