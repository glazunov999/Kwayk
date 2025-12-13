import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core

Monster {
    id: root

    readonly property int cruc1: 192
    readonly property int cruc2: 193
    readonly property int cruc3: 194
    readonly property int cruc4: 195
    readonly property int cruc5: 196
    readonly property int cruc6: 197

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_zombie"
    health: 30
    max_health: 30

    takedamage: Defs.damageAim
    th.movetype: ""

    th_pain: zombie_pain
    th_die: zombie_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/zombie.mdl"
            skin.source: "qrc:/Assets/progs/skins/zombie.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_zombie.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_zombie.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        attenuationType: Defs.attnStatic
        source: "qrc:/Assets/sounds/zombie/idle_w2.wav"
    }

    Sound {
        id: gibSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_gib.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: painSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_pain.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: pain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_pain1.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        zombie_cruc1();
    }

    function zombie_cruc1() {
        th.nextFrame(cruc1, zombie_cruc2, 0.1 + Math.random() * 0.1);
        if (Math.random() < 0.1)
            idleSound.play();
    }
    function zombie_cruc2() { th.nextFrame(cruc2, zombie_cruc3, 0.1 + Math.random() * 0.1); }
    function zombie_cruc3() { th.nextFrame(cruc3, zombie_cruc4, 0.1 + Math.random() * 0.1); }
    function zombie_cruc4() { th.nextFrame(cruc4, zombie_cruc5, 0.1 + Math.random() * 0.1); }
    function zombie_cruc5() { th.nextFrame(cruc5, zombie_cruc6, 0.1 + Math.random() * 0.1); }
    function zombie_cruc6() { th.nextFrame(cruc6, zombie_cruc1, 0.1 + Math.random() * 0.1); }

    function zombie_die() {
        gibSound.play();
        throwHead(health);
        throwGib("gib1", health);
        throwGib("gib2", health);
        throwGib("gib3", health);
    }

    function zombie_pain(attacker, damage) {
        health = 30;

        if (damage < 9)
            return;

        if (pain_finished > time)
            return;

        pain_finished = time + 3;

        const r = Math.random();
        if (r < 0.25)
            painSound.play();
        else if (r < 0.5)
            pain1Sound.play();
        else if (r < 0.75)
            pain1Sound.play();
        else
           painSound.play();;
    }

    function sightSound() {
        // empty
    }
}
