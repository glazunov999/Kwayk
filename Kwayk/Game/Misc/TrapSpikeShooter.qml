import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core

Entity {
    id: root

    readonly property int superSpike: 1
    readonly property int laser: 2

    use: spikeshooter_use

    Weapons {
        id: weapons
    }

    Sound {
        id: enfireSound
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/enforcer/enfire.wav"
    }

    Sound {
        id: spike2Sound
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/weapons/spike2.wav"
    }

    function spikeshooter_use() {
        if (spawnflags & laser) {
            enfireSound.play();
            weapons.launchLaser(root.position, root.forward);
        } else {
            spike2Sound.play();
            weapons.launch_spike(root.position, root.forward, root.forward.times(5), 1);
        }
    }
}
