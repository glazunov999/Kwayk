import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import Kwayk.Core

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

    readonly property int runb1: 9
    readonly property int runb2: 10
    readonly property int runb3: 11
    readonly property int runb4: 12
    readonly property int runb5: 13
    readonly property int runb6: 14
    readonly property int runb7: 15
    readonly property int runb8: 16

    readonly property int runattack1: 17
    readonly property int runattack2: 18
    readonly property int runattack3: 19
    readonly property int runattack4: 20
    readonly property int runattack5: 21
    readonly property int runattack6: 22
    readonly property int runattack7: 23
    readonly property int runattack8: 24
    readonly property int runattack9: 25
    readonly property int runattack10: 26
    readonly property int runattack11: 27

    readonly property int pain1: 28
    readonly property int pain2: 29
    readonly property int pain3: 30

    readonly property int painb1: 31
    readonly property int painb2: 32
    readonly property int painb3: 33
    readonly property int painb4: 34
    readonly property int painb5: 35
    readonly property int painb6: 36
    readonly property int painb7: 37
    readonly property int painb8: 38
    readonly property int painb9: 39
    readonly property int painb10: 40
    readonly property int painb11: 41

    readonly property int attackb1: 42
    readonly property int attackb2: 44
    readonly property int attackb3: 45
    readonly property int attackb4: 46
    readonly property int attackb5: 47
    readonly property int attackb6: 48
    readonly property int attackb7: 49
    readonly property int attackb8: 50
    readonly property int attackb9: 51
    readonly property int attackb10: 52

    readonly property int walk1: 53
    readonly property int walk2: 54
    readonly property int walk3: 55
    readonly property int walk4: 56
    readonly property int walk5: 57
    readonly property int walk6: 58
    readonly property int walk7: 59
    readonly property int walk8: 60
    readonly property int walk9: 61
    readonly property int walk10: 62
    readonly property int walk11: 63
    readonly property int walk12: 64
    readonly property int walk13: 65
    readonly property int walk14: 66

    readonly property int kneel1: 67
    readonly property int kneel2: 68
    readonly property int kneel3: 69
    readonly property int kneel4: 70
    readonly property int kneel5: 71

    readonly property int standing2: 72
    readonly property int standing3: 73
    readonly property int standing4: 74
    readonly property int standing5: 75

    readonly property int death1: 76
    readonly property int death2: 77
    readonly property int death3: 78
    readonly property int death4: 79
    readonly property int death5: 80
    readonly property int death6: 81
    readonly property int death7: 82
    readonly property int death8: 83
    readonly property int death9: 84
    readonly property int death10: 85

    readonly property int deathb1: 86
    readonly property int deathb2: 87
    readonly property int deathb3: 88
    readonly property int deathb4: 89
    readonly property int deathb5: 90
    readonly property int deathb6: 91
    readonly property int deathb7: 92
    readonly property int deathb8: 93
    readonly property int deathb9: 94
    readonly property int deathb10: 95
    readonly property int deathb11: 96

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_knight"
    health: 75
    max_health: 75

    th_stand: knight_stand1
    th_walk: knight_walk1
    th_run: knight_run1
    th_melee: knight_atk1
    th_pain: knight_pain
    th_die: knight_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/knight.mdl"
            skin.source: "qrc:/Assets/progs/skins/knight.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_knight.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_knight.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/knight/idle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: kdeathSound
        ent: parent
        source: "qrc:/Assets/sounds/knight/kdeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: khurtSound
        ent: parent
        source: "qrc:/Assets/sounds/knight/khurt.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: ksightSound
        ent: parent
        source: "qrc:/Assets/sounds/knight/ksight.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sword1Sound
        ent: parent
        source: "qrc:/Assets/sounds/knight/sword1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sword2Sound
        ent: parent
        source: "qrc:/Assets/sounds/knight/sword2.wav"
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
    }

    function knight_stand1() { th.nextFrame(stand1, knight_stand2); ai.ai_stand(); }
    function knight_stand2() { th.nextFrame(stand2, knight_stand3); ai.ai_stand(); }
    function knight_stand3() { th.nextFrame(stand3, knight_stand4); ai.ai_stand(); }
    function knight_stand4() { th.nextFrame(stand4, knight_stand5); ai.ai_stand(); }
    function knight_stand5() { th.nextFrame(stand5, knight_stand6); ai.ai_stand(); }
    function knight_stand6() { th.nextFrame(stand6, knight_stand7); ai.ai_stand(); }
    function knight_stand7() { th.nextFrame(stand7, knight_stand8); ai.ai_stand(); }
    function knight_stand8() { th.nextFrame(stand8, knight_stand9); ai.ai_stand(); }
    function knight_stand9() { th.nextFrame(stand9, knight_stand1); ai.ai_stand(); }

    function knight_walk1() { th.nextFrame(walk1, knight_walk2);
        if (Math.random() < 0.2) {
            idleSound.play();
        }
        ai.ai_walk(0.03);
    }
    function knight_walk2() { th.nextFrame(walk2, knight_walk3); ai.ai_walk(0.02); }
    function knight_walk3() { th.nextFrame(walk3, knight_walk4); ai.ai_walk(0.03); }
    function knight_walk4() { th.nextFrame(walk4, knight_walk5); ai.ai_walk(0.04); }
    function knight_walk5() { th.nextFrame(walk5, knight_walk6); ai.ai_walk(0.03); }
    function knight_walk6() { th.nextFrame(walk6, knight_walk7); ai.ai_walk(0.03); }
    function knight_walk7() { th.nextFrame(walk7, knight_walk8); ai.ai_walk(0.03); }
    function knight_walk8() { th.nextFrame(walk8, knight_walk9); ai.ai_walk(0.04); }
    function knight_walk9() { th.nextFrame(walk9, knight_walk10); ai.ai_walk(0.03); }
    function knight_walk10() { th.nextFrame(walk10, knight_walk11); ai.ai_walk(0.03); }
    function knight_walk11() { th.nextFrame(walk11, knight_walk12); ai.ai_walk(0.02); }
    function knight_walk12() { th.nextFrame(walk12, knight_walk13); ai.ai_walk(0.03); }
    function knight_walk13() { th.nextFrame(walk13, knight_walk14); ai.ai_walk(0.04); }
    function knight_walk14() { th.nextFrame(walk14, knight_walk1); ai.ai_walk(0.03); }

    function knight_run1() { th.nextFrame(runb1, knight_run2);
        if (Math.random() < 0.2) {
            idleSound.play();
        }
        ai.ai_run(0.16);
    }
    function knight_run2() { th.nextFrame(runb2, knight_run3); ai.ai_run(0.20); }
    function knight_run3() { th.nextFrame(runb3, knight_run4); ai.ai_run(0.13); }
    function knight_run4() { th.nextFrame(runb4, knight_run5); ai.ai_run(0.07); }
    function knight_run5() { th.nextFrame(runb5, knight_run6); ai.ai_run(0.16); }
    function knight_run6() { th.nextFrame(runb6, knight_run7); ai.ai_run(0.20); }
    function knight_run7() { th.nextFrame(runb7, knight_run8); ai.ai_run(0.14); }
    function knight_run8() { th.nextFrame(runb8, knight_run1); ai.ai_run(0.06); }

    function knight_runatk1() { th.nextFrame(runattack1, knight_runatk2);
        if (Math.random() > 0.5) {
            sword2Sound.play();
        } else {
            sword1Sound.play();
        }
        fight.ai_charge(0.20);
    }
    function knight_runatk2() { th.nextFrame(runattack2, knight_runatk3); fight.ai_charge_side(); }
    function knight_runatk3() { th.nextFrame(runattack3, knight_runatk4); fight.ai_charge_side(); }
    function knight_runatk4() { th.nextFrame(runattack4, knight_runatk5); fight.ai_charge_side(); }
    function knight_runatk5() { th.nextFrame(runattack5, knight_runatk6); fight.ai_melee_side(); }
    function knight_runatk6() { th.nextFrame(runattack6, knight_runatk7); fight.ai_melee_side(); }
    function knight_runatk7() { th.nextFrame(runattack7, knight_runatk8); fight.ai_melee_side(); }
    function knight_runatk8() { th.nextFrame(runattack8, knight_runatk9); fight.ai_melee_side(); }
    function knight_runatk9() { th.nextFrame(runattack9, knight_runatk10); fight.ai_melee_side(); }
    function knight_runatk10() { th.nextFrame(runattack10, knight_runatk11); fight.ai_charge_side(); }
    function knight_runatk11() { th.nextFrame(runattack11, knight_run1); fight.ai_charge(0.10); }

    function knight_atk1() { th.nextFrame(attackb1, knight_atk2); sword1Sound.play(); fight.ai_charge(0); }
    function knight_atk2() { th.nextFrame(attackb2, knight_atk3); fight.ai_charge(0.07); }
    function knight_atk3() { th.nextFrame(attackb3, knight_atk4); fight.ai_charge(0.04); }
    function knight_atk4() { th.nextFrame(attackb4, knight_atk5); fight.ai_charge(0); }
    function knight_atk5() { th.nextFrame(attackb5, knight_atk6); fight.ai_charge(0.03); }
    function knight_atk6() { th.nextFrame(attackb6, knight_atk7); fight.ai_charge(0.04); fight.ai_melee(); }
    function knight_atk7() { th.nextFrame(attackb7, knight_atk8); fight.ai_charge(0.01); fight.ai_melee(); }
    function knight_atk8() { th.nextFrame(attackb8, knight_atk9); fight.ai_charge(0.03); fight.ai_melee(); }
    function knight_atk9() { th.nextFrame(attackb9, knight_atk10); fight.ai_charge(0.01); }
    function knight_atk10() { th.nextFrame(attackb10, knight_run1); fight.ai_charge(0.05); }

    function knight_attack() {
        let len = enemy.position.plus(enemy.view_ofs).minus(position.plus(view_ofs));
        len = len.length();

        if (len < 0.8)
            knight_atk1();
        else
            knight_runatk1();
    }

    function knight_pain1() { th.nextFrame(pain1, knight_pain2); }
    function knight_pain2() { th.nextFrame(pain2, knight_pain3); }
    function knight_pain3() { th.nextFrame(pain3, knight_run1); }

    function knight_painb1() { th.nextFrame(painb1, knight_painb2); ai.ai_painforward(0); }
    function knight_painb2() { th.nextFrame(painb2, knight_painb3); ai.ai_painforward(0.03); }
    function knight_painb3() { th.nextFrame(painb3, knight_painb4); }
    function knight_painb4() { th.nextFrame(painb4, knight_painb5); }
    function knight_painb5() { th.nextFrame(painb5, knight_painb6); ai.ai_painforward(0.02); }
    function knight_painb6() { th.nextFrame(painb6, knight_painb7); ai.ai_painforward(0.04); }
    function knight_painb7() { th.nextFrame(painb7, knight_painb8); ai.ai_painforward(0.02); }
    function knight_painb8() { th.nextFrame(painb8, knight_painb9); ai.ai_painforward(0.05); }
    function knight_painb9() { th.nextFrame(painb9, knight_painb10); ai.ai_painforward(0.05); }
    function knight_painb10() { th.nextFrame(painb10, knight_painb11); ai.ai_painforward(0); }
    function knight_painb11() { th.nextFrame(painb11, knight_run1); }

    function knight_pain(attacker, damage) {
        if (pain_finished > time)
            return;

        khurtSound.play();

        const r = Math.random();

        if (r < 0.85)
            knight_pain1();
        else
            knight_painb1();

        pain_finished = time + 1;
    }

    function knight_bow1() { th.nextFrame(kneel1, knight_bow2); ai.ai_turn(); }
    function knight_bow2() { th.nextFrame(kneel2, knight_bow3); ai.ai_turn(); }
    function knight_bow3() { th.nextFrame(kneel3, knight_bow4); ai.ai_turn(); }
    function knight_bow4() { th.nextFrame(kneel4, knight_bow5); ai.ai_turn(); }
    function knight_bow5() { th.nextFrame(kneel5, knight_bow6); ai.ai_turn(); }
    function knight_bow6() { th.nextFrame(kneel4, knight_bow7); ai.ai_turn(); }
    function knight_bow7() { th.nextFrame(kneel3, knight_bow8); ai.ai_turn(); }
    function knight_bow8() { th.nextFrame(kneel2, knight_bow9); ai.ai_turn(); }
    function knight_bow9() { th.nextFrame(kneel1, knight_bow10); ai.ai_turn(); }
    function knight_bow10() { th.nextFrame(walk1, knight_walk1); ai.ai_turn(); }

    function knight_die1() { th.nextFrame(death1, knight_die2); }
    function knight_die2() { th.nextFrame(death2, knight_die3); }
    function knight_die3() { th.nextFrame(death3, knight_die4); walkerDead(true); }
    function knight_die4() { th.nextFrame(death4, knight_die5); }
    function knight_die5() { th.nextFrame(death5, knight_die6); }
    function knight_die6() { th.nextFrame(death6, knight_die7); }
    function knight_die7() { th.nextFrame(death7, knight_die8); }
    function knight_die8() { th.nextFrame(death8, knight_die9); }
    function knight_die9() { th.nextFrame(death9, knight_die10); }
    function knight_die10() { th.nextFrame(death10, knight_die10); }

    function knight_dieb1() { th.nextFrame(deathb1, knight_dieb2); }
    function knight_dieb2() { th.nextFrame(deathb2, knight_dieb3); }
    function knight_dieb3() { th.nextFrame(deathb3, knight_dieb4); walkerDead(true); }
    function knight_dieb4() { th.nextFrame(deathb4, knight_dieb5); }
    function knight_dieb5() { th.nextFrame(deathb5, knight_dieb6); }
    function knight_dieb6() { th.nextFrame(deathb6, knight_dieb7); }
    function knight_dieb7() { th.nextFrame(deathb7, knight_dieb8); }
    function knight_dieb8() { th.nextFrame(deathb8, knight_dieb9); }
    function knight_dieb9() { th.nextFrame(deathb9, knight_dieb10); }
    function knight_dieb10() { th.nextFrame(deathb10, knight_dieb11); }
    function knight_dieb11() { th.nextFrame(deathb11, knight_dieb11); }

    function knight_die() {
        if (health < -40) {
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

        kdeathSound.play();

        if (Math.random() < 0.5)
            knight_die1();
        else
            knight_dieb1();
    }

    function sightSound() {
        ksightSound.play();
    }
}
