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

    readonly property int death1: 8
    readonly property int death2: 9
    readonly property int death3: 10
    readonly property int death4: 11
    readonly property int death5: 12
    readonly property int death6: 13
    readonly property int death7: 14
    readonly property int death8: 15
    readonly property int death9: 16
    readonly property int death10: 17

    readonly property int deathc1: 18
    readonly property int deathc2: 19
    readonly property int deathc3: 20
    readonly property int deathc4: 21
    readonly property int deathc5: 22
    readonly property int deathc6: 23
    readonly property int deathc7: 24
    readonly property int deathc8: 25
    readonly property int deathc9: 26
    readonly property int deathc10: 27
    readonly property int deathc11: 28

    readonly property int load1: 29
    readonly property int load2: 30
    readonly property int load3: 31
    readonly property int load4: 32
    readonly property int load5: 33
    readonly property int load6: 34
    readonly property int load7: 35
    readonly property int load8: 36
    readonly property int load9: 37
    readonly property int load10: 38
    readonly property int load11: 39

    readonly property int pain1: 40
    readonly property int pain2: 41
    readonly property int pain3: 42
    readonly property int pain4: 43
    readonly property int pain5: 44
    readonly property int pain6: 45

    readonly property int painb1: 46
    readonly property int painb2: 47
    readonly property int painb3: 48
    readonly property int painb4: 49
    readonly property int painb5: 50
    readonly property int painb6: 51
    readonly property int painb7: 52
    readonly property int painb8: 53
    readonly property int painb9: 54
    readonly property int painb10: 55
    readonly property int painb11: 56
    readonly property int painb12: 57
    readonly property int painb13: 58
    readonly property int painb14: 59

    readonly property int painc1: 60
    readonly property int painc2: 61
    readonly property int painc3: 62
    readonly property int painc4: 63
    readonly property int painc5: 64
    readonly property int painc6: 65
    readonly property int painc7: 66
    readonly property int painc8: 67
    readonly property int painc9: 68
    readonly property int painc10: 69
    readonly property int painc11: 70
    readonly property int painc12: 71
    readonly property int painc13: 72

    readonly property int run1: 73
    readonly property int run2: 74
    readonly property int run3: 75
    readonly property int run4: 76
    readonly property int run5: 77
    readonly property int run6: 78
    readonly property int run7: 79
    readonly property int run8: 80

    readonly property int shoot1: 81
    readonly property int shoot2: 82
    readonly property int shoot3: 83
    readonly property int shoot4: 84
    readonly property int shoot5: 85
    readonly property int shoot6: 86
    readonly property int shoot7: 87
    readonly property int shoot8: 88
    readonly property int shoot9: 89

    readonly property int prowl_1: 90
    readonly property int prowl_2: 91
    readonly property int prowl_3: 92
    readonly property int prowl_4: 93
    readonly property int prowl_5: 94
    readonly property int prowl_6: 95
    readonly property int prowl_7: 96
    readonly property int prowl_8: 97
    readonly property int prowl_9: 98
    readonly property int prowl_10: 99
    readonly property int prowl_11: 100
    readonly property int prowl_12: 101
    readonly property int prowl_13: 102
    readonly property int prowl_14: 103
    readonly property int prowl_15: 104
    readonly property int prowl_16: 105
    readonly property int prowl_17: 106
    readonly property int prowl_18: 107
    readonly property int prowl_19: 108
    readonly property int prowl_20: 109
    readonly property int prowl_21: 110
    readonly property int prowl_22: 111
    readonly property int prowl_23: 112
    readonly property int prowl_24: 113

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_army"
    health: 30
    max_health: 30

    th_stand: army_stand1
    th_walk: army_walk1
    th_run: army_run1
    th_missile: army_atk1
    th_pain: army_pain
    th_die: army_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/soldier.mdl"
            skin.source: "qrc:/Assets/progs/skins/soldier.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_guard.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_guard.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/soldier/idle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: pain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/soldier/pain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: pain2Sound
        ent: parent
        source: "qrc:/Assets/sounds/soldier/pain2.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sattck1Sound
        ent: parent
        source: "qrc:/Assets/sounds/soldier/sattck1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: death1Sound
        ent: parent
        source: "qrc:/Assets/sounds/soldier/death1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight1Sound
        ent: parent
        source: "qrc:/Assets/sounds/soldier/sight1.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function army_stand1() { th.nextFrame(stand1, army_stand2); ai.ai_stand(); }
    function army_stand2() { th.nextFrame(stand2, army_stand3); ai.ai_stand(); }
    function army_stand3() { th.nextFrame(stand3, army_stand4); ai.ai_stand(); }
    function army_stand4() { th.nextFrame(stand4, army_stand5); ai.ai_stand(); }
    function army_stand5() { th.nextFrame(stand5, army_stand6); ai.ai_stand(); }
    function army_stand6() { th.nextFrame(stand6, army_stand7); ai.ai_stand(); }
    function army_stand7() { th.nextFrame(stand7, army_stand8); ai.ai_stand(); }
    function army_stand8() { th.nextFrame(stand8, army_stand1); ai.ai_stand(); }

    function army_walk1() { th.nextFrame(prowl_1, army_walk2);
        if (Math.random() < 0.2)
            idleSound.play();
        ai.ai_walk(0.01);
    }
    function army_walk2() { th.nextFrame(prowl_2, army_walk3); ai.ai_walk(0.01); }
    function army_walk3() { th.nextFrame(prowl_3, army_walk4); ai.ai_walk(0.01); }
    function army_walk4() { th.nextFrame(prowl_4, army_walk5); ai.ai_walk(0.01); }
    function army_walk5() { th.nextFrame(prowl_5, army_walk6); ai.ai_walk(0.02); }
    function army_walk6() { th.nextFrame(prowl_6, army_walk7); ai.ai_walk(0.03); }
    function army_walk7() { th.nextFrame(prowl_7, army_walk8); ai.ai_walk(0.04); }
    function army_walk8() { th.nextFrame(prowl_8, army_walk9); ai.ai_walk(0.04); }
    function army_walk9() { th.nextFrame(prowl_9, army_walk10); ai.ai_walk(0.02); }
    function army_walk10() { th.nextFrame(prowl_10, army_walk11); ai.ai_walk(0.02); }
    function army_walk11() { th.nextFrame(prowl_11, army_walk12); ai.ai_walk(0.02); }
    function army_walk12() { th.nextFrame(prowl_12, army_walk13); ai.ai_walk(0.01); }
    function army_walk13() { th.nextFrame(prowl_13, army_walk14); ai.ai_walk(0.0); }
    function army_walk14() { th.nextFrame(prowl_14, army_walk15); ai.ai_walk(0.01); }
    function army_walk15() { th.nextFrame(prowl_15, army_walk16); ai.ai_walk(0.01); }
    function army_walk16() { th.nextFrame(prowl_16, army_walk17); ai.ai_walk(0.01); }
    function army_walk17() { th.nextFrame(prowl_17, army_walk18); ai.ai_walk(0.03); }
    function army_walk18() { th.nextFrame(prowl_18, army_walk19); ai.ai_walk(0.03); }
    function army_walk19() { th.nextFrame(prowl_19, army_walk20); ai.ai_walk(0.03); }
    function army_walk20() { th.nextFrame(prowl_20, army_walk21); ai.ai_walk(0.02); }
    function army_walk21() { th.nextFrame(prowl_21, army_walk22); ai.ai_walk(0.02); }
    function army_walk22() { th.nextFrame(prowl_22, army_walk23); ai.ai_walk(0.01); }
    function army_walk23() { th.nextFrame(prowl_23, army_walk24); ai.ai_walk(0.01); }
    function army_walk24() { th.nextFrame(prowl_24, army_walk1); ai.ai_walk(0.01); }

    function army_run1() { th.nextFrame(run1, army_run2);
        if (Math.random() < 0.2)
            idleSound.play();
        ai.ai_run(0.11);
    }
    function army_run2() { th.nextFrame(run2, army_run3); ai.ai_run(0.15); }
    function army_run3() { th.nextFrame(run3, army_run4); ai.ai_run(0.10); }
    function army_run4() { th.nextFrame(run4, army_run5); ai.ai_run(0.10); }
    function army_run5() { th.nextFrame(run5, army_run6); ai.ai_run(0.08); }
    function army_run6() { th.nextFrame(run6, army_run7); ai.ai_run(0.15); }
    function army_run7() { th.nextFrame(run7, army_run8); ai.ai_run(0.10); }
    function army_run8() { th.nextFrame(run8, army_run1); ai.ai_run(0.08); }

    function army_atk1() { th.nextFrame(shoot1, army_atk2); fight.ai_face(); }
    function army_atk2() { th.nextFrame(shoot2, army_atk3); fight.ai_face(); }
    function army_atk3() { th.nextFrame(shoot3, army_atk4); fight.ai_face(); }
    function army_atk4() { th.nextFrame(shoot4, army_atk5); fight.ai_face(); }
    function army_atk5() { th.nextFrame(shoot5, army_atk6);
        fight.ai_face();
        army_fire();
        effects = effects | Defs.efMuzzleflash;
    }
    function army_atk6() { th.nextFrame(shoot6, army_atk7); fight.ai_face(); }
    function army_atk7() { th.nextFrame(shoot7, army_atk8); fight.ai_face(); checkRefire(army_atk1); }
    function army_atk8() { th.nextFrame(shoot8, army_atk9); fight.ai_face(); }
    function army_atk9() { th.nextFrame(shoot9, army_run1); fight.ai_face(); }

    function army_pain1() { th.nextFrame(pain1, army_pain2); }
    function army_pain2() { th.nextFrame(pain2, army_pain3); }
    function army_pain3() { th.nextFrame(pain3, army_pain4); }
    function army_pain4() { th.nextFrame(pain4, army_pain5); }
    function army_pain5() { th.nextFrame(pain5, army_pain6); }
    function army_pain6() { th.nextFrame(pain6, army_run1); ai.ai_pain(0.01); }

    function army_painb1() { th.nextFrame(painb1, army_painb2); }
    function army_painb2() { th.nextFrame(painb2, army_painb3); ai.ai_painforward(0.13) }
    function army_painb3() { th.nextFrame(painb3, army_painb4); ai.ai_painforward(0.09) }
    function army_painb4() { th.nextFrame(painb4, army_painb5); }
    function army_painb5() { th.nextFrame(painb5, army_painb6); }
    function army_painb6() { th.nextFrame(painb6, army_painb7); }
    function army_painb7() { th.nextFrame(painb7, army_painb8); }
    function army_painb8() { th.nextFrame(painb8, army_painb9); }
    function army_painb9() { th.nextFrame(painb9, army_painb10); }
    function army_painb10() { th.nextFrame(painb10, army_painb11); }
    function army_painb11() { th.nextFrame(painb11, army_painb12); }
    function army_painb12() { th.nextFrame(painb12, army_painb13); ai.ai_pain(0.02); }
    function army_painb13() { th.nextFrame(painb13, army_painb14); }
    function army_painb14() { th.nextFrame(painb14, army_run1); }

    function army_painc1() { th.nextFrame(painc1, army_painc2); }
    function army_painc2() { th.nextFrame(painc2, army_painc3); ai.ai_pain(0.01); }
    function army_painc3() { th.nextFrame(painc3, army_painc4); }
    function army_painc4() { th.nextFrame(painc4, army_painc5); }
    function army_painc5() { th.nextFrame(painc5, army_painc6); ai.ai_painforward(0.01); }
    function army_painc6() { th.nextFrame(painc6, army_painc7); ai.ai_painforward(0.01); }
    function army_painc7() { th.nextFrame(painc7, army_painc8); }
    function army_painc8() { th.nextFrame(painc8, army_painc9); ai.ai_pain(0.01); }
    function army_painc9() { th.nextFrame(painc9, army_painc10); ai.ai_painforward(0.04); }
    function army_painc10() { th.nextFrame(painc10, army_painc11); ai.ai_painforward(0.03); }
    function army_painc11() { th.nextFrame(painc11, army_painc12); ai.ai_painforward(0.06); }
    function army_painc12() { th.nextFrame(painc12, army_painc13); ai.ai_painforward(0.08); }
    function army_painc13() { th.nextFrame(painc13, army_run1); }

    function army_die1() { th.nextFrame(death1, army_die2); }
    function army_die2() { th.nextFrame(death2, army_die3); }
    function army_die3() { th.nextFrame(death3, army_die4);
        walkerDead(true);
        ammo_shells = 5;
        dropBackpack();
    }
    function army_die4() { th.nextFrame(death4, army_die5); }
    function army_die5() { th.nextFrame(death5, army_die6); }
    function army_die6() { th.nextFrame(death6, army_die7); }
    function army_die7() { th.nextFrame(death7, army_die8); }
    function army_die8() { th.nextFrame(death8, army_die9); }
    function army_die9() { th.nextFrame(death9, army_die10); }
    function army_die10() { th.nextFrame(death10, army_die10); }

    function army_cdie1() { th.nextFrame(deathc1, army_cdie2); }
    function army_cdie2() { th.nextFrame(deathc2, army_cdie3); ai.ai_back(0.05); }
    function army_cdie3() { th.nextFrame(deathc3, army_cdie4);
        walkerDead(true);
        ammo_shells = 5;
        dropBackpack();
        ai.ai_back(0.04);
    }
    function army_cdie4() { th.nextFrame(deathc4, army_cdie5); ai.ai_back(0.13); }
    function army_cdie5() { th.nextFrame(deathc5, army_cdie6); ai.ai_back(0.03); }
    function army_cdie6() { th.nextFrame(deathc6, army_cdie7); ai.ai_back(0.04); }
    function army_cdie7() { th.nextFrame(deathc7, army_cdie8); }
    function army_cdie8() { th.nextFrame(deathc8, army_cdie9); }
    function army_cdie9() { th.nextFrame(deathc9, army_cdie10); }
    function army_cdie10() { th.nextFrame(deathc10, army_cdie11); }
    function army_cdie11() { th.nextFrame(deathc11, army_cdie11); }

    function army_pain() {
        if (pain_finished > time)
            return;

        const r = Math.random();

        if (r < 0.2) {
            pain_finished = time + 0.6;
            army_pain1();
            pain1Sound.play();
        } else if (r < 0.6) {
            pain_finished = time + 1.1;
            army_painb1();
            pain2Sound.play();
        } else {
            pain_finished = time + 1.1;
            army_painc1();
            pain2Sound.play();
        }
    }

    function army_fire() {
        fight.ai_face();

        sattck1Sound.play();

        const en = enemy;

        let dir = en.position.minus(en.velocity.times(0.2));
        dir = dir.minus(position).normalized();

        weapons.fireBullets(4, dir, Qt.vector3d(0.1, 0.1, 0));
    }

    function army_die() {
        if (health < -35) {
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

        death1Sound.play();

        if (Math.random() < 0.5)
            army_die1();
        else
            army_cdie1();
    }

    function soldierCheckAttack() {
        const targ = enemy;

        const spot1 = position.plus(view_ofs);
        const spot2 = targ.position.plus(targ.view_ofs);

        const trace = physicsSystem.castRay(spot1, spot2.minus(spot1), Layers.Normal, [body]);

        if (!trace?.body || trace.body.ent !== targ)
            return false;

        if (time < attack_finished)
            return false;

        if (enemy_range === Defs.rangeFar)
            return false;

        let chance = 0;
        if (enemy_range === Defs.rangeMelee)
            chance = 0.9;
        else if (enemy_range === Defs.rangeNear)
            chance = 0.4;
        else if (enemy_range === Defs.rangeMid)
            chance = 0.05;

        if (Math.random() < chance) {
            th_missile();
            attackFinished(1 + Math.random());

            if (Math.random() < 0.3)
                lefty = !lefty;

            return true;
        }

        return false;
    }

    function sightSound() {
        sight1Sound.play();
    }
}
