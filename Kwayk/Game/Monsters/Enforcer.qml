import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import Kwayk.Core

import "../../js/vec.js" as Vec

Monster {
    id: root

    readonly property int stand1: 0
    readonly property int stand2: 1
    readonly property int stand3: 2
    readonly property int stand4: 3
    readonly property int stand5: 4
    readonly property int stand6: 5
    readonly property int stand7: 6

    readonly property int walk1: 7
    readonly property int walk2: 8
    readonly property int walk3: 9
    readonly property int walk4: 10
    readonly property int walk5: 11
    readonly property int walk6: 12
    readonly property int walk7: 13
    readonly property int walk8: 14
    readonly property int walk9: 15
    readonly property int walk10: 16
    readonly property int walk11: 17
    readonly property int walk12: 18
    readonly property int walk13: 19
    readonly property int walk14: 20
    readonly property int walk15: 21
    readonly property int walk16: 22

    readonly property int run1: 23
    readonly property int run2: 24
    readonly property int run3: 25
    readonly property int run4: 26
    readonly property int run5: 27
    readonly property int run6: 28
    readonly property int run7: 29
    readonly property int run8: 30

    readonly property int attack1: 31
    readonly property int attack2: 32
    readonly property int attack3: 33
    readonly property int attack4: 34
    readonly property int attack5: 35
    readonly property int attack6: 36
    readonly property int attack7: 37
    readonly property int attack8: 38
    readonly property int attack9: 39
    readonly property int attack10: 40

    readonly property int death1: 41
    readonly property int death2: 42
    readonly property int death3: 43
    readonly property int death4: 44
    readonly property int death5: 45
    readonly property int death6: 46
    readonly property int death7: 47
    readonly property int death8: 48
    readonly property int death9: 49
    readonly property int death10: 50
    readonly property int death11: 51
    readonly property int death12: 52
    readonly property int death13: 53
    readonly property int death14: 54

    readonly property int fdeath1: 55
    readonly property int fdeath2: 56
    readonly property int fdeath3: 57
    readonly property int fdeath4: 58
    readonly property int fdeath5: 59
    readonly property int fdeath6: 60
    readonly property int fdeath7: 61
    readonly property int fdeath8: 62
    readonly property int fdeath9: 63
    readonly property int fdeath10: 64
    readonly property int fdeath11: 65

    readonly property int paina1: 66
    readonly property int paina2: 67
    readonly property int paina3: 68
    readonly property int paina4: 69

    readonly property int painb1: 70
    readonly property int painb2: 71
    readonly property int painb3: 72
    readonly property int painb4: 73
    readonly property int painb5: 74

    readonly property int painc1: 75
    readonly property int painc2: 76
    readonly property int painc3: 77
    readonly property int painc4: 78
    readonly property int painc5: 79
    readonly property int painc6: 80
    readonly property int painc7: 81
    readonly property int painc8: 82

    readonly property int paind1: 83
    readonly property int paind2: 84
    readonly property int paind3: 85
    readonly property int paind4: 86
    readonly property int paind5: 87
    readonly property int paind6: 88
    readonly property int paind7: 89
    readonly property int paind8: 90
    readonly property int paind9: 91
    readonly property int paind10: 92
    readonly property int paind11: 93
    readonly property int paind12: 94
    readonly property int paind13: 95
    readonly property int paind14: 96
    readonly property int paind15: 97
    readonly property int paind16: 98
    readonly property int paind17: 99
    readonly property int paind18: 100
    readonly property int paind19: 101


    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_enforcer"
    health: 80
    max_health: 80

    th_stand: enf_stand1
    th_walk: enf_walk1
    th_run: enf_run1
    th_missile: enf_atk1
    th_pain: enf_pain
    th_die: enf_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/enforcer.mdl"
            skin.source: "qrc:/Assets/progs/skins/enforcer.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_mega.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_mega.png"
            active: false
        }
    }

    Sound {
        id: enfireSound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/enfire.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: idle1Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/idle1.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: pain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/pain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: pain2Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/pain2.wav"
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
        source: "qrc:/Assets/sounds/enforcer/death1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight1Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/sight1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight2Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/sight2.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight3Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/sight3.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight4Sound
        ent: parent
        source: "qrc:/Assets/sounds/enforcer/sight4.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function enforcer_fire() {
        effects = effects | Defs.efMuzzleflash;
        enfireSound.play();

        const org = position.plus(forward.times(0.3)).plus(right.times(0.085)).plus(Qt.vector3d(0, 0.16, 0));
        const vec = enemy.position.minus(position).normalized();

        weapons.launchLaser(org, vec);
    }

    function enf_stand1() { th.nextFrame(stand1, enf_stand2); ai.ai_stand(); }
    function enf_stand2() { th.nextFrame(stand2, enf_stand3); ai.ai_stand(); }
    function enf_stand3() { th.nextFrame(stand3, enf_stand4); ai.ai_stand(); }
    function enf_stand4() { th.nextFrame(stand4, enf_stand5); ai.ai_stand(); }
    function enf_stand5() { th.nextFrame(stand5, enf_stand6); ai.ai_stand(); }
    function enf_stand6() { th.nextFrame(stand6, enf_stand7); ai.ai_stand(); }
    function enf_stand7() { th.nextFrame(stand7, enf_stand1); ai.ai_stand(); }

    function enf_walk1() { th.nextFrame(walk1, enf_walk2);
        if (Math.random() < 0.2)
            idle1Sound.play();
        ai.ai_walk(0.02);
    }
    function enf_walk2() { th.nextFrame(walk2, enf_walk3); ai.ai_walk(0.04); }
    function enf_walk3() { th.nextFrame(walk3, enf_walk4); ai.ai_walk(0.04); }
    function enf_walk4() { th.nextFrame(walk4, enf_walk5); ai.ai_walk(0.03); }
    function enf_walk5() { th.nextFrame(walk5, enf_walk6); ai.ai_walk(0.01); }
    function enf_walk6() { th.nextFrame(walk6, enf_walk7); ai.ai_walk(0.02); }
    function enf_walk7() { th.nextFrame(walk7, enf_walk8); ai.ai_walk(0.02); }
    function enf_walk8() { th.nextFrame(walk8, enf_walk9); ai.ai_walk(0.01); }
    function enf_walk9() { th.nextFrame(walk9, enf_walk10); ai.ai_walk(0.02); }
    function enf_walk10() { th.nextFrame(walk10, enf_walk11); ai.ai_walk(0.04); }
    function enf_walk11() { th.nextFrame(walk11, enf_walk12); ai.ai_walk(0.04); }
    function enf_walk12() { th.nextFrame(walk12, enf_walk13); ai.ai_walk(0.01); }
    function enf_walk13() { th.nextFrame(walk13, enf_walk14); ai.ai_walk(0.02); }
    function enf_walk14() { th.nextFrame(walk14, enf_walk15); ai.ai_walk(0.03); }
    function enf_walk15() { th.nextFrame(walk15, enf_walk16); ai.ai_walk(0.04); }
    function enf_walk16() { th.nextFrame(walk16, enf_walk1); ai.ai_walk(0.02); }

    function enf_run1() { th.nextFrame(run1, enf_run2);
        if (Math.random() < 0.2)
            idle1Sound.play();
        ai.ai_run(0.18);
    }
    function enf_run2() { th.nextFrame(run2, enf_run3); ai.ai_run(0.14); }
    function enf_run3() { th.nextFrame(run3, enf_run4); ai.ai_run(0.07); }
    function enf_run4() { th.nextFrame(run4, enf_run5); ai.ai_run(0.12); }
    function enf_run5() { th.nextFrame(run5, enf_run6); ai.ai_run(0.14); }
    function enf_run6() { th.nextFrame(run6, enf_run7); ai.ai_run(0.14); }
    function enf_run7() { th.nextFrame(run7, enf_run8); ai.ai_run(0.07); }
    function enf_run8() { th.nextFrame(run8, enf_run1); ai.ai_run(0.11); }

    function enf_atk1() { th.nextFrame(attack1, enf_atk2); fight.ai_face(); }
    function enf_atk2() { th.nextFrame(attack2, enf_atk3); fight.ai_face(); }
    function enf_atk3() { th.nextFrame(attack3, enf_atk4); fight.ai_face(); }
    function enf_atk4() { th.nextFrame(attack4, enf_atk5); fight.ai_face(); }
    function enf_atk5() { th.nextFrame(attack5, enf_atk6); fight.ai_face(); }
    function enf_atk6() { th.nextFrame(attack6, enf_atk7); enforcer_fire(); }
    function enf_atk7() { th.nextFrame(attack7, enf_atk8); fight.ai_face(); }
    function enf_atk8() { th.nextFrame(attack8, enf_atk9); fight.ai_face(); }
    function enf_atk9() { th.nextFrame(attack5, enf_atk10); fight.ai_face(); }
    function enf_atk10() { th.nextFrame(attack6, enf_atk11); enforcer_fire(); }
    function enf_atk11() { th.nextFrame(attack7, enf_atk12); fight.ai_face(); }
    function enf_atk12() { th.nextFrame(attack8, enf_atk13); fight.ai_face(); }
    function enf_atk13() { th.nextFrame(attack9, enf_atk14); fight.ai_face(); }
    function enf_atk14() { th.nextFrame(attack10, enf_run1); fight.ai_face(); checkRefire(enf_atk1); }

    function enf_paina1() { th.nextFrame(paina1, enf_paina2); }
    function enf_paina2() { th.nextFrame(paina2, enf_paina3); }
    function enf_paina3() { th.nextFrame(paina3, enf_paina4); }
    function enf_paina4() { th.nextFrame(paina4, enf_run1); }

    function enf_painb1() { th.nextFrame(painb1, enf_painb2); }
    function enf_painb2() { th.nextFrame(painb2, enf_painb3); }
    function enf_painb3() { th.nextFrame(painb3, enf_painb4); }
    function enf_painb4() { th.nextFrame(painb4, enf_painb5); }
    function enf_painb5() { th.nextFrame(painb5, enf_run1); }

    function enf_painc1() { th.nextFrame(painc1, enf_painc2); }
    function enf_painc2() { th.nextFrame(painc2, enf_painc3); }
    function enf_painc3() { th.nextFrame(painc3, enf_painc4); }
    function enf_painc4() { th.nextFrame(painc4, enf_painc5); }
    function enf_painc5() { th.nextFrame(painc5, enf_painc6); }
    function enf_painc6() { th.nextFrame(painc6, enf_painc7); }
    function enf_painc7() { th.nextFrame(painc7, enf_painc8); }
    function enf_painc8() { th.nextFrame(painc8, enf_run1); }

    function enf_paind1() { th.nextFrame(paind1, enf_paind2); }
    function enf_paind2() { th.nextFrame(paind2, enf_paind3); }
    function enf_paind3() { th.nextFrame(paind3, enf_paind4); }
    function enf_paind4() { th.nextFrame(paind4, enf_paind5); ai.ai_painforward(0.02); }
    function enf_paind5() { th.nextFrame(paind5, enf_paind6); ai.ai_painforward(0.01); }
    function enf_paind6() { th.nextFrame(paind6, enf_paind7); }
    function enf_paind7() { th.nextFrame(paind7, enf_paind8); }
    function enf_paind8() { th.nextFrame(paind8, enf_paind9); }
    function enf_paind9() { th.nextFrame(paind9, enf_paind10); }
    function enf_paind10() { th.nextFrame(paind10, enf_paind11); }
    function enf_paind11() { th.nextFrame(paind11, enf_paind12); ai.ai_painforward(0.01); }
    function enf_paind12() { th.nextFrame(paind12, enf_paind13); ai.ai_painforward(0.01); }
    function enf_paind13() { th.nextFrame(paind13, enf_paind14); ai.ai_painforward(0.01); }
    function enf_paind14() { th.nextFrame(paind14, enf_paind15); }
    function enf_paind15() { th.nextFrame(paind15, enf_paind16); }
    function enf_paind16() { th.nextFrame(paind16, enf_paind17); ai.ai_pain(0.01); }
    function enf_paind17() { th.nextFrame(paind17, enf_paind18); ai.ai_pain(0.01); }
    function enf_paind18() { th.nextFrame(paind18, enf_paind19); }
    function enf_paind19() { th.nextFrame(paind19, enf_run1); }

    function enf_pain(attacker, damage) {
        if (pain_finished > time)
            return;

        const r = Math.random();

        if (r < 0.5)
            pain1Sound.play();
        else
            pain2Sound.play();

        if (r < 0.2) {
            pain_finished = time + 1;
            enf_paina1();
        } else if (r < 0.4) {
            pain_finished = time + 1;
            enf_painb1();
        } else if (r < 0.7){
            pain_finished = time + 1;
            enf_painc1();
        } else {
            pain_finished = time + 2;
            enf_paind1();
        }
    }

    function enf_die1() { th.nextFrame(death1, enf_die2); }
    function enf_die2() { th.nextFrame(death2, enf_die3); }
    function enf_die3() { th.nextFrame(death3, enf_die4);
        walkerDead(true);
        ammo_cells = 5;
        dropBackpack();
    }
    function enf_die4() { th.nextFrame(death4, enf_die5); ai.ai_forward(0.14); }
    function enf_die5() { th.nextFrame(death5, enf_die6); ai.ai_forward(0.02); }
    function enf_die6() { th.nextFrame(death6, enf_die7); }
    function enf_die7() { th.nextFrame(death7, enf_die8); }
    function enf_die8() { th.nextFrame(death8, enf_die9); }
    function enf_die9() { th.nextFrame(death9, enf_die10); ai.ai_forward(0.03); }
    function enf_die10() { th.nextFrame(death10, enf_die11); ai.ai_forward(0.05); }
    function enf_die11() { th.nextFrame(death11, enf_die12); ai.ai_forward(0.05); }
    function enf_die12() { th.nextFrame(death12, enf_die13); ai.ai_forward(0.05); }
    function enf_die13() { th.nextFrame(death13, enf_die14); }
    function enf_die14() { th.nextFrame(death14, enf_die14); }

    function enf_fdie1() { th.nextFrame(fdeath1, enf_fdie2); }
    function enf_fdie2() { th.nextFrame(fdeath2, enf_fdie3); }
    function enf_fdie3() { th.nextFrame(fdeath3, enf_fdie4);
        walkerDead(true);
        ammo_cells = 5;
        dropBackpack();
    }
    function enf_fdie4() { th.nextFrame(fdeath4, enf_fdie5); }
    function enf_fdie5() { th.nextFrame(fdeath5, enf_fdie6); }
    function enf_fdie6() { th.nextFrame(fdeath6, enf_fdie7); }
    function enf_fdie7() { th.nextFrame(fdeath7, enf_fdie8); }
    function enf_fdie8() { th.nextFrame(fdeath8, enf_fdie9); }
    function enf_fdie9() { th.nextFrame(fdeath9, enf_fdie10); }
    function enf_fdie10() { th.nextFrame(fdeath10, enf_fdie11); }
    function enf_fdie11() { th.nextFrame(fdeath11, enf_fdie11); }

    function enf_die() {
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

        if (Math.random() > 0.5)
            enf_die1();
        else
            enf_fdie1();
    }

    function sightSound() {
        const r = Math.round(Math.random() * 3);
        switch (r) {
        case 1:
            sight1Sound.play();
            break;
        case 2:
            sight2Sound.play();
            break;
        case 0:
            sight3Sound.play();
            break;
        default:
            sight4Sound.play();
            break;
        }
    }
}
