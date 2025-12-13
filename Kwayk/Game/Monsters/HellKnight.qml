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
    readonly property int stand8: 7
    readonly property int stand9: 8

    readonly property int walk1: 9
    readonly property int walk2: 10
    readonly property int walk3: 11
    readonly property int walk4: 12
    readonly property int walk5: 13
    readonly property int walk6: 14
    readonly property int walk7: 15
    readonly property int walk8: 16
    readonly property int walk9: 17
    readonly property int walk10: 18
    readonly property int walk11: 19
    readonly property int walk12: 20
    readonly property int walk13: 21
    readonly property int walk14: 22
    readonly property int walk15: 23
    readonly property int walk16: 24
    readonly property int walk17: 25
    readonly property int walk18: 26
    readonly property int walk19: 27
    readonly property int walk20: 28

    readonly property int run1: 29
    readonly property int run2: 30
    readonly property int run3: 31
    readonly property int run4: 32
    readonly property int run5: 33
    readonly property int run6: 34
    readonly property int run7: 35
    readonly property int run8: 36

    readonly property int pain1: 37
    readonly property int pain2: 38
    readonly property int pain3: 39
    readonly property int pain4: 40
    readonly property int pain5: 41

    readonly property int death1: 42
    readonly property int death2: 43
    readonly property int death3: 44
    readonly property int death4: 45
    readonly property int death5: 46
    readonly property int death6: 47
    readonly property int death7: 48
    readonly property int death8: 49
    readonly property int death9: 50
    readonly property int death10: 51
    readonly property int death11: 52
    readonly property int death12: 53

    readonly property int deathb1: 54
    readonly property int deathb2: 55
    readonly property int deathb3: 56
    readonly property int deathb4: 57
    readonly property int deathb5: 58
    readonly property int deathb6: 59
    readonly property int deathb7: 60
    readonly property int deathb8: 61
    readonly property int deathb9: 62

    readonly property int char_a1: 63
    readonly property int char_a2: 64
    readonly property int char_a3: 65
    readonly property int char_a4: 66
    readonly property int char_a5: 67
    readonly property int char_a6: 68
    readonly property int char_a7: 69
    readonly property int char_a8: 70
    readonly property int char_a9: 71
    readonly property int char_a10: 72
    readonly property int char_a11: 73
    readonly property int char_a12: 74
    readonly property int char_a13: 75
    readonly property int char_a14: 76
    readonly property int char_a15: 77
    readonly property int char_a16: 78

    readonly property int magica1: 79
    readonly property int magica2: 80
    readonly property int magica3: 81
    readonly property int magica4: 82
    readonly property int magica5: 83
    readonly property int magica6: 84
    readonly property int magica7: 85
    readonly property int magica8: 86
    readonly property int magica9: 87
    readonly property int magica10: 88
    readonly property int magica11: 89
    readonly property int magica12: 90
    readonly property int magica13: 91
    readonly property int magica14: 92

    readonly property int magicb1: 93
    readonly property int magicb2: 94
    readonly property int magicb3: 95
    readonly property int magicb4: 96
    readonly property int magicb5: 97
    readonly property int magicb6: 98
    readonly property int magicb7: 99
    readonly property int magicb8: 100
    readonly property int magicb9: 101
    readonly property int magicb10: 102
    readonly property int magicb11: 103
    readonly property int magicb12: 104
    readonly property int magicb13: 105

    readonly property int char_b1: 106
    readonly property int char_b2: 107
    readonly property int char_b3: 108
    readonly property int char_b4: 109
    readonly property int char_b5: 110
    readonly property int char_b6: 111

    readonly property int slice1: 112
    readonly property int slice2: 113
    readonly property int slice3: 114
    readonly property int slice4: 115
    readonly property int slice5: 116
    readonly property int slice6: 117
    readonly property int slice7: 118
    readonly property int slice8: 119
    readonly property int slice9: 120
    readonly property int slice10: 121

    readonly property int smash1: 122
    readonly property int smash2: 123
    readonly property int smash3: 124
    readonly property int smash4: 125
    readonly property int smash5: 126
    readonly property int smash6: 127
    readonly property int smash7: 128
    readonly property int smash8: 129
    readonly property int smash9: 130
    readonly property int smash10: 131
    readonly property int smash11: 132

    readonly property int w_attack1: 133
    readonly property int w_attack2: 134
    readonly property int w_attack3: 135
    readonly property int w_attack4: 136
    readonly property int w_attack5: 137
    readonly property int w_attack6: 138
    readonly property int w_attack7: 139
    readonly property int w_attack8: 140
    readonly property int w_attack9: 141
    readonly property int w_attack10: 142
    readonly property int w_attack11: 143
    readonly property int w_attack12: 144
    readonly property int w_attack13: 145
    readonly property int w_attack14: 146
    readonly property int w_attack15: 147
    readonly property int w_attack16: 148
    readonly property int w_attack17: 149
    readonly property int w_attack18: 150
    readonly property int w_attack19: 151
    readonly property int w_attack20: 152
    readonly property int w_attack21: 153
    readonly property int w_attack22: 154

    readonly property int magicc1: 155
    readonly property int magicc2: 156
    readonly property int magicc3: 157
    readonly property int magicc4: 158
    readonly property int magicc5: 159
    readonly property int magicc6: 160
    readonly property int magicc7: 161
    readonly property int magicc8: 162
    readonly property int magicc9: 163
    readonly property int magicc10: 164
    readonly property int magicc11: 165

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_hell_knight"
    health: 250
    max_health: 250

    th_stand: hknight_stand1
    th_walk: hknight_walk1
    th_run: hknight_run1
    th_melee: hknight_melee
    th_missile: hknight_magicc1
    th_pain: hknight_pain
    th_die: hknight_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/hknight.mdl"
            skin.source: "qrc:/Assets/progs/skins/hknight.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_hellkn.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_hellkn.png"
            active: false
        }
    }

    Sound {
        id: attack1Sound
        ent: parent
        source: "qrc:/Assets/sounds/hknight/attack1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: death1Sound
        ent: parent
        source: "qrc:/Assets/sounds/hknight/death1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: pain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/hknight/pain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight1Sound
        ent: parent
        source: "qrc:/Assets/sounds/hknight/sight1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: slash1Sound
        ent: parent
        source: "qrc:/Assets/sounds/hknight/slash1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/hknight/idle.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
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

    Component.onCompleted: {
        walkmonster_start();
    }

    function hknight_shot(offset) {
        const offang = Vec.vectoangles(enemy.position.minus(position));
        offang.y += offset * 6;

        const v = Vec.makevectors(offang);

        const org = position.plus(root.mins).plus(root.size.times(0.5)).plus(v.forward.times(0.2));

        const vec = v.forward.normalized();
        vec.y = -vec.y + (Math.random() - 0.5) * 0.001;

        weapons.launch_spike(org, vec, vec.times(3), 3);
        attack1Sound.play();
    }

    function checkForCharge() {
        if (!enemy_visible)
            return;

        if (time < attack_finished)
            return;

        if (Math.abs(position.y - enemy.position.y) > 0.2)
            return; // too much height change

        if (position.minus(enemy.position).length() < 0.8)
            return; // use regular attack

        attackFinished(2);
        hknight_char_a1();
    }

    function checkContinueCharge() {
        if (time > attack_finished) {
            attackFinished(3);
            hknight_run1();
            return; // done charging
        }

        if (Math.random() > 0.5) {
            sword2Sound.play();
        } else {
            sword1Sound.play();
        }
    }

    function hknight_stand1() { th.nextFrame(stand1, hknight_stand2); ai.ai_stand(); }
    function hknight_stand2() { th.nextFrame(stand2, hknight_stand3); ai.ai_stand(); }
    function hknight_stand3() { th.nextFrame(stand3, hknight_stand4); ai.ai_stand(); }
    function hknight_stand4() { th.nextFrame(stand4, hknight_stand5); ai.ai_stand(); }
    function hknight_stand5() { th.nextFrame(stand5, hknight_stand6); ai.ai_stand(); }
    function hknight_stand6() { th.nextFrame(stand6, hknight_stand7); ai.ai_stand(); }
    function hknight_stand7() { th.nextFrame(stand7, hknight_stand8); ai.ai_stand(); }
    function hknight_stand8() { th.nextFrame(stand8, hknight_stand9); ai.ai_stand(); }
    function hknight_stand9() { th.nextFrame(stand9, hknight_stand1); ai.ai_stand(); }

    function hknight_walk1() { th.nextFrame(walk1, hknight_walk2); hk_idle_sound(); ai.ai_walk(0.02); }
    function hknight_walk2() { th.nextFrame(walk2, hknight_walk3); ai.ai_walk(0.05); }
    function hknight_walk3() { th.nextFrame(walk3, hknight_walk4); ai.ai_walk(0.05); }
    function hknight_walk4() { th.nextFrame(walk4, hknight_walk5); ai.ai_walk(0.04); }
    function hknight_walk5() { th.nextFrame(walk5, hknight_walk6); ai.ai_walk(0.04); }
    function hknight_walk6() { th.nextFrame(walk6, hknight_walk7); ai.ai_walk(0.02); }
    function hknight_walk7() { th.nextFrame(walk7, hknight_walk8); ai.ai_walk(0.02); }
    function hknight_walk8() { th.nextFrame(walk8, hknight_walk9); ai.ai_walk(0.03); }
    function hknight_walk9() { th.nextFrame(walk9, hknight_walk10); ai.ai_walk(0.03); }
    function hknight_walk10() { th.nextFrame(walk10, hknight_walk11); ai.ai_walk(0.04); }
    function hknight_walk11() { th.nextFrame(walk11, hknight_walk12); ai.ai_walk(0.03); }
    function hknight_walk12() { th.nextFrame(walk12, hknight_walk13); ai.ai_walk(0.04); }
    function hknight_walk13() { th.nextFrame(walk13, hknight_walk14); ai.ai_walk(0.06); }
    function hknight_walk14() { th.nextFrame(walk14, hknight_walk15); ai.ai_walk(0.02); }
    function hknight_walk15() { th.nextFrame(walk15, hknight_walk16); ai.ai_walk(0.02); }
    function hknight_walk16() { th.nextFrame(walk16, hknight_walk17); ai.ai_walk(0.04); }
    function hknight_walk17() { th.nextFrame(walk17, hknight_walk18); ai.ai_walk(0.03); }
    function hknight_walk18() { th.nextFrame(walk18, hknight_walk19); ai.ai_walk(0.03); }
    function hknight_walk19() { th.nextFrame(walk19, hknight_walk20); ai.ai_walk(0.03); }
    function hknight_walk20() { th.nextFrame(walk20, hknight_walk1); ai.ai_walk(0.02); }

    function hknight_run1() { th.nextFrame(run1, hknight_run2);
        hk_idle_sound();
        ai.ai_run(0.2);
        checkForCharge();
    }
    function hknight_run2() { th.nextFrame(run2, hknight_run3); ai.ai_run(0.25); }
    function hknight_run3() { th.nextFrame(run3, hknight_run4); ai.ai_run(0.18); }
    function hknight_run4() { th.nextFrame(run4, hknight_run5); ai.ai_run(0.16); }
    function hknight_run5() { th.nextFrame(run5, hknight_run6); ai.ai_run(0.14); }
    function hknight_run6() { th.nextFrame(run6, hknight_run7); ai.ai_run(0.25); }
    function hknight_run7() { th.nextFrame(run7, hknight_run8); ai.ai_run(0.21); }
    function hknight_run8() { th.nextFrame(run8, hknight_run1); ai.ai_run(0.13); }

    function hknight_pain1() { th.nextFrame(pain1, hknight_pain2); pain1Sound.play(); }
    function hknight_pain2() { th.nextFrame(pain2, hknight_pain3); }
    function hknight_pain3() { th.nextFrame(pain3, hknight_pain4); }
    function hknight_pain4() { th.nextFrame(pain4, hknight_pain5); }
    function hknight_pain5() { th.nextFrame(pain5, hknight_run1); }

    function hknight_die1() { th.nextFrame(death1, hknight_die2); ai.ai_forward(0.10); }
    function hknight_die2() { th.nextFrame(death2, hknight_die3); ai.ai_forward(0.08); }
    function hknight_die3() { th.nextFrame(death3, hknight_die4); walkerDead(true); ai.ai_forward(0.07); }
    function hknight_die4() { th.nextFrame(death4, hknight_die5); }
    function hknight_die5() { th.nextFrame(death5, hknight_die6); }
    function hknight_die6() { th.nextFrame(death6, hknight_die7); }
    function hknight_die7() { th.nextFrame(death7, hknight_die8); }
    function hknight_die8() { th.nextFrame(death8, hknight_die9); ai.ai_forward(0.10); }
    function hknight_die9() { th.nextFrame(death9, hknight_die10); ai.ai_forward(0.11); }
    function hknight_die10() { th.nextFrame(death10, hknight_die11); }
    function hknight_die11() { th.nextFrame(death11, hknight_die12); }
    function hknight_die12() { th.nextFrame(death12, hknight_die12); }

    function hknight_dieb1() { th.nextFrame(deathb1, hknight_dieb2); }
    function hknight_dieb2() { th.nextFrame(deathb2, hknight_dieb3); }
    function hknight_dieb3() { th.nextFrame(deathb3, hknight_dieb4); walkerDead(true); }
    function hknight_dieb4() { th.nextFrame(deathb4, hknight_dieb5); }
    function hknight_dieb5() { th.nextFrame(deathb5, hknight_dieb6); }
    function hknight_dieb6() { th.nextFrame(deathb6, hknight_dieb7); }
    function hknight_dieb7() { th.nextFrame(deathb7, hknight_dieb8); }
    function hknight_dieb8() { th.nextFrame(deathb8, hknight_dieb9); }
    function hknight_dieb9() { th.nextFrame(deathb9, hknight_dieb9); }

    function hknight_die() {
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

        death1Sound.play();

        if (Math.random() > 0.5)
            hknight_die1();
        else
            hknight_dieb1();
    }

    function hknight_magica1() { th.nextFrame(magica1, hknight_magica2); fight.ai_face(); }
    function hknight_magica2() { th.nextFrame(magica2, hknight_magica3); fight.ai_face(); }
    function hknight_magica3() { th.nextFrame(magica3, hknight_magica4); fight.ai_face(); }
    function hknight_magica4() { th.nextFrame(magica4, hknight_magica5); fight.ai_face(); }
    function hknight_magica5() { th.nextFrame(magica5, hknight_magica6); fight.ai_face(); }
    function hknight_magica6() { th.nextFrame(magica6, hknight_magica7); fight.ai_face(); }
    function hknight_magica7() { th.nextFrame(magica7, hknight_magica8); hknight_shot(-2); }
    function hknight_magica8() { th.nextFrame(magica8, hknight_magica9); hknight_shot(-1); }
    function hknight_magica9() { th.nextFrame(magica9, hknight_magica10); hknight_shot(0); }
    function hknight_magica10() { th.nextFrame(magica10, hknight_magica11); hknight_shot(1); }
    function hknight_magica11() { th.nextFrame(magica11, hknight_magica12); hknight_shot(2); }
    function hknight_magica12() { th.nextFrame(magica12, hknight_magica13); hknight_shot(3); }
    function hknight_magica13() { th.nextFrame(magica13, hknight_magica14); fight.ai_face(); }
    function hknight_magica14() { th.nextFrame(magica14, hknight_run1); fight.ai_face(); }

    function hknight_magicb1() { th.nextFrame(magicb1, hknight_magicb2); fight.ai_face(); }
    function hknight_magicb2() { th.nextFrame(magicb2, hknight_magicb3); fight.ai_face(); }
    function hknight_magicb3() { th.nextFrame(magicb3, hknight_magicb4); fight.ai_face(); }
    function hknight_magicb4() { th.nextFrame(magicb4, hknight_magicb5); fight.ai_face(); }
    function hknight_magicb5() { th.nextFrame(magicb5, hknight_magicb6); fight.ai_face(); }
    function hknight_magicb6() { th.nextFrame(magicb6, hknight_magicb7); fight.ai_face(); }
    function hknight_magicb7() { th.nextFrame(magicb7, hknight_magicb8); hknight_shot(-2); }
    function hknight_magicb8() { th.nextFrame(magicb8, hknight_magicb9); hknight_shot(-1); }
    function hknight_magicb9() { th.nextFrame(magicb9, hknight_magicb10); hknight_shot(0); }
    function hknight_magicb10() { th.nextFrame(magicb10, hknight_magicb11); hknight_shot(1); }
    function hknight_magicb11() { th.nextFrame(magicb11, hknight_magicb12); hknight_shot(2); }
    function hknight_magicb12() { th.nextFrame(magicb12, hknight_magicb13); hknight_shot(3); }
    function hknight_magicb13() { th.nextFrame(magicb13, hknight_run1); fight.ai_face(); }

    function hknight_magicc1() { th.nextFrame(magicc1, hknight_magicc2); fight.ai_face(); }
    function hknight_magicc2() { th.nextFrame(magicc2, hknight_magicc3); fight.ai_face(); }
    function hknight_magicc3() { th.nextFrame(magicc3, hknight_magicc4); fight.ai_face(); }
    function hknight_magicc4() { th.nextFrame(magicc4, hknight_magicc5); fight.ai_face(); }
    function hknight_magicc5() { th.nextFrame(magicc5, hknight_magicc6); fight.ai_face(); }
    function hknight_magicc6() { th.nextFrame(magicc6, hknight_magicc7); hknight_shot(-2); }
    function hknight_magicc7() { th.nextFrame(magicc7, hknight_magicc8); hknight_shot(-1); }
    function hknight_magicc8() { th.nextFrame(magicc8, hknight_magicc9); hknight_shot(0); }
    function hknight_magicc9() { th.nextFrame(magicc9, hknight_magicc10); hknight_shot(1); }
    function hknight_magicc10() { th.nextFrame(magicc10, hknight_magicc11); hknight_shot(2); }
    function hknight_magicc11() { th.nextFrame(magicc11, hknight_run1); hknight_shot(3); }

    function hknight_char_a1() { th.nextFrame(char_a1, hknight_char_a2); fight.ai_charge(0.20); }
    function hknight_char_a2() { th.nextFrame(char_a2, hknight_char_a3); fight.ai_charge(0.25); }
    function hknight_char_a3() { th.nextFrame(char_a3, hknight_char_a4); fight.ai_charge(0.18); }
    function hknight_char_a4() { th.nextFrame(char_a4, hknight_char_a5); fight.ai_charge(0.16); }
    function hknight_char_a5() { th.nextFrame(char_a5, hknight_char_a6); fight.ai_charge(0.14); }
    function hknight_char_a6() { th.nextFrame(char_a6, hknight_char_a7); fight.ai_charge(0.20); fight.ai_melee(); }
    function hknight_char_a7() { th.nextFrame(char_a7, hknight_char_a8); fight.ai_charge(0.21); fight.ai_melee(); }
    function hknight_char_a8() { th.nextFrame(char_a8, hknight_char_a9); fight.ai_charge(0.13); fight.ai_melee(); }
    function hknight_char_a9() { th.nextFrame(char_a9, hknight_char_a10); fight.ai_charge(0.20); fight.ai_melee(); }
    function hknight_char_a10() { th.nextFrame(char_a10, hknight_char_a11); fight.ai_charge(0.20); fight.ai_melee(); }
    function hknight_char_a11() { th.nextFrame(char_a11, hknight_char_a12); fight.ai_charge(0.18); fight.ai_melee(); }
    function hknight_char_a12() { th.nextFrame(char_a12, hknight_char_a13); fight.ai_charge(0.16); }
    function hknight_char_a13() { th.nextFrame(char_a13, hknight_char_a14); fight.ai_charge(0.14); }
    function hknight_char_a14() { th.nextFrame(char_a14, hknight_char_a15); fight.ai_charge(0.25); }
    function hknight_char_a15() { th.nextFrame(char_a15, hknight_char_a16); fight.ai_charge(0.21); }
    function hknight_char_a16() { th.nextFrame(char_a16, hknight_run1); fight.ai_charge(0.13); }

    function hknight_char_b1() { th.nextFrame(char_b1, hknight_char_b2);
        checkContinueCharge();
        fight.ai_charge(0.23);
        fight.ai_melee();
    }
    function hknight_char_b2() { th.nextFrame(char_b2, hknight_char_b3); fight.ai_charge(0.17); fight.ai_melee(); }
    function hknight_char_b3() { th.nextFrame(char_b3, hknight_char_b4); fight.ai_charge(0.12); fight.ai_melee(); }
    function hknight_char_b4() { th.nextFrame(char_b4, hknight_char_b5); fight.ai_charge(0.22); fight.ai_melee(); }
    function hknight_char_b5() { th.nextFrame(char_b5, hknight_char_b6); fight.ai_charge(0.18); fight.ai_melee(); }
    function hknight_char_b6() { th.nextFrame(char_b6, hknight_char_b1); fight.ai_charge(0.08); fight.ai_melee(); }

    function hknight_slice1() { th.nextFrame(slice1, hknight_slice2); fight.ai_charge(0.09); }
    function hknight_slice2() { th.nextFrame(slice2, hknight_slice3); fight.ai_charge(0.06); }
    function hknight_slice3() { th.nextFrame(slice3, hknight_slice4); fight.ai_charge(0.13); }
    function hknight_slice4() { th.nextFrame(slice4, hknight_slice5); fight.ai_charge(0.04); }
    function hknight_slice5() { th.nextFrame(slice5, hknight_slice6); fight.ai_charge(0.07); fight.ai_melee(); }
    function hknight_slice6() { th.nextFrame(slice6, hknight_slice7); fight.ai_charge(0.15); fight.ai_melee(); }
    function hknight_slice7() { th.nextFrame(slice7, hknight_slice8); fight.ai_charge(0.08); fight.ai_melee(); }
    function hknight_slice8() { th.nextFrame(slice8, hknight_slice9); fight.ai_charge(0.02); fight.ai_melee(); }
    function hknight_slice9() { th.nextFrame(slice9, hknight_slice10); fight.ai_melee(); }
    function hknight_slice10() { th.nextFrame(slice10, hknight_run1); fight.ai_charge(0.03); }

    function hknight_smash1() { th.nextFrame(smash1, hknight_smash2); fight.ai_charge(0.01); }
    function hknight_smash2() { th.nextFrame(smash2, hknight_smash3); fight.ai_charge(0.13); }
    function hknight_smash3() { th.nextFrame(smash3, hknight_smash4); fight.ai_charge(0.09); }
    function hknight_smash4() { th.nextFrame(smash4, hknight_smash5); fight.ai_charge(0.11); }
    function hknight_smash5() { th.nextFrame(smash5, hknight_smash6); fight.ai_charge(0.10); fight.ai_melee(); }
    function hknight_smash6() { th.nextFrame(smash6, hknight_smash7); fight.ai_charge(0.07); fight.ai_melee(); }
    function hknight_smash7() { th.nextFrame(smash7, hknight_smash8); fight.ai_charge(0.12); fight.ai_melee(); }
    function hknight_smash8() { th.nextFrame(smash8, hknight_smash9); fight.ai_charge(0.02); fight.ai_melee(); }
    function hknight_smash9() { th.nextFrame(smash9, hknight_smash10); fight.ai_charge(0.03); fight.ai_melee(); }
    function hknight_smash10() { th.nextFrame(smash10, hknight_smash11); fight.ai_charge(0); }
    function hknight_smash11() { th.nextFrame(smash11, hknight_run1); fight.ai_charge(0); }

    function hknight_watk1() { th.nextFrame(w_attack1, hknight_watk2); fight.ai_charge(0.02); }
    function hknight_watk2() { th.nextFrame(w_attack2, hknight_watk3); fight.ai_charge(0); }
    function hknight_watk3() { th.nextFrame(w_attack3, hknight_watk4); fight.ai_charge(0); }
    function hknight_watk4() { th.nextFrame(w_attack4, hknight_watk5); fight.ai_melee(); }
    function hknight_watk5() { th.nextFrame(w_attack5, hknight_watk6); fight.ai_melee(); }
    function hknight_watk6() { th.nextFrame(w_attack6, hknight_watk7); fight.ai_melee(); }
    function hknight_watk7() { th.nextFrame(w_attack7, hknight_watk8); fight.ai_charge(0.01); }
    function hknight_watk8() { th.nextFrame(w_attack8, hknight_watk9); fight.ai_charge(0.04); }
    function hknight_watk9() { th.nextFrame(w_attack9, hknight_watk10); fight.ai_charge(0.05); }
    function hknight_watk10() { th.nextFrame(w_attack10, hknight_watk11); fight.ai_charge(0.03); fight.ai_melee(); }
    function hknight_watk11() { th.nextFrame(w_attack11, hknight_watk12); fight.ai_charge(0.02); fight.ai_melee(); }
    function hknight_watk12() { th.nextFrame(w_attack12, hknight_watk13); fight.ai_charge(0.02); fight.ai_melee(); }
    function hknight_watk13() { th.nextFrame(w_attack13, hknight_watk14); fight.ai_charge(0); }
    function hknight_watk14() { th.nextFrame(w_attack14, hknight_watk15); fight.ai_charge(0); }
    function hknight_watk15() { th.nextFrame(w_attack15, hknight_watk16); fight.ai_charge(0); }
    function hknight_watk16() { th.nextFrame(w_attack16, hknight_watk17); fight.ai_charge(0.01); }
    function hknight_watk17() { th.nextFrame(w_attack17, hknight_watk18); fight.ai_charge(0.01); fight.ai_melee(); }
    function hknight_watk18() { th.nextFrame(w_attack18, hknight_watk19); fight.ai_charge(0.03); fight.ai_melee(); }
    function hknight_watk19() { th.nextFrame(w_attack19, hknight_watk20); fight.ai_charge(0.04); fight.ai_melee(); }
    function hknight_watk20() { th.nextFrame(w_attack20, hknight_watk21); fight.ai_charge(0.06); }
    function hknight_watk21() { th.nextFrame(w_attack21, hknight_watk22); fight.ai_charge(0.07); }
    function hknight_watk22() { th.nextFrame(w_attack22, hknight_run1); fight.ai_charge(0.03); }

    function hk_idle_sound() {
        if (Math.random() < 0.2) {
            idleSound.play();
        }
    }

    function hknight_pain(attacker, damage) {
        if (pain_finished > time)
            return;

        pain1Sound.play();

        if ((time - pain_finished) > 5) {
            hknight_pain1();
            pain_finished = time + 1;
            return;
        }

        if (Math.random() * 30 > damage)
            return;

        pain_finished = time + 1;
        hknight_pain1();
    }

    property int hknight_type: 0;

    function hknight_melee() {
        hknight_type++;

        slash1Sound.play();
        if (hknight_type === 1) {
            hknight_slice1();
        } else if (hknight_type === 2) {
            hknight_smash1();
        } else if (hknight_type === 3) {
            hknight_watk1();
            hknight_type = 0;
        }
    }

    function sightSound() {
        sight1Sound.play();
    }
}
