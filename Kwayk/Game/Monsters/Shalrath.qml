import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import Kwayk.Core

Monster {
    id: root

    readonly property int attack1: 0
    readonly property int attack2: 1
    readonly property int attack3: 2
    readonly property int attack4: 3
    readonly property int attack5: 4
    readonly property int attack6: 5
    readonly property int attack7: 6
    readonly property int attack8: 7
    readonly property int attack9: 8
    readonly property int attack10: 9
    readonly property int attack11: 10

    readonly property int pain1: 11
    readonly property int pain2: 12
    readonly property int pain3: 13
    readonly property int pain4: 14
    readonly property int pain5: 15

    readonly property int death1: 16
    readonly property int death2: 17
    readonly property int death3: 18
    readonly property int death4: 19
    readonly property int death5: 20
    readonly property int death6: 21
    readonly property int death7: 22

    readonly property int walk1: 23
    readonly property int walk2: 24
    readonly property int walk3: 25
    readonly property int walk4: 26
    readonly property int walk5: 27
    readonly property int walk6: 28
    readonly property int walk7: 29
    readonly property int walk8: 30
    readonly property int walk9: 31
    readonly property int walk10: 32
    readonly property int walk11: 33
    readonly property int walk12: 34

    readonly property var missileComponent: Qt.createComponent("../Flies/ShalMissile.qml")

    mins: Qt.vector3d(-0.32, -0.24, -0.32)
    maxs: Qt.vector3d(0.32, 0.64, 0.32)

    classname: "monster_shalrath"
    health: 400
    max_health: 400

    th_stand: shal_stand
    th_walk: shal_walk1
    th_run: shal_run1
    th_missile: shal_attack1
    th_pain: shalrath_pain
    th_die: shalrath_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/shalrath.mdl"
            skin.source: "qrc:/Assets/progs/skins/shalrath.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_shal.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_shal.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/shalrath/idle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: attackSound
        ent: parent
        source: "qrc:/Assets/sounds/shalrath/attack.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: attack2Sound
        ent: parent
        source: "qrc:/Assets/sounds/shalrath/attack2.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: painSound
        ent: parent
        source: "qrc:/Assets/sounds/shalrath/pain.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: deathSound
        ent: parent
        source: "qrc:/Assets/sounds/shalrath/death.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sightSoundFx
        ent: parent
        source: "qrc:/Assets/sounds/shalrath/sight.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
        th.nextthink = time + 0.1 + Math.random() * 0.1;
    }

    function shal_stand() { th.nextFrame(walk1, shal_stand); ai.ai_stand(); }

    function shal_walk1() { th.nextFrame(walk2, shal_walk2);
        if (Math.random() < 0.2)
            idleSound.play();
        ai.ai_walk(0.06);
    }
    function shal_walk2() { th.nextFrame(walk3, shal_walk3); ai.ai_walk(0.04); }
    function shal_walk3() { th.nextFrame(walk4, shal_walk4); ai.ai_walk(0); }
    function shal_walk4() { th.nextFrame(walk5, shal_walk5); ai.ai_walk(0); }
    function shal_walk5() { th.nextFrame(walk6, shal_walk6); ai.ai_walk(0); }
    function shal_walk6() { th.nextFrame(walk7, shal_walk7); ai.ai_walk(0); }
    function shal_walk7() { th.nextFrame(walk8, shal_walk8); ai.ai_walk(0.05); }
    function shal_walk8() { th.nextFrame(walk9, shal_walk9); ai.ai_walk(0.06); }
    function shal_walk9() { th.nextFrame(walk10, shal_walk10); ai.ai_walk(0.05); }
    function shal_walk10() { th.nextFrame(walk11, shal_walk11); ai.ai_walk(0); }
    function shal_walk11() { th.nextFrame(walk12, shal_walk12); ai.ai_walk(0.04); }
    function shal_walk12() { th.nextFrame(walk1, shal_walk1); ai.ai_walk(0.05); }

    function shal_run1() { th.nextFrame(walk2, shal_run2);
        if (Math.random() < 0.2)
            idleSound.play();
        ai.ai_run(0.06);
    }
    function shal_run2() { th.nextFrame(walk3, shal_run3); ai.ai_run(0.04); }
    function shal_run3() { th.nextFrame(walk4, shal_run4); ai.ai_run(0); }
    function shal_run4() { th.nextFrame(walk5, shal_run5); ai.ai_run(0); }
    function shal_run5() { th.nextFrame(walk6, shal_run6); ai.ai_run(0); }
    function shal_run6() { th.nextFrame(walk7, shal_run7); ai.ai_run(0); }
    function shal_run7() { th.nextFrame(walk8, shal_run8); ai.ai_run(0.05); }
    function shal_run8() { th.nextFrame(walk9, shal_run9); ai.ai_run(0.06); }
    function shal_run9() { th.nextFrame(walk10, shal_run10); ai.ai_run(0.05); }
    function shal_run10() { th.nextFrame(walk11, shal_run11); ai.ai_run(0); }
    function shal_run11() { th.nextFrame(walk12, shal_run12); ai.ai_run(0.04); }
    function shal_run12() { th.nextFrame(walk1, shal_run1); ai.ai_run(0.05); }

    function shal_attack1() { th.nextFrame(attack1, shal_attack2); attackSound.play(); fight.ai_face(); }
    function shal_attack2() { th.nextFrame(attack2, shal_attack3); fight.ai_face(); }
    function shal_attack3() { th.nextFrame(attack3, shal_attack4); fight.ai_face(); }
    function shal_attack4() { th.nextFrame(attack4, shal_attack5); fight.ai_face(); }
    function shal_attack5() { th.nextFrame(attack5, shal_attack6); fight.ai_face(); }
    function shal_attack6() { th.nextFrame(attack6, shal_attack7); fight.ai_face(); }
    function shal_attack7() { th.nextFrame(attack7, shal_attack8); fight.ai_face(); }
    function shal_attack8() { th.nextFrame(attack8, shal_attack9); fight.ai_face(); }
    function shal_attack9() { th.nextFrame(attack9, shal_attack10); shalMissile(); }
    function shal_attack10() { th.nextFrame(attack10, shal_attack11); fight.ai_face(); }
    function shal_attack11() { th.nextFrame(attack11, shal_run1); }

    function shal_pain1() { th.nextFrame(pain1, shal_pain2); }
    function shal_pain2() { th.nextFrame(pain2, shal_pain3); }
    function shal_pain3() { th.nextFrame(pain3, shal_pain4); }
    function shal_pain4() { th.nextFrame(pain4, shal_pain5); }
    function shal_pain5() { th.nextFrame(pain5, shal_run1); }

    function shal_death1() { th.nextFrame(death1, shal_death2); }
    function shal_death2() { th.nextFrame(death2, shal_death3); }
    function shal_death3() { th.nextFrame(death3, shal_death4); }
    function shal_death4() { th.nextFrame(death4, shal_death5); }
    function shal_death5() { th.nextFrame(death5, shal_death6); }
    function shal_death6() { th.nextFrame(death6, shal_death7); }
    function shal_death7() { th.nextFrame(death7, shal_death7); }

    function shalrath_pain(attacker, damage) {
        if (pain_finished > time)
            return;
        painSound.play();
        shal_pain1();
        pain_finished = time + 3;
    }

    function shalrath_die() {
        if (health < -90) {
            udeathSound.play();
            throwHead(health);
            throwGib("gib1", health);
            throwGib("gib2", health);
            throwGib("gib3", health);
            return;
        }

        if (takedamage === Defs.damageDead) {
            health = 0;
            return;
        }

        deathSound.play();
        shal_death1();
        walkerDead(true);
    }

    function shalMissile() {
        attack2Sound.play();
        const dir = enemy.position.plus(Qt.vector3d(0, 0.1, 0)).minus(position).normalized();
        const dist = enemy.position.minus(position).length();
        let flytime = dist * 0.2;
        if (flytime < 0.1)
            flytime = 0.1;

        const settings = {
            position: position.plus(Qt.vector3d(0, 0.1, 0)),
            velocity: dir.times(4),
            avelocity: Qt.vector3d(3, 3, 3),
            owner: self,
            enemy: enemy,
            flytime: flytime
        }

        missileComponent.createObject(world, settings);
    }

    function sightSound() {
        sightSoundFx.play();
    }
}
