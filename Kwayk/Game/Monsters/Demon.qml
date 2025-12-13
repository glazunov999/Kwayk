import QtQuick
import QtQuick3D

import Backend
import Kwayk.Core
import Kwayk.Game

Monster {
    id: root

    readonly property int stand1: 0
    readonly property int stand2: 1
    readonly property int stand3: 2
    readonly property int stand4: 3
    readonly property int stand5: 4
    readonly property int stand6: 5
    readonly property int stand7: 6
    readonly property int stand8: 7
    readonly property int stand9: 8
    readonly property int stand10: 9
    readonly property int stand11: 10
    readonly property int stand12: 11
    readonly property int stand13: 12

    readonly property int walk1: 13
    readonly property int walk2: 14
    readonly property int walk3: 15
    readonly property int walk4: 16
    readonly property int walk5: 17
    readonly property int walk6: 18
    readonly property int walk7: 19
    readonly property int walk8: 20

    readonly property int run1: 21
    readonly property int run2: 22
    readonly property int run3: 23
    readonly property int run4: 24
    readonly property int run5: 25
    readonly property int run6: 26

    readonly property int leap1: 27
    readonly property int leap2: 28
    readonly property int leap3: 29
    readonly property int leap4: 30
    readonly property int leap5: 31
    readonly property int leap6: 32
    readonly property int leap7: 33
    readonly property int leap8: 34
    readonly property int leap9: 35
    readonly property int leap10: 36
    readonly property int leap11: 37
    readonly property int leap12: 38

    readonly property int pain1: 39
    readonly property int pain2: 40
    readonly property int pain3: 41
    readonly property int pain4: 42
    readonly property int pain5: 43
    readonly property int pain6: 44

    readonly property int death1: 45
    readonly property int death2: 46
    readonly property int death3: 47
    readonly property int death4: 48
    readonly property int death5: 49
    readonly property int death6: 50
    readonly property int death7: 51
    readonly property int death8: 52
    readonly property int death9: 53

    readonly property int attacka1: 54
    readonly property int attacka2: 55
    readonly property int attacka3: 56
    readonly property int attacka4: 57
    readonly property int attacka5: 58
    readonly property int attacka6: 59
    readonly property int attacka7: 60
    readonly property int attacka8: 61
    readonly property int attacka9: 62
    readonly property int attacka10: 63
    readonly property int attacka11: 64
    readonly property int attacka12: 65
    readonly property int attacka13: 66
    readonly property int attacka14: 67
    readonly property int attacka15: 68

    mins: Qt.vector3d(-0.32, -0.24, -0.32)
    maxs: Qt.vector3d(0.32, 0.64, 0.32)

    classname: "monster_demon1"
    health: 300
    max_health: 300

    th_stand: demon1_stand1
    th_walk: demon1_walk1
    th_run: demon1_run1
    th_melee: demon_meleeAttack
    th_missile: demon1_jump1
    th_pain: demon1_pain
    th_die: demon_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/demon.mdl"
            skin.source: "qrc:/Assets/progs/skins/demon.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_demon.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_demon.png"
            active: false
        }
    }

    Sound {
        id: idle1Sound
        ent: parent
        source: "qrc:/Assets/sounds/demon/idle1.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: dpain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/demon/dpain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: ddeathSound
        ent: parent
        source: "qrc:/Assets/sounds/demon/ddeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: djumpSound
        ent: parent
        source: "qrc:/Assets/sounds/demon/djump.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: dhit2Sound
        ent: parent
        source: "qrc:/Assets/sounds/demon/dhit2.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight2Sound
        ent: parent
        source: "qrc:/Assets/sounds/demon/sight2.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function demon1_stand1() { th.nextFrame(stand1, demon1_stand2); ai.ai_stand(); }
    function demon1_stand2() { th.nextFrame(stand2, demon1_stand3); ai.ai_stand(); }
    function demon1_stand3() { th.nextFrame(stand3, demon1_stand4); ai.ai_stand(); }
    function demon1_stand4() { th.nextFrame(stand4, demon1_stand5); ai.ai_stand(); }
    function demon1_stand5() { th.nextFrame(stand5, demon1_stand6); ai.ai_stand(); }
    function demon1_stand6() { th.nextFrame(stand6, demon1_stand7); ai.ai_stand(); }
    function demon1_stand7() { th.nextFrame(stand7, demon1_stand8); ai.ai_stand(); }
    function demon1_stand8() { th.nextFrame(stand8, demon1_stand9); ai.ai_stand(); }
    function demon1_stand9() { th.nextFrame(stand9, demon1_stand10); ai.ai_stand(); }
    function demon1_stand10() { th.nextFrame(stand10, demon1_stand11); ai.ai_stand(); }
    function demon1_stand11() { th.nextFrame(stand11, demon1_stand12); ai.ai_stand(); }
    function demon1_stand12() { th.nextFrame(stand12, demon1_stand13); ai.ai_stand(); }
    function demon1_stand13() { th.nextFrame(stand13, demon1_stand1); ai.ai_stand(); }

    function demon1_walk1() { th.nextFrame(walk1, demon1_walk2);
        if (Math.random() < 0.2)
            idle1Sound.play();
        ai.ai_walk(0.08);
    }
    function demon1_walk2() { th.nextFrame(walk2, demon1_walk3); ai.ai_walk(0.06); }
    function demon1_walk3() { th.nextFrame(walk3, demon1_walk4); ai.ai_walk(0.06); }
    function demon1_walk4() { th.nextFrame(walk4, demon1_walk5); ai.ai_walk(0.07); }
    function demon1_walk5() { th.nextFrame(walk5, demon1_walk6); ai.ai_walk(0.04); }
    function demon1_walk6() { th.nextFrame(walk6, demon1_walk7); ai.ai_walk(0.06); }
    function demon1_walk7() { th.nextFrame(walk7, demon1_walk8); ai.ai_walk(0.10); }
    function demon1_walk8() { th.nextFrame(walk8, demon1_walk1); ai.ai_walk(0.10); }

    function demon1_run1() { th.nextFrame(run1, demon1_run2);
        if (Math.random() < 0.2)
            idle1Sound.play();
        ai.ai_run(0.20);
    }
    function demon1_run2() { th.nextFrame(run2, demon1_run3); ai.ai_run(0.15); }
    function demon1_run3() { th.nextFrame(run3, demon1_run4); ai.ai_run(0.36); }
    function demon1_run4() { th.nextFrame(run4, demon1_run5); ai.ai_run(0.20); }
    function demon1_run5() { th.nextFrame(run5, demon1_run6); ai.ai_run(0.15); }
    function demon1_run6() { th.nextFrame(run6, demon1_run1); ai.ai_run(0.36); }

    function demon1_jump1() { th.nextFrame(leap1, demon1_jump2); fight.ai_face(); }
    function demon1_jump2() { th.nextFrame(leap2, demon1_jump3); fight.ai_face();}
    function demon1_jump3() { th.nextFrame(leap3, demon1_jump4); fight.ai_face();}
    function demon1_jump4() { th.nextFrame(leap4, demon1_jump5);
        fight.ai_face();

        touch = demon_jumpTouch;
        velocity = forward.times(6).plus(Qt.vector3d(0, 2.5, 0));
        onGround = false;
    }
    function demon1_jump5() { th.nextFrame(leap5, demon1_jump6); }
    function demon1_jump6() { th.nextFrame(leap6, demon1_jump7); }
    function demon1_jump7() { th.nextFrame(leap7, demon1_jump8); }
    function demon1_jump8() { th.nextFrame(leap8, demon1_jump9); }
    function demon1_jump9() { th.nextFrame(leap9, demon1_jump10); }
    function demon1_jump10() { th.nextFrame(leap10, demon1_jump1); th.nextthink = time + 3; } // if three seconds pass, assume demon is stuck

    function demon1_jump11() { th.nextFrame(leap11, demon1_jump12); }
    function demon1_jump12() { th.nextFrame(leap12, demon1_run1); }

    function demon1_atta1() { th.nextFrame(attacka1, demon1_atta2); fight.ai_charge(0.04); }
    function demon1_atta2() { th.nextFrame(attacka2, demon1_atta3); fight.ai_charge(0); }
    function demon1_atta3() { th.nextFrame(attacka3, demon1_atta4); fight.ai_charge(0); }
    function demon1_atta4() { th.nextFrame(attacka4, demon1_atta5); fight.ai_charge(0.01); }
    function demon1_atta5() { th.nextFrame(attacka5, demon1_atta6); fight.ai_charge(0.02); demon_melee(2); }
    function demon1_atta6() { th.nextFrame(attacka6, demon1_atta7); fight.ai_charge(0.01); }
    function demon1_atta7() { th.nextFrame(attacka7, demon1_atta8); fight.ai_charge(0.06); }
    function demon1_atta8() { th.nextFrame(attacka8, demon1_atta9); fight.ai_charge(0.08); }
    function demon1_atta9() { th.nextFrame(attacka9, demon1_atta10); fight.ai_charge(0.04); }
    function demon1_atta10() { th.nextFrame(attacka10, demon1_atta11); fight.ai_charge(0.02); }
    function demon1_atta11() { th.nextFrame(attacka11, demon1_atta12); demon_melee(-2);  }
    function demon1_atta12() { th.nextFrame(attacka12, demon1_atta13); fight.ai_charge(0.05); }
    function demon1_atta13() { th.nextFrame(attacka13, demon1_atta14); fight.ai_charge(0.08); }
    function demon1_atta14() { th.nextFrame(attacka14, demon1_atta15); fight.ai_charge(0.04); }
    function demon1_atta15() { th.nextFrame(attacka15, demon1_run1); fight.ai_charge(0.04); }

    function demon1_pain1() { th.nextFrame(pain1, demon1_pain2); }
    function demon1_pain2() { th.nextFrame(pain2, demon1_pain3); }
    function demon1_pain3() { th.nextFrame(pain3, demon1_pain4); }
    function demon1_pain4() { th.nextFrame(pain4, demon1_pain5); }
    function demon1_pain5() { th.nextFrame(pain5, demon1_pain6); }
    function demon1_pain6() { th.nextFrame(pain6, demon1_run1); }

    function demon1_pain(attacker, damage) {
        if (touch === demon_jumpTouch)
            return;

        if (pain_finished > time)
            return;

        pain_finished = time + 1;
        dpain1Sound.play();

        if ((Math.random() * 200) > damage)
            return;

        demon1_pain1();
    }

    function demon1_die1() { th.nextFrame(death1, demon1_die2); ddeathSound.play(); }
    function demon1_die2() { th.nextFrame(death2, demon1_die3); }
    function demon1_die3() { th.nextFrame(death3, demon1_die4); }
    function demon1_die4() { th.nextFrame(death4, demon1_die5); }
    function demon1_die5() { th.nextFrame(death5, demon1_die6); }
    function demon1_die6() { th.nextFrame(death6, demon1_die7); walkerDead(true); }
    function demon1_die7() { th.nextFrame(death7, demon1_die8); }
    function demon1_die8() { th.nextFrame(death8, demon1_die9); }
    function demon1_die9() { th.nextFrame(death9, demon1_die9); }

    function demon_die() {
        if (health < -80) {
            udeathSound.play();
            throwHead(health);
            throwGib("gib1", health);
            throwGib("gib1", health);
            throwGib("gib1", health);
            return;
        }

        if (takedamage === Defs.damageDead) {
            health = 0;
            return;
        }

        demon1_die1();
    }

    function demon_meleeAttack() {
        demon1_atta1();
    }

    function demon_melee(side) {
        fight.ai_face();
        walkmove(ideal_yaw, 0.12);

        const delta = enemy.position.minus(position);
        if (delta.length() > 1)
            return;

        if (!weapons.canDamage(enemy, self))
            return;

        dhit2Sound.play();
        const ldmg = 10 + 5 * Math.random();
        weapons.t_damage(enemy, self, self, ldmg);

        weapons.spawnMeatSpray(position.plus(forward.times(0.16)), right.times(side));
    }

    function demon_jumpTouch() {
        if (health <= 0)
            return;

        if (other.takedamage) {
            if (velocity.length() > 4) {
                const ldmg = 40 + 10 * Math.random();
                weapons.t_damage(other, self, self, ldmg);
            }
        }

        if (!checkBottom(Qt.vector3d(0, 0, 0))) {
            if (onGround) {
                touch = null;
                th.think = demon1_jump1;
                th.nextthink = time + 0.1;
            }
            return;
        }

        touch = null;
        th.think = demon1_jump11;
        th.nextthink = time + 0.1;
    }

    function checkDemonMelee() {
        if (enemy_range == Defs.rangeMelee) {
            attack_state = Defs.asMelee;
            return true;
        }
        return false;
    }

    function checkDemonJump() {
        if ((position.y + mins.y) > (enemy.position.y + enemy.mins.y + (0.75 * enemy.size.y)))
            return false;
        if ((position.y + maxs.y) < (enemy.position.y + enemy.mins.y + (0.25 * enemy.size.y)))
            return false;

        const dist = enemy.position.minus(position);
        dist.y = 0;

        const d = dist.length();
        if (d < 1)
            return false;
        if (d > 2) {
            if (Math.random() < 0.9)
                return false;
        }

        return true;
    }

    function demonCheckAttack() {
        if (checkDemonMelee()) {
            attack_state = Defs.asMelee;
            return true;
        }

        if (checkDemonJump()) {
            attack_state = Defs.asMissile;
            djumpSound.play();
            return true;
        }

        return false;
    }

    function sightSound() {
        sight2Sound.play();
    }
}
