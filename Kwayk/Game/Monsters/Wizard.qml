import QtQuick
import QtQuick3D

import Backend
import Kwayk.Core
import Kwayk.Game

Monster {
    id: root

    readonly property int hover1: 0
    readonly property int hover2: 1
    readonly property int hover3: 2
    readonly property int hover4: 3
    readonly property int hover5: 4
    readonly property int hover6: 5
    readonly property int hover7: 6
    readonly property int hover8: 7
    readonly property int hover9: 8
    readonly property int hover10: 9
    readonly property int hover11: 10
    readonly property int hover12: 11
    readonly property int hover13: 12
    readonly property int hover14: 13
    readonly property int hover15: 14

    readonly property int fly1: 15
    readonly property int fly2: 16
    readonly property int fly3: 17
    readonly property int fly4: 18
    readonly property int fly5: 19
    readonly property int fly6: 20
    readonly property int fly7: 21
    readonly property int fly8: 22
    readonly property int fly9: 23
    readonly property int fly10: 24
    readonly property int fly11: 25
    readonly property int fly12: 26
    readonly property int fly13: 27
    readonly property int fly14: 28

    readonly property int magatt1: 29
    readonly property int magatt2: 30
    readonly property int magatt3: 31
    readonly property int magatt4: 32
    readonly property int magatt5: 33
    readonly property int magatt6: 34
    readonly property int magatt7: 35
    readonly property int magatt8: 36
    readonly property int magatt9: 37
    readonly property int magatt10: 38
    readonly property int magatt11: 39
    readonly property int magatt12: 40
    readonly property int magatt13: 41

    readonly property int pain1: 42
    readonly property int pain2: 43
    readonly property int pain3: 44
    readonly property int pain4: 45

    readonly property int death1: 46
    readonly property int death2: 47
    readonly property int death3: 48
    readonly property int death4: 49
    readonly property int death5: 50
    readonly property int death6: 51
    readonly property int death7: 52
    readonly property int death8: 53

    property real waitmin: 0

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_wizard"
    health: 80
    max_health: 80

    th.movetype: "fly"

    th_stand: wiz_stand1
    th_walk: wiz_walk1
    th_run: wiz_run1
    th_missile: wiz_missile
    th_pain: wiz_pain
    th_die: wiz_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/wizard.mdl"
            skin.source: "qrc:/Assets/progs/skins/wizard.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_wizard.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_wizard.png"
            active: false
        }
    }

    Sound {
        id: wattackSound
        ent: parent
        source: "qrc:/Assets/sounds/wizard/wattack.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: widle1Sound
        ent: parent
        source: "qrc:/Assets/sounds/wizard/widle1.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: widle2Sound
        ent: parent
        source: "qrc:/Assets/sounds/wizard/widle2.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: wdeathSound
        ent: parent
        source: "qrc:/Assets/sounds/wizard/wdeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: wpainSound
        ent: parent
        source: "qrc:/Assets/sounds/wizard/wpain.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: wsightSound
        ent: parent
        source: "qrc:/Assets/sounds/wizard/wsight.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        flymonster_start();
    }

    function wizardAttackFinished() {
        if (enemy_range >= Defs.rangeMid || !enemy_visible) {
            attack_state = Defs.asStraight;
            th.think = wiz_run1;
        } else {
            attack_state = Defs.asSliding;
            th.think = wiz_side1;
        }
    }

    Think {
        id: fire1Think
        think: () => wiz_fastFire(1);
    }

    Think {
        id: fire2Think
        think: () => wiz_fastFire(-1);
    }

    function wiz_fastFire(n) {
        if (health > 0) {
            effects = effects | Defs.efMuzzleflash;

            const org = position.plus(Qt.vector3d(0, 0.3, 0)).plus(forward.times(0.14)).plus(right.times(0.14 * n));
            const dst = enemy.position.minus(right.times(0.13 * n));
            const vec = dst.minus(org).normalized();
            wattackSound.play();

            weapons.launch_spike(org, vec, vec.times(6), 2);
        }
    }

    function wiz_startFast() {
        wattackSound.play();
        fire1Think.nextthink = time + 0.8;
        fire2Think.nextthink = time + 0.3;
    }

    function wiz_idlesound() {
        if (waitmin < time) {
            const wr = Math.random() * 5;
            if (wr > 4.5)
                widle1Sound.play();
            else if (wr < 1.5)
                widle2Sound.play();
        }
    }

    function wiz_stand1() { th.nextFrame(hover1, wiz_stand2); ai.ai_stand(); }
    function wiz_stand2() { th.nextFrame(hover2, wiz_stand3); ai.ai_stand(); }
    function wiz_stand3() { th.nextFrame(hover3, wiz_stand4); ai.ai_stand(); }
    function wiz_stand4() { th.nextFrame(hover4, wiz_stand5); ai.ai_stand(); }
    function wiz_stand5() { th.nextFrame(hover5, wiz_stand6); ai.ai_stand(); }
    function wiz_stand6() { th.nextFrame(hover6, wiz_stand7); ai.ai_stand(); }
    function wiz_stand7() { th.nextFrame(hover7, wiz_stand8); ai.ai_stand(); }
    function wiz_stand8() { th.nextFrame(hover8, wiz_stand1); ai.ai_stand(); }

    function wiz_walk1() { th.nextFrame(hover1, wiz_walk2); ai.ai_walk(0.08); wiz_idlesound(); }
    function wiz_walk2() { th.nextFrame(hover2, wiz_walk3); ai.ai_walk(0.08); }
    function wiz_walk3() { th.nextFrame(hover3, wiz_walk4); ai.ai_walk(0.08); }
    function wiz_walk4() { th.nextFrame(hover4, wiz_walk5); ai.ai_walk(0.08); }
    function wiz_walk5() { th.nextFrame(hover5, wiz_walk6); ai.ai_walk(0.08); }
    function wiz_walk6() { th.nextFrame(hover6, wiz_walk7); ai.ai_walk(0.08); }
    function wiz_walk7() { th.nextFrame(hover7, wiz_walk8); ai.ai_walk(0.08); }
    function wiz_walk8() { th.nextFrame(hover8, wiz_walk1); ai.ai_walk(0.08); }

    function wiz_side1() { th.nextFrame(hover1, wiz_side2); ai.ai_run(0.08); wiz_idlesound(); }
    function wiz_side2() { th.nextFrame(hover2, wiz_side3); ai.ai_run(0.08); }
    function wiz_side3() { th.nextFrame(hover3, wiz_side4); ai.ai_run(0.08); }
    function wiz_side4() { th.nextFrame(hover4, wiz_side5); ai.ai_run(0.08); }
    function wiz_side5() { th.nextFrame(hover5, wiz_side6); ai.ai_run(0.08); }
    function wiz_side6() { th.nextFrame(hover6, wiz_side7); ai.ai_run(0.08); }
    function wiz_side7() { th.nextFrame(hover7, wiz_side8); ai.ai_run(0.08); }
    function wiz_side8() { th.nextFrame(hover8, wiz_side1); ai.ai_run(0.08); }

    function wiz_run1() { th.nextFrame(fly1, wiz_run2); ai.ai_run(0.16); wiz_idlesound(); }
    function wiz_run2() { th.nextFrame(fly2, wiz_run3); ai.ai_run(0.16); }
    function wiz_run3() { th.nextFrame(fly3, wiz_run4); ai.ai_run(0.16); }
    function wiz_run4() { th.nextFrame(fly4, wiz_run5); ai.ai_run(0.16); }
    function wiz_run5() { th.nextFrame(fly5, wiz_run6); ai.ai_run(0.16); }
    function wiz_run6() { th.nextFrame(fly6, wiz_run7); ai.ai_run(0.16); }
    function wiz_run7() { th.nextFrame(fly7, wiz_run8); ai.ai_run(0.16); }
    function wiz_run8() { th.nextFrame(fly8, wiz_run9); ai.ai_run(0.16); }
    function wiz_run9() { th.nextFrame(fly9, wiz_run10); ai.ai_run(0.16); }
    function wiz_run10() { th.nextFrame(fly10, wiz_run11); ai.ai_run(0.16); }
    function wiz_run11() { th.nextFrame(fly11, wiz_run12); ai.ai_run(0.16); }
    function wiz_run12() { th.nextFrame(fly12, wiz_run13); ai.ai_run(0.16); }
    function wiz_run13() { th.nextFrame(fly13, wiz_run14); ai.ai_run(0.16); }
    function wiz_run14() { th.nextFrame(fly14, wiz_run1); ai.ai_run(0.16); }

    function wiz_fast1() { th.nextFrame(magatt1, wiz_fast2); fight.ai_face(); wiz_startFast(); }
    function wiz_fast2() { th.nextFrame(magatt2, wiz_fast3); fight.ai_face(); }
    function wiz_fast3() { th.nextFrame(magatt3, wiz_fast4); fight.ai_face(); }
    function wiz_fast4() { th.nextFrame(magatt4, wiz_fast5); fight.ai_face(); }
    function wiz_fast5() { th.nextFrame(magatt5, wiz_fast6); fight.ai_face(); }
    function wiz_fast6() { th.nextFrame(magatt6, wiz_fast7); fight.ai_face(); }
    function wiz_fast7() { th.nextFrame(magatt5, wiz_fast8); fight.ai_face(); }
    function wiz_fast8() { th.nextFrame(magatt4, wiz_fast9); fight.ai_face(); }
    function wiz_fast9() { th.nextFrame(magatt3, wiz_fast10); fight.ai_face(); }
    function wiz_fast10() { th.nextFrame(magatt2, wiz_run1);
        fight.ai_face();
        attackFinished(2);
        wizardAttackFinished();
    }

    function wiz_pain1() { th.nextFrame(pain1, wiz_pain2); }
    function wiz_pain2() { th.nextFrame(pain2, wiz_pain3); }
    function wiz_pain3() { th.nextFrame(pain3, wiz_pain4); }
    function wiz_pain4() { th.nextFrame(pain4, wiz_run1); }

    function wiz_death1() { th.nextFrame(death1, wiz_death2);
        velocity.x = -2 + 4 * Math.random();
        velocity.z = -2 + 4 * Math.random();
        velocity.y = 1 + 1 * Math.random();
        onGround = false;
        wdeathSound.play();
    }
    function wiz_death2() { th.nextFrame(death2, wiz_death3); }
    function wiz_death3() { th.nextFrame(death3, wiz_death4); walkerDead(true); }
    function wiz_death4() { th.nextFrame(death4, wiz_death5); }
    function wiz_death5() { th.nextFrame(death5, wiz_death6); }
    function wiz_death6() { th.nextFrame(death6, wiz_death7); }
    function wiz_death7() { th.nextFrame(death7, wiz_death8); }
    function wiz_death8() { th.nextFrame(death8, wiz_death8); }

    function wiz_die() {
        if (health < -40) {
            udeathSound.play();
            throwHead(health);
            throwGib("gib2", health);
            throwGib("gib2", health);
            throwGib("gib2", health);
            return;
        }

        if (takedamage === Defs.damageDead) {
            health = 0;
            return;
        }

        wiz_death1();
    }

    function wiz_pain(attacker, damage) {
        wpainSound.play();
        if ((Math.random() * 70) > damage)
            return;

        wiz_pain1();
    }

    function wiz_missile() {
        wiz_fast1();
    }

    function wizardCheckAttack() {
        if (time < attack_finished)
            return false;

        if (!enemy_visible)
            return false;

        if (enemy_range === Defs.rangeFar) {
            if (attack_state !== Defs.asStraight) {
                attack_state = Defs.asStraight;
                wiz_run1();
            }
            return false;
        }

        const targ = enemy;

        const spot1 = position.plus(view_ofs);
        const spot2 = targ.position.plus(targ.view_ofs);

        const trace = physicsSystem.castRay(spot1, spot2.minus(spot1), Layers.Normal, [body]);

        if (!trace?.body || trace.body.ent !== targ) {
            if (attack_state !== Defs.asStraight) {
                attack_state = Defs.asStraight;
                wiz_run1();
            }
            return false;
        }

        let chance = 0;
        if (enemy_range === Defs.rangeMelee)
            chance = 0.9;
        else if (enemy_range === Defs.rangeNear)
            chance = 0.6;
        else if (enemy_range === Defs.rangeMid)
            chance = 0.2;

        if (Math.random() < chance) {
            attack_state = Defs.asMissile;
            return true;
        }

        if (enemy_range === Defs.rangeMid) {
            if (attack_state !== Defs.asStraight) {
                attack_state = Defs.asStraight;
                wiz_run1();
            }
        } else {
            if (attack_state !== Defs.asSliding) {
                attack_state = Defs.asSliding;
                wiz_side1();
            }
        }

        return false;
    }

    function sightSound() {
        wsightSound.play();
    }
}
