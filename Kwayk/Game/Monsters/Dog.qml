import QtQuick
import QtQuick3D

import Backend
import Kwayk.Core
import Kwayk.Game

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

    readonly property int death1: 8
    readonly property int death2: 9
    readonly property int death3: 10
    readonly property int death4: 11
    readonly property int death5: 12
    readonly property int death6: 13
    readonly property int death7: 14
    readonly property int death8: 15
    readonly property int death9: 16

    readonly property int deathb1: 17
    readonly property int deathb2: 18
    readonly property int deathb3: 19
    readonly property int deathb4: 20
    readonly property int deathb5: 21
    readonly property int deathb6: 22
    readonly property int deathb7: 23
    readonly property int deathb8: 24
    readonly property int deathb9: 25

    readonly property int pain1: 26
    readonly property int pain2: 27
    readonly property int pain3: 28
    readonly property int pain4: 29
    readonly property int pain5: 30
    readonly property int pain6: 31

    readonly property int painb1: 32
    readonly property int painb2: 33
    readonly property int painb3: 34
    readonly property int painb4: 35
    readonly property int painb5: 36
    readonly property int painb6: 37
    readonly property int painb7: 38
    readonly property int painb8: 39
    readonly property int painb9: 40
    readonly property int painb10: 41
    readonly property int painb11: 42
    readonly property int painb12: 43
    readonly property int painb13: 44
    readonly property int painb14: 45
    readonly property int painb15: 46
    readonly property int painb16: 47

    readonly property int run1: 48
    readonly property int run2: 49
    readonly property int run3: 50
    readonly property int run4: 51
    readonly property int run5: 52
    readonly property int run6: 53
    readonly property int run7: 54
    readonly property int run8: 55
    readonly property int run9: 56
    readonly property int run10: 57
    readonly property int run11: 58
    readonly property int run12: 59

    readonly property int leap1: 60
    readonly property int leap2: 61
    readonly property int leap3: 62
    readonly property int leap4: 63
    readonly property int leap5: 64
    readonly property int leap6: 65
    readonly property int leap7: 66
    readonly property int leap8: 67
    readonly property int leap9: 68

    readonly property int stand1: 69
    readonly property int stand2: 70
    readonly property int stand3: 71
    readonly property int stand4: 72
    readonly property int stand5: 73
    readonly property int stand6: 74
    readonly property int stand7: 75
    readonly property int stand8: 76
    readonly property int stand9: 77

    readonly property int walk1: 78
    readonly property int walk2: 79
    readonly property int walk3: 80
    readonly property int walk4: 81
    readonly property int walk5: 82
    readonly property int walk6: 83
    readonly property int walk7: 84
    readonly property int walk8: 85

    mins: Qt.vector3d(-0.32, -0.24, -0.32)
    maxs: Qt.vector3d(0.32, 0.40, 0.32)

    classname: "monster_dog"
    health: 25

    th_stand: dog_stand1
    th_walk: dog_walk1
    th_run: dog_run1
    th_pain: dog_pain
    th_die: dog_die
    th_melee: dog_atta1
    th_missile: dog_leap1

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/dog.mdl"
            skin.source: "qrc:/Assets/progs/skins/dog.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_dog.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_dog.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/dog/idle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: dattack1Sound
        ent: parent
        source: "qrc:/Assets/sounds/dog/dattack1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: dpain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/dog/dpain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: ddeathSound
        ent: parent
        source: "qrc:/Assets/sounds/dog/ddeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: dsightSound
        ent: parent
        source: "qrc:/Assets/sounds/dog/dsight.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function dog_bite() {
        if (!enemy)
            return;

        fight.ai_charge(0.10);

        if (!weapons.canDamage(enemy, self))
            return;

        const delta = enemy.position.minus(position);
        if (delta.length() > 1)
            return;

        const ldmg = (Math.random() + Math.random() + Math.random()) * 8;
        weapons.t_damage(enemy, self, self, ldmg);
    }

    function dog_jumpTouch() {
        if (health <= 0)
            return;

        if (other.takedamage) {
            if (velocity.length() > 3) {
                const ldmg = 10 + 10 * Math.random();
                weapons.t_damage(other, self, self, ldmg);
            }
        }

        if (!checkBottom(Qt.vector3d(0, 0, 0))) {
            if (onGround) {
                touch = null;
                th.think = dog_leap1;
                th.nextthink = time + 0.1;
            }
            return;
        }

        touch = null;
        th.think = dog_run1;
        th.nextthink = time + 0.1;
    }

    function dog_stand1() { th.nextFrame(stand1, dog_stand2); ai.ai_stand(); }
    function dog_stand2() { th.nextFrame(stand2, dog_stand3); ai.ai_stand(); }
    function dog_stand3() { th.nextFrame(stand3, dog_stand4); ai.ai_stand(); }
    function dog_stand4() { th.nextFrame(stand4, dog_stand5); ai.ai_stand(); }
    function dog_stand5() { th.nextFrame(stand5, dog_stand6); ai.ai_stand(); }
    function dog_stand6() { th.nextFrame(stand6, dog_stand7); ai.ai_stand(); }
    function dog_stand7() { th.nextFrame(stand7, dog_stand8); ai.ai_stand(); }
    function dog_stand8() { th.nextFrame(stand8, dog_stand9); ai.ai_stand(); }
    function dog_stand9() { th.nextFrame(stand9, dog_stand1); ai.ai_stand(); }

    function dog_walk1() { th.nextFrame(walk1, dog_walk2);
        if (Math.random() < 0.2)
            idleSound.play();
        ai.ai_walk(0.08);
    }
    function dog_walk2() { th.nextFrame(walk2, dog_walk3); ai.ai_walk(0.08); }
    function dog_walk3() { th.nextFrame(walk3, dog_walk4); ai.ai_walk(0.08); }
    function dog_walk4() { th.nextFrame(walk4, dog_walk5); ai.ai_walk(0.08); }
    function dog_walk5() { th.nextFrame(walk5, dog_walk6); ai.ai_walk(0.08); }
    function dog_walk6() { th.nextFrame(walk6, dog_walk7); ai.ai_walk(0.08); }
    function dog_walk7() { th.nextFrame(walk7, dog_walk8); ai.ai_walk(0.08); }
    function dog_walk8() { th.nextFrame(walk8, dog_walk1); ai.ai_walk(0.08); }

    function dog_run1() { th.nextFrame(run1, dog_run2);
        if (Math.random() < 0.2)
            idleSound.play();
        ai.ai_run(0.16);
    }
    function dog_run2() { th.nextFrame(run2, dog_run3); ai.ai_run(0.32); }
    function dog_run3() { th.nextFrame(run3, dog_run4); ai.ai_run(0.32); }
    function dog_run4() { th.nextFrame(run4, dog_run5); ai.ai_run(0.20); }
    function dog_run5() { th.nextFrame(run5, dog_run6); ai.ai_run(0.64); }
    function dog_run6() { th.nextFrame(run6, dog_run7); ai.ai_run(0.32); }
    function dog_run7() { th.nextFrame(run7, dog_run8); ai.ai_run(0.16); }
    function dog_run8() { th.nextFrame(run8, dog_run9); ai.ai_run(0.32); }
    function dog_run9() { th.nextFrame(run9, dog_run10); ai.ai_run(0.32); }
    function dog_run10() { th.nextFrame(run10, dog_run11); ai.ai_run(0.20); }
    function dog_run11() { th.nextFrame(run11, dog_run12); ai.ai_run(0.64); }
    function dog_run12() { th.nextFrame(run12, dog_run1); ai.ai_run(0.32); }

    function dog_atta1() { th.nextFrame(attack1, dog_atta2); fight.ai_charge(0.10); }
    function dog_atta2() { th.nextFrame(attack2, dog_atta3); fight.ai_charge(0.10); }
    function dog_atta3() { th.nextFrame(attack3, dog_atta4); fight.ai_charge(0.10); }
    function dog_atta4() { th.nextFrame(attack4, dog_atta5); dattack1Sound.play(); dog_bite(); }
    function dog_atta5() { th.nextFrame(attack5, dog_atta6); fight.ai_charge(0.10); }
    function dog_atta6() { th.nextFrame(attack6, dog_atta7); fight.ai_charge(0.10); }
    function dog_atta7() { th.nextFrame(attack7, dog_atta8); fight.ai_charge(0.10); }
    function dog_atta8() { th.nextFrame(attack8, dog_run1); fight.ai_charge(0.10); }

    function dog_leap1() { th.nextFrame(leap1, dog_leap2); fight.ai_face(); }
    function dog_leap2() { th.nextFrame(leap2, dog_leap3);
        fight.ai_face();

        touch = dog_jumpTouch;
        velocity = forward.times(3).plus(Qt.vector3d(0, 2, 0));
        onGround = false;
    }
    function dog_leap3() { th.nextFrame(leap3, dog_leap4); }
    function dog_leap4() { th.nextFrame(leap4, dog_leap5); }
    function dog_leap5() { th.nextFrame(leap5, dog_leap6); }
    function dog_leap6() { th.nextFrame(leap6, dog_leap7); }
    function dog_leap7() { th.nextFrame(leap7, dog_leap8); }
    function dog_leap8() { th.nextFrame(leap8, dog_leap9); }
    function dog_leap9() { th.nextFrame(leap9, dog_leap9); }

    function dog_pain1() { th.nextFrame(pain1, dog_pain2); }
    function dog_pain2() { th.nextFrame(pain2, dog_pain3); }
    function dog_pain3() { th.nextFrame(pain3, dog_pain4); }
    function dog_pain4() { th.nextFrame(pain4, dog_pain5); }
    function dog_pain5() { th.nextFrame(pain5, dog_pain6); }
    function dog_pain6() { th.nextFrame(pain6, dog_run1); }

    function dog_painb1() { th.nextFrame(painb1, dog_painb2); }
    function dog_painb2() { th.nextFrame(painb2, dog_painb3); }
    function dog_painb3() { th.nextFrame(painb3, dog_painb4); ai.ai_pain(0.04); }
    function dog_painb4() { th.nextFrame(painb4, dog_painb5); ai.ai_pain(0.12); }
    function dog_painb5() { th.nextFrame(painb5, dog_painb6); ai.ai_pain(0.12); }
    function dog_painb6() { th.nextFrame(painb6, dog_painb7); ai.ai_pain(0.02); }
    function dog_painb7() { th.nextFrame(painb7, dog_painb8); }
    function dog_painb8() { th.nextFrame(painb8, dog_painb9); ai.ai_pain(0.04); }
    function dog_painb9() { th.nextFrame(painb9, dog_painb10); }
    function dog_painb10() { th.nextFrame(painb10, dog_painb11); ai.ai_pain(0.10); }
    function dog_painb11() { th.nextFrame(painb11, dog_painb12); }
    function dog_painb12() { th.nextFrame(painb12, dog_painb13); }
    function dog_painb13() { th.nextFrame(painb13, dog_painb14); }
    function dog_painb14() { th.nextFrame(painb14, dog_painb15); }
    function dog_painb15() { th.nextFrame(painb15, dog_painb16); }
    function dog_painb16() { th.nextFrame(painb16, dog_run1); }

    function dog_pain() {
        dpain1Sound.play();

        if (Math.random() > 0.5)
            dog_pain1();
        else
            dog_painb1();
    }

    function dog_die1() { th.nextFrame(death1, dog_die2); }
    function dog_die2() { th.nextFrame(death2, dog_die3); }
    function dog_die3() { th.nextFrame(death3, dog_die4); }
    function dog_die4() { th.nextFrame(death4, dog_die5); }
    function dog_die5() { th.nextFrame(death5, dog_die6); }
    function dog_die6() { th.nextFrame(death6, dog_die7); }
    function dog_die7() { th.nextFrame(death7, dog_die8); }
    function dog_die8() { th.nextFrame(death8, dog_die9); }
    function dog_die9() { th.nextFrame(death9, dog_die9); }

    function dog_dieb1() { th.nextFrame(deathb1, dog_die2); }
    function dog_dieb2() { th.nextFrame(deathb2, dog_die3); }
    function dog_dieb3() { th.nextFrame(deathb3, dog_die4); }
    function dog_dieb4() { th.nextFrame(deathb4, dog_die5); }
    function dog_dieb5() { th.nextFrame(deathb5, dog_die6); }
    function dog_dieb6() { th.nextFrame(deathb6, dog_die7); }
    function dog_dieb7() { th.nextFrame(deathb7, dog_die8); }
    function dog_dieb8() { th.nextFrame(deathb8, dog_die9); }
    function dog_dieb9() { th.nextFrame(deathb9, dog_die9); }

    function dog_die() {
        if (health < -35) {
            udeathSound.play();
            throwGib("gib3", health);
            throwGib("gib3", health);
            throwGib("gib3", health);
            throwHead(health);
            return;
        }

        if (takedamage === Defs.damageDead) {
            health = 0;
            return;
        }

        ddeathSound.play();
        walkerDead(true);

        if (Math.random() > 0.5)
            dog_die1();
        else
            dog_dieb1();
    }

    function checkDogMelee() {
        if (enemy_range == Defs.rangeMelee) {
            attack_state = Defs.asMelee;
            return true;
        }
        return false;
    }

    function checkDogJump() {
        if ((position.y + mins.y) > (enemy.position.y + enemy.mins.y + (0.75 * enemy.size.y)))
            return false;
        if ((position.y + maxs.y) < (enemy.position.y + enemy.mins.y + (0.25 * enemy.size.y)))
            return false;

        const dist = enemy.position.minus(position);
        dist.y = 0;

        const d = dist.length();
        if (d < 0.8)
            return false;
        if (d > 1.5)
            return false;

        return true;
    }

    function dogCheckAttack() {
        if (checkDogMelee()) {
            attack_state = Defs.asMelee;
            return true;
        }

        if (checkDogJump()) {
            attack_state = Defs.asMissile;
            return true;
        }

        return false;
    }

    function sightSound() {
        dsightSound.play();
    }
}
