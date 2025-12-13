import QtQuick
import QtQuick3D

import Backend
import Kwayk.Core
import Kwayk.Game

import "../../js/math.js" as M

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

    readonly property int run1: 25
    readonly property int run2: 26
    readonly property int run3: 27
    readonly property int run4: 28
    readonly property int run5: 29
    readonly property int run6: 30
    readonly property int run7: 31
    readonly property int run8: 32

    readonly property int swing1: 33
    readonly property int swing2: 34
    readonly property int swing3: 35
    readonly property int swing4: 36
    readonly property int swing5: 37
    readonly property int swing6: 38
    readonly property int swing7: 39
    readonly property int swing8: 40
    readonly property int swing9: 41
    readonly property int swing10: 42
    readonly property int swing11: 43
    readonly property int swing12: 44
    readonly property int swing13: 45
    readonly property int swing14: 46

    readonly property int smash1: 47
    readonly property int smash2: 48
    readonly property int smash3: 49
    readonly property int smash4: 50
    readonly property int smash5: 51
    readonly property int smash6: 52
    readonly property int smash7: 53
    readonly property int smash8: 54
    readonly property int smash9: 55
    readonly property int smash10: 56
    readonly property int smash11: 57
    readonly property int smash12: 58
    readonly property int smash13: 59
    readonly property int smash14: 60

    readonly property int shoot1: 61
    readonly property int shoot2: 62
    readonly property int shoot3: 63
    readonly property int shoot4: 64
    readonly property int shoot5: 65
    readonly property int shoot6: 66

    readonly property int pain1: 67
    readonly property int pain2: 68
    readonly property int pain3: 69
    readonly property int pain4: 70
    readonly property int pain5: 71

    readonly property int painb1: 72
    readonly property int painb2: 73
    readonly property int painb3: 74

    readonly property int painc1: 75
    readonly property int painc2: 76
    readonly property int painc3: 77
    readonly property int painc4: 78
    readonly property int painc5: 79
    readonly property int painc6: 80

    readonly property int paind1: 81
    readonly property int paind2: 82
    readonly property int paind3: 83
    readonly property int paind4: 84
    readonly property int paind5: 85
    readonly property int paind6: 86
    readonly property int paind7: 87
    readonly property int paind8: 88
    readonly property int paind9: 89
    readonly property int paind10: 90
    readonly property int paind11: 91
    readonly property int paind12: 92
    readonly property int paind13: 93
    readonly property int paind14: 94
    readonly property int paind15: 95
    readonly property int paind16: 96

    readonly property int paine1: 97
    readonly property int paine2: 98
    readonly property int paine3: 99
    readonly property int paine4: 100
    readonly property int paine5: 101
    readonly property int paine6: 102
    readonly property int paine7: 103
    readonly property int paine8: 104
    readonly property int paine9: 105
    readonly property int paine10: 106
    readonly property int paine11: 107
    readonly property int paine12: 108
    readonly property int paine13: 109
    readonly property int paine14: 110
    readonly property int paine15: 111

    readonly property int death1: 112
    readonly property int death2: 113
    readonly property int death3: 114
    readonly property int death4: 115
    readonly property int death5: 116
    readonly property int death6: 117
    readonly property int death7: 118
    readonly property int death8: 119
    readonly property int death9: 120
    readonly property int death10: 121
    readonly property int death11: 122
    readonly property int death12: 123
    readonly property int death13: 124
    readonly property int death14: 125

    readonly property int bdeath1: 126
    readonly property int bdeath2: 127
    readonly property int bdeath3: 128
    readonly property int bdeath4: 129
    readonly property int bdeath5: 130
    readonly property int bdeath6: 131
    readonly property int bdeath7: 132
    readonly property int bdeath8: 133
    readonly property int bdeath9: 134
    readonly property int bdeath10: 135

    readonly property int pull1: 136
    readonly property int pull2: 137
    readonly property int pull3: 138
    readonly property int pull4: 139
    readonly property int pull5: 140
    readonly property int pull6: 141
    readonly property int pull7: 142
    readonly property int pull8: 143
    readonly property int pull9: 144
    readonly property int pull10: 145
    readonly property int pull11: 146

    readonly property var grenadeComponent: Qt.createComponent("../Flies/Grenade.qml")

    readonly property alias ogdragSound: ogdragSound

    mins: Qt.vector3d(-0.32, -0.24, -0.32)
    maxs: Qt.vector3d(0.32, 0.64, 0.32)

    classname: "monster_ogre"
    health: 200
    max_health: 200

    th_stand: ogre_stand1
    th_walk: ogre_walk1
    th_run: ogre_run1
    th_melee: ogre_melee
    th_missile: ogre_nail1
    th_pain: ogre_pain
    th_die: ogre_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/ogre.mdl"
            skin.source: "qrc:/Assets/progs/skins/ogre.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_ogre.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_ogre.png"
            active: false
        }
    }

    Sound {
        id: ogidleSound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogidle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: ogdragSound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogdrag.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: ogidle2Sound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogidle2.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: ogsawatkSound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogsawatk.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: ogpain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogpain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: ogdthSound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogdth.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: ogwakeSound
        ent: parent
        source: "qrc:/Assets/sounds/ogre/ogwake.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function ogreFireGrenade() {
        let velocity = enemy.position.minus(position).normalized();
        velocity = velocity.times(6);
        velocity.y = 2;

        const settings = {
            position: position,
            velocity: velocity,
            avelocity: Qt.vector3d(3, 3, 3),
            damage: 40,
            owner: self
        }

        grenadeComponent.createObject(world, settings);
    }

    function chainsaw(side) {
        if (!enemy)
            return;

        if (!weapons.canDamage(enemy, self))
            return;

        fight.ai_charge(0.10);

        const delta = enemy.position.minus(position);
        if (delta.length() > 1)
            return;

        const ldmg = (Math.random() + Math.random() + Math.random()) * 4;
        weapons.t_damage(enemy, self, self, ldmg);

        if (side) {
            if (side === 1)
                weapons.spawnMeatSpray(position.plus(forward.times(0.16)), right.times(M.crandom() * 1));
            else
                weapons.spawnMeatSpray(position.plus(forward.times(0.16)), right.times(side));
        }
    }

    function ogre_stand1() { th.nextFrame(stand1, ogre_stand2); ai.ai_stand(); }
    function ogre_stand2() { th.nextFrame(stand2, ogre_stand3); ai.ai_stand(); }
    function ogre_stand3() { th.nextFrame(stand3, ogre_stand4); ai.ai_stand(); }
    function ogre_stand4() { th.nextFrame(stand4, ogre_stand5); ai.ai_stand(); }
    function ogre_stand5() { th.nextFrame(stand5, ogre_stand6);
        if (Math.random() < 0.2)
            ogidleSound.play();
        ai.ai_stand();
    }
    function ogre_stand6() { th.nextFrame(stand6, ogre_stand7); ai.ai_stand(); }
    function ogre_stand7() { th.nextFrame(stand7, ogre_stand8); ai.ai_stand(); }
    function ogre_stand8() { th.nextFrame(stand8, ogre_stand9); ai.ai_stand(); }
    function ogre_stand9() { th.nextFrame(stand9, ogre_stand1); ai.ai_stand(); }

    function ogre_walk1() { th.nextFrame(walk1, ogre_walk2); ai.ai_walk(0.03); }
    function ogre_walk2() { th.nextFrame(walk2, ogre_walk3); ai.ai_walk(0.02); }
    function ogre_walk3() { th.nextFrame(walk3, ogre_walk4);
        ai.ai_walk(0.02);
        if (Math.random() < 0.2)
            ogidleSound.play();
    }
    function ogre_walk4() { th.nextFrame(walk4, ogre_walk5); ai.ai_walk(0.02); }
    function ogre_walk5() { th.nextFrame(walk5, ogre_walk6); ai.ai_walk(0.02); }
    function ogre_walk6() { th.nextFrame(walk6, ogre_walk7);
        ai.ai_walk(0.05);
        if (Math.random() < 0.1)
            ogdragSound.play();
    }
    function ogre_walk7() { th.nextFrame(walk7, ogre_walk8); ai.ai_walk(0.03); }
    function ogre_walk8() { th.nextFrame(walk8, ogre_walk9); ai.ai_walk(0.02); }
    function ogre_walk9() { th.nextFrame(walk9, ogre_walk10); ai.ai_walk(0.03); }
    function ogre_walk10() { th.nextFrame(walk10, ogre_walk11); ai.ai_walk(0.01); }
    function ogre_walk11() { th.nextFrame(walk11, ogre_walk12); ai.ai_walk(0.02); }
    function ogre_walk12() { th.nextFrame(walk12, ogre_walk13); ai.ai_walk(0.03); }
    function ogre_walk13() { th.nextFrame(walk13, ogre_walk14); ai.ai_walk(0.03); }
    function ogre_walk14() { th.nextFrame(walk14, ogre_walk15); ai.ai_walk(0.03); }
    function ogre_walk15() { th.nextFrame(walk15, ogre_walk16); ai.ai_walk(0.03); }
    function ogre_walk16() { th.nextFrame(walk16, ogre_walk1); ai.ai_walk(0.04); }

    function ogre_run1() { th.nextFrame(run1, ogre_run2);
        ai.ai_run(0.09);
        if (Math.random() < 0.2)
            ogidle2Sound.play();
    }
    function ogre_run2() { th.nextFrame(run2, ogre_run3); ai.ai_run(0.12); }
    function ogre_run3() { th.nextFrame(run3, ogre_run4); ai.ai_run(0.08); }
    function ogre_run4() { th.nextFrame(run4, ogre_run5); ai.ai_run(0.22); }
    function ogre_run5() { th.nextFrame(run5, ogre_run6); ai.ai_run(0.16); }
    function ogre_run6() { th.nextFrame(run6, ogre_run7); ai.ai_run(0.04); }
    function ogre_run7() { th.nextFrame(run7, ogre_run8); ai.ai_run(0.13); }
    function ogre_run8() { th.nextFrame(run8, ogre_run1); ai.ai_run(0.24); }

    function ogre_swing1() { th.nextFrame(swing1, ogre_swing2); fight.ai_charge(0.11); ogsawatkSound.play(); }
    function ogre_swing2() { th.nextFrame(swing2, ogre_swing3); fight.ai_charge(0.01); }
    function ogre_swing3() { th.nextFrame(swing3, ogre_swing4); fight.ai_charge(0.04); }
    function ogre_swing4() { th.nextFrame(swing4, ogre_swing5); fight.ai_charge(0.13); }
    function ogre_swing5() { th.nextFrame(swing5, ogre_swing6);
        fight.ai_charge(0.09);
        chainsaw(0);
        angles.y += Math.random() * 25;
    }
    function ogre_swing6() { th.nextFrame(swing6, ogre_swing7); chainsaw(2); angles.y += Math.random() * 25; }
    function ogre_swing7() { th.nextFrame(swing7, ogre_swing8); chainsaw(0); angles.y += Math.random() * 25; }
    function ogre_swing8() { th.nextFrame(swing8, ogre_swing9); chainsaw(0); angles.y += Math.random() * 25; }
    function ogre_swing9() { th.nextFrame(swing9, ogre_swing10); chainsaw(0); angles.y += Math.random() * 25; }
    function ogre_swing10() { th.nextFrame(swing10, ogre_swing11); chainsaw(-2); angles.y += Math.random() * 25; }
    function ogre_swing11() { th.nextFrame(swing11, ogre_swing12); chainsaw(0); angles.y += Math.random() * 25; }
    function ogre_swing12() { th.nextFrame(swing12, ogre_swing13); fight.ai_charge(0.03); }
    function ogre_swing13() { th.nextFrame(swing13, ogre_swing14); fight.ai_charge(0.08); }
    function ogre_swing14() { th.nextFrame(swing14, ogre_run1); fight.ai_charge(0.09); }

    function ogre_smash1() { th.nextFrame(smash1, ogre_smash2); fight.ai_charge(0.06); ogsawatkSound.play(); }
    function ogre_smash2() { th.nextFrame(smash2, ogre_smash3); fight.ai_charge(0); }
    function ogre_smash3() { th.nextFrame(smash3, ogre_smash4); fight.ai_charge(0); }
    function ogre_smash4() { th.nextFrame(smash4, ogre_smash5); fight.ai_charge(0.01); }
    function ogre_smash5() { th.nextFrame(smash5, ogre_smash6); fight.ai_charge(0.04); }
    function ogre_smash6() { th.nextFrame(smash6, ogre_smash7); fight.ai_charge(0.04); }
    function ogre_smash7() { th.nextFrame(smash7, ogre_smash8); fight.ai_charge(0.04); }
    function ogre_smash8() { th.nextFrame(smash8, ogre_smash9); fight.ai_charge(0.10); }
    function ogre_smash9() { th.nextFrame(smash9, ogre_smash10); fight.ai_charge(0.13); }
    function ogre_smash10() { th.nextFrame(smash10, ogre_smash11); chainsaw(1); }
    function ogre_smash11() { th.nextFrame(smash11, ogre_smash12);
        fight.ai_charge(0.02);
        chainsaw(0);
        th.nextthink += Math.random() * 0.2;
    }
    function ogre_smash12() { th.nextFrame(smash12, ogre_smash13); fight.ai_charge(0); }
    function ogre_smash13() { th.nextFrame(smash13, ogre_smash14); fight.ai_charge(0.04); }
    function ogre_smash14() { th.nextFrame(smash14, ogre_run1); fight.ai_charge(0.12); }

    function ogre_nail1() { th.nextFrame(shoot1, ogre_nail2); fight.ai_face(); }
    function ogre_nail2() { th.nextFrame(shoot2, ogre_nail3); fight.ai_face();  }
    function ogre_nail3() { th.nextFrame(shoot2, ogre_nail4); fight.ai_face();  }
    function ogre_nail4() { th.nextFrame(shoot3, ogre_nail5); fight.ai_face(); ogreFireGrenade();  }
    function ogre_nail5() { th.nextFrame(shoot4, ogre_nail6); fight.ai_face();  }
    function ogre_nail6() { th.nextFrame(shoot5, ogre_nail7); fight.ai_face();  }
    function ogre_nail7() { th.nextFrame(shoot6, ogre_run1); fight.ai_face();  }

    function ogre_pain1() { th.nextFrame(pain1, ogre_pain2); }
    function ogre_pain2() { th.nextFrame(pain2, ogre_pain3); }
    function ogre_pain3() { th.nextFrame(pain3, ogre_pain4); }
    function ogre_pain4() { th.nextFrame(pain4, ogre_pain5); }
    function ogre_pain5() { th.nextFrame(pain5, ogre_run1); }

    function ogre_painb1() { th.nextFrame(painb1, ogre_painb2); }
    function ogre_painb2() { th.nextFrame(painb2, ogre_painb3); }
    function ogre_painb3() { th.nextFrame(painb3, ogre_run1); }

    function ogre_painc1() { th.nextFrame(painc1, ogre_painc2); }
    function ogre_painc2() { th.nextFrame(painc2, ogre_painc3); }
    function ogre_painc3() { th.nextFrame(painc3, ogre_painc4); }
    function ogre_painc4() { th.nextFrame(painc4, ogre_painc5); }
    function ogre_painc5() { th.nextFrame(painc5, ogre_painc6); }
    function ogre_painc6() { th.nextFrame(painc6, ogre_run1); }

    function ogre_paind1() { th.nextFrame(paind1, ogre_paind2); }
    function ogre_paind2() { th.nextFrame(paind2, ogre_paind3); ai.ai_pain(0.10); }
    function ogre_paind3() { th.nextFrame(paind3, ogre_paind4); ai.ai_pain(0.09); }
    function ogre_paind4() { th.nextFrame(paind4, ogre_paind5); ai.ai_pain(0.04); }
    function ogre_paind5() { th.nextFrame(paind5, ogre_paind6); }
    function ogre_paind6() { th.nextFrame(paind6, ogre_paind7); }
    function ogre_paind7() { th.nextFrame(paind7, ogre_paind8); }
    function ogre_paind8() { th.nextFrame(paind8, ogre_paind9); }
    function ogre_paind9() { th.nextFrame(paind9, ogre_paind10); }
    function ogre_paind10() { th.nextFrame(paind10, ogre_paind11); }
    function ogre_paind11() { th.nextFrame(paind11, ogre_paind12); }
    function ogre_paind12() { th.nextFrame(paind12, ogre_paind13); }
    function ogre_paind13() { th.nextFrame(paind13, ogre_paind14); }
    function ogre_paind14() { th.nextFrame(paind14, ogre_paind15); }
    function ogre_paind15() { th.nextFrame(paind15, ogre_paind16); }
    function ogre_paind16() { th.nextFrame(paind16, ogre_run1); }

    function ogre_paine1() { th.nextFrame(paine1, ogre_paine2); }
    function ogre_paine2() { th.nextFrame(paine2, ogre_paine3); ai.ai_pain(0.10); }
    function ogre_paine3() { th.nextFrame(paine3, ogre_paine4); ai.ai_pain(0.09); }
    function ogre_paine4() { th.nextFrame(paine4, ogre_paine5); ai.ai_pain(0.04);}
    function ogre_paine5() { th.nextFrame(paine5, ogre_paine6); }
    function ogre_paine6() { th.nextFrame(paine6, ogre_paine7); }
    function ogre_paine7() { th.nextFrame(paine7, ogre_paine8); }
    function ogre_paine8() { th.nextFrame(paine8, ogre_paine9); }
    function ogre_paine9() { th.nextFrame(paine9, ogre_paine10); }
    function ogre_paine10() { th.nextFrame(paine10, ogre_paine11); }
    function ogre_paine11() { th.nextFrame(paine11, ogre_paine12); }
    function ogre_paine12() { th.nextFrame(paine12, ogre_paine13); }
    function ogre_paine13() { th.nextFrame(paine13, ogre_paine14); }
    function ogre_paine14() { th.nextFrame(paine14, ogre_paine15); }
    function ogre_paine15() { th.nextFrame(paine15, ogre_run1); }

    function ogre_pain() {
        if (pain_finished > time)
            return;

        ogpain1Sound.play();

        const r = Math.random();

        if (r < 0.25) {
            ogre_pain1();
            pain_finished = time + 1;
        } else if (r < 0.5) {
            ogre_painb1();
            pain_finished = time + 1;
        } else if (r < 0.75) {
            ogre_painc1();
            pain_finished = time + 1;
        } else if (r < 0.88) {
            ogre_paind1();
            pain_finished = time + 2;
        } else {
            ogre_paine1();
            pain_finished = time + 2;
        }
    }

    function ogre_die1() { th.nextFrame(death1, ogre_die2); }
    function ogre_die2() { th.nextFrame(death2, ogre_die3); }
    function ogre_die3() { th.nextFrame(death3, ogre_die4);
        walkerDead(true);
        ammo_rockets = 2;
        dropBackpack();
    }
    function ogre_die4() { th.nextFrame(death4, ogre_die5); }
    function ogre_die5() { th.nextFrame(death5, ogre_die6); }
    function ogre_die6() { th.nextFrame(death6, ogre_die7); }
    function ogre_die7() { th.nextFrame(death7, ogre_die8); }
    function ogre_die8() { th.nextFrame(death8, ogre_die9); }
    function ogre_die9() { th.nextFrame(death9, ogre_die10); }
    function ogre_die10() { th.nextFrame(death10, ogre_die11); }
    function ogre_die11() { th.nextFrame(death11, ogre_die12); }
    function ogre_die12() { th.nextFrame(death12, ogre_die13); }
    function ogre_die13() { th.nextFrame(death13, ogre_die14); }
    function ogre_die14() { th.nextFrame(death14, ogre_die14); }

    function ogre_bdie1() { th.nextFrame(bdeath1, ogre_bdie2); }
    function ogre_bdie2() { th.nextFrame(bdeath2, ogre_bdie3); ai.ai_forward(0.05); }
    function ogre_bdie3() { th.nextFrame(bdeath3, ogre_bdie4);
        walkerDead(true);
        ammo_rockets = 2;
        dropBackpack();
    }
    function ogre_bdie4() { th.nextFrame(bdeath4, ogre_bdie5); ai.ai_forward(0.01); }
    function ogre_bdie5() { th.nextFrame(bdeath5, ogre_bdie6); ai.ai_forward(0.03); }
    function ogre_bdie6() { th.nextFrame(bdeath6, ogre_bdie7); ai.ai_forward(0.07); }
    function ogre_bdie7() { th.nextFrame(bdeath7, ogre_bdie8); ai.ai_forward(0.25); }
    function ogre_bdie8() { th.nextFrame(bdeath8, ogre_bdie9); }
    function ogre_bdie9() { th.nextFrame(bdeath9, ogre_bdie10); }
    function ogre_bdie10() { th.nextFrame(bdeath10, ogre_bdie10); }

    function ogre_die() {
        if (health < -80) {
            udeathSound.play();
            throwHead(health);
            throwGib("gib3", health);
            throwGib("gib3", health);
            throwGib("gib3", health);
            return;
        }

        if (takedamage === Defs.damageDead) {
            health = 0;
            return;
        }

        ogdthSound.play();

        if (Math.random() < 0.5)
            ogre_die1();
        else
            ogre_bdie1();
    }

    function ogre_melee() {
        if (Math.random() > 0.5)
            ogre_smash1();
        else
            ogre_swing1();
    }

    function ogreCheckAttack() {
        if (enemy_range === Defs.rangeMelee) {
            if (weapons.canDamage(enemy, self)) {
                attack_state = Defs.asMelee;
                return true;
            }
        }

        if (time < attack_finished)
            return false;

        if (!enemy_visible)
            return false;

        const targ = enemy;

        const spot1 = position.plus(view_ofs);
        const spot2 = targ.position.plus(targ.view_ofs);

        const trace = physicsSystem.castRay(spot1, spot2.minus(spot1), Layers.Normal, [body]);

        if (!trace?.body || trace.body.ent !== targ)
            return false;

        if (time < attack_finished)
            return false;

        let chance = 0;
        if (enemy_range === Defs.rangeFar)
            return false;
        else if (enemy_range === Defs.rangeNear)
            chance = 0.10;
        else if (enemy_range === Defs.rangeMid)
            chance = 0.05;

        attack_state = Defs.asMissile;
        attackFinished(1 + 2 * Math.random());
        return true;
    }

    function sightSound() {
        ogwakeSound.play();
    }
}
