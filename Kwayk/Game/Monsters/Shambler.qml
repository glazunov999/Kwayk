import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import Kwayk.Core

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
    readonly property int stand10: 9
    readonly property int stand11: 10
    readonly property int stand12: 11
    readonly property int stand13: 12
    readonly property int stand14: 13
    readonly property int stand15: 14
    readonly property int stand16: 15
    readonly property int stand17: 16

    readonly property int walk1: 17
    readonly property int walk2: 18
    readonly property int walk3: 19
    readonly property int walk4: 20
    readonly property int walk5: 21
    readonly property int walk6: 22
    readonly property int walk7: 23
    readonly property int walk8: 24
    readonly property int walk9: 25
    readonly property int walk10: 26
    readonly property int walk11: 27
    readonly property int walk12: 28

    readonly property int run1: 29
    readonly property int run2: 30
    readonly property int run3: 31
    readonly property int run4: 32
    readonly property int run5: 33
    readonly property int run6: 34

    readonly property int smash1: 35
    readonly property int smash2: 36
    readonly property int smash3: 37
    readonly property int smash4: 38
    readonly property int smash5: 39
    readonly property int smash6: 40
    readonly property int smash7: 41
    readonly property int smash8: 42
    readonly property int smash9: 43
    readonly property int smash10: 44
    readonly property int smash11: 45
    readonly property int smash12: 46

    readonly property int swingr1: 47
    readonly property int swingr2: 48
    readonly property int swingr3: 49
    readonly property int swingr4: 50
    readonly property int swingr5: 51
    readonly property int swingr6: 52
    readonly property int swingr7: 53
    readonly property int swingr8: 54
    readonly property int swingr9: 55

    readonly property int swingl1: 56
    readonly property int swingl2: 57
    readonly property int swingl3: 58
    readonly property int swingl4: 59
    readonly property int swingl5: 60
    readonly property int swingl6: 61
    readonly property int swingl7: 62
    readonly property int swingl8: 63
    readonly property int swingl9: 64

    readonly property int magic1: 65
    readonly property int magic2: 66
    readonly property int magic3: 67
    readonly property int magic4: 68
    readonly property int magic5: 69
    readonly property int magic6: 70
    readonly property int magic7: 71
    readonly property int magic8: 72
    readonly property int magic9: 73
    readonly property int magic10: 74
    readonly property int magic11: 75
    readonly property int magic12: 76

    readonly property int pain1: 77
    readonly property int pain2: 78
    readonly property int pain3: 79
    readonly property int pain4: 80
    readonly property int pain5: 81
    readonly property int pain6: 82

    readonly property int death1: 83
    readonly property int death2: 84
    readonly property int death3: 85
    readonly property int death4: 86
    readonly property int death5: 87
    readonly property int death6: 88
    readonly property int death7: 89
    readonly property int death8: 90
    readonly property int death9: 91
    readonly property int death10: 92
    readonly property int death11: 93

    property var light: null

    readonly property var shaftComponent: Qt.createComponent("../Weapons/Shaft.qml")

    property var shaft: null

    mins: Qt.vector3d(-0.32, -0.24, -0.32)
    maxs: Qt.vector3d(0.32, 0.64, 0.32)

    classname: "monster_shambler"
    health: 600
    max_health: 600

    th_stand: sham_stand1
    th_walk: sham_walk1
    th_run: sham_run1
    th_melee: sham_melee
    th_missile: sham_magic1
    th_pain: sham_pain
    th_die: sham_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/shambler.mdl"
            skin.source: "qrc:/Assets/progs/skins/shambler.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_shams.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_shams.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/sidle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: sightSoundFx
        ent: parent
        source: "qrc:/Assets/sounds/shambler/ssight.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: melee1Sound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/melee1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: melee2Sound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/melee2.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: smackSound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/smack.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: attackSound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/sattck1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: magicSound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/sboom.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: painSound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/shurt2.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: deathSound
        ent: parent
        source: "qrc:/Assets/sounds/shambler/sdeath.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: udeathSound
        ent: parent
        source: "qrc:/Assets/sounds/player/udeath.wav"
        attenuationType: Defs.attnNorm
    }

    Component {
        id: lightComponent

        Alias {
            mdl.source: "qrc:/Assets/progs/s_light.mdl"
            skin.source: "qrc:/Assets/progs/skins/s_light.png"
            active: false

            Think {
                think: () => light.destroy();
                Component.onCompleted: nextthink = time + 0.7;
            }
        }
    }

    Component.onCompleted: {
        shaft = shaftComponent.createObject(world, { type: 1 });
        walkmonster_start();
    }

    function sham_stand1() { th.nextFrame(stand1, sham_stand2); ai.ai_stand(); }
    function sham_stand2() { th.nextFrame(stand2, sham_stand3); ai.ai_stand(); }
    function sham_stand3() { th.nextFrame(stand3, sham_stand4); ai.ai_stand(); }
    function sham_stand4() { th.nextFrame(stand4, sham_stand5); ai.ai_stand(); }
    function sham_stand5() { th.nextFrame(stand5, sham_stand6); ai.ai_stand(); }
    function sham_stand6() { th.nextFrame(stand6, sham_stand7); ai.ai_stand(); }
    function sham_stand7() { th.nextFrame(stand7, sham_stand8); ai.ai_stand(); }
    function sham_stand8() { th.nextFrame(stand8, sham_stand9); ai.ai_stand(); }
    function sham_stand9() { th.nextFrame(stand9, sham_stand10); ai.ai_stand(); }
    function sham_stand10() { th.nextFrame(stand10, sham_stand11); ai.ai_stand(); }
    function sham_stand11() { th.nextFrame(stand11, sham_stand12); ai.ai_stand(); }
    function sham_stand12() { th.nextFrame(stand12, sham_stand13); ai.ai_stand(); }
    function sham_stand13() { th.nextFrame(stand13, sham_stand14); ai.ai_stand(); }
    function sham_stand14() { th.nextFrame(stand14, sham_stand15); ai.ai_stand(); }
    function sham_stand15() { th.nextFrame(stand15, sham_stand16); ai.ai_stand(); }
    function sham_stand16() { th.nextFrame(stand16, sham_stand17); ai.ai_stand(); }
    function sham_stand17() { th.nextFrame(stand17, sham_stand1); ai.ai_stand(); }

    function sham_walk1() { th.nextFrame(walk1, sham_walk2); ai.ai_walk(0.10); }
    function sham_walk2() { th.nextFrame(walk2, sham_walk3); ai.ai_walk(0.09); }
    function sham_walk3() { th.nextFrame(walk3, sham_walk4); ai.ai_walk(0.09); }
    function sham_walk4() { th.nextFrame(walk4, sham_walk5); ai.ai_walk(0.05); }
    function sham_walk5() { th.nextFrame(walk5, sham_walk6); ai.ai_walk(0.06); }
    function sham_walk6() { th.nextFrame(walk6, sham_walk7); ai.ai_walk(0.12); }
    function sham_walk7() { th.nextFrame(walk7, sham_walk8); ai.ai_walk(0.08); }
    function sham_walk8() { th.nextFrame(walk8, sham_walk9); ai.ai_walk(0.03); }
    function sham_walk9() { th.nextFrame(walk9, sham_walk10); ai.ai_walk(0.13); }
    function sham_walk10() { th.nextFrame(walk10, sham_walk11); ai.ai_walk(0.09); }
    function sham_walk11() { th.nextFrame(walk11, sham_walk12); ai.ai_walk(0.07); }
    function sham_walk12() { th.nextFrame(walk12, sham_walk1);
        ai.ai_walk(0.07);
        if (Math.random() > 0.8)
            idleSound.play();
    }

    function sham_run1() { th.nextFrame(run1, sham_run2); ai.ai_run(0.20); }
    function sham_run2() { th.nextFrame(run2, sham_run3); ai.ai_run(0.24); }
    function sham_run3() { th.nextFrame(run3, sham_run4); ai.ai_run(0.20); }
    function sham_run4() { th.nextFrame(run4, sham_run5); ai.ai_run(0.20); }
    function sham_run5() { th.nextFrame(run5, sham_run6); ai.ai_run(0.24); }
    function sham_run6() { th.nextFrame(run6, sham_run1);
        ai.ai_run(0.20);
        if (Math.random() > 0.8)
            idleSound.play();
    }

    function sham_smash1() { th.nextFrame(smash1, sham_smash2); melee1Sound.play(); fight.ai_charge(0.02); }
    function sham_smash2() { th.nextFrame(smash2, sham_smash3); fight.ai_charge(0.06); }
    function sham_smash3() { th.nextFrame(smash3, sham_smash4); fight.ai_charge(0.06); }
    function sham_smash4() { th.nextFrame(smash4, sham_smash5); fight.ai_charge(0.05); }
    function sham_smash5() { th.nextFrame(smash5, sham_smash6); fight.ai_charge(0.04); }
    function sham_smash6() { th.nextFrame(smash6, sham_smash7); fight.ai_charge(0.01); }
    function sham_smash7() { th.nextFrame(smash7, sham_smash8); fight.ai_charge(0); }
    function sham_smash8() { th.nextFrame(smash8, sham_smash9); fight.ai_charge(0); }
    function sham_smash9() { th.nextFrame(smash9, sham_smash10); fight.ai_charge(0); }
    function sham_smash10() { th.nextFrame(smash10, sham_smash11);
        if (!enemy)
            return;

        fight.ai_charge(0);

        const delta = enemy.position.minus(position);
        if (delta.length() > 1)
            return;

        if (!weapons.canDamage(enemy, self))
            return;

        const ldmg = (Math.random() + Math.random() + Math.random()) * 40;
        weapons.t_damage(enemy, self, self, ldmg);
        smackSound.play();

        weapons.spawnMeatSpray(position.plus(forward.times(0.16)), right.times(M.crandom()));
        weapons.spawnMeatSpray(position.plus(forward.times(0.16)), right.times(M.crandom()));
    }
    function sham_smash11() { th.nextFrame(smash11, sham_smash12); fight.ai_charge(0.5); }
    function sham_smash12() { th.nextFrame(smash12, sham_run1); fight.ai_charge(0.4); }

    function shamClaw(side) {
        if (!enemy)
            return;

        fight.ai_charge(0.10);

        const delta = enemy.position.minus(position);
        if (delta.length() > 1)
            return;

        const ldmg = (Math.random() + Math.random() + Math.random()) * 20;
        weapons.t_damage(enemy, self, self, ldmg);
        smackSound.play();

        if (side)
            weapons.spawnMeatSpray(position.plus(forward.times(0.16)), right.times(side));
    }

    function sham_swingl1() { th.nextFrame(swingl1, sham_swingl2); melee2Sound.play(); fight.ai_charge(0.05); }
    function sham_swingl2() { th.nextFrame(swingl2, sham_swingl3); fight.ai_charge(0.03); }
    function sham_swingl3() { th.nextFrame(swingl3, sham_swingl4); fight.ai_charge(0.07); }
    function sham_swingl4() { th.nextFrame(swingl4, sham_swingl5); fight.ai_charge(0.03); }
    function sham_swingl5() { th.nextFrame(swingl5, sham_swingl6); fight.ai_charge(0.07); }
    function sham_swingl6() { th.nextFrame(swingl6, sham_swingl7); fight.ai_charge(0.09); }
    function sham_swingl7() { th.nextFrame(swingl7, sham_swingl8); fight.ai_charge(0.05); shamClaw(2.5); }
    function sham_swingl8() { th.nextFrame(swingl8, sham_swingl9); fight.ai_charge(0.04); }
    function sham_swingl9() { th.nextFrame(swingl9, sham_run1);
        fight.ai_charge(0.08);
        if (Math.random() < 0.5)
            th.think = sham_swingr1;
    }

    function sham_swingr1() { th.nextFrame(swingr1, sham_swingr2); melee1Sound.play(); fight.ai_charge(0.01); }
    function sham_swingr2() { th.nextFrame(swingr2, sham_swingr3); fight.ai_charge(0.08); }
    function sham_swingr3() { th.nextFrame(swingr3, sham_swingr4); fight.ai_charge(0.14); }
    function sham_swingr4() { th.nextFrame(swingr4, sham_swingr5); fight.ai_charge(0.07); }
    function sham_swingr5() { th.nextFrame(swingr5, sham_swingr6); fight.ai_charge(0.03); }
    function sham_swingr6() { th.nextFrame(swingr6, sham_swingr7); fight.ai_charge(0.06); }
    function sham_swingr7() { th.nextFrame(swingr7, sham_swingr8); fight.ai_charge(0.06); shamClaw(-2.5); }
    function sham_swingr8() { th.nextFrame(swingr8, sham_swingr9); fight.ai_charge(0.03);  }
    function sham_swingr9() { th.nextFrame(swingr9, sham_run1);
        fight.ai_charge(0.01);
        fight.ai_charge(0.10);
        if (Math.random() < 0.5)
            th.think = sham_swingl1;
    }

    function sham_melee() {
        const chance = Math.random();
        if (chance > 0.6 || health === 600)
            sham_smash1();
        else if (chance > 0.3)
            sham_swingr1();
        else
            sham_swingl1();
    }

    function castLightning() {
        effects = effects | Defs.efMuzzleflash;

        fight.ai_face();

        const org = position.plus(Qt.vector3d(0, 0.4, 0));

        const dir = enemy.position.plus(Qt.vector3d(0, 0.16, 0)).minus(org).normalized();
        const end = position.plus(dir.times(6));

        const trace = physicsSystem.castRay(org, end.minus(org), Layers.NoMonsters, [body]);
        const endpos = trace.fraction >= 1.0 ? end : trace.position;

        shaft.endpos = endpos;
        shaft.position = org;
        shaft.fire();

        weapons.lightningDamage(org, endpos, self, 10);
    }

    function sham_magic1() { th.nextFrame(magic1, sham_magic2); fight.ai_face(); attackSound.play(); }
    function sham_magic2() { th.nextFrame(magic2, sham_magic3); fight.ai_face(); }
    function sham_magic3() { th.nextFrame(magic3, sham_magic4);
        fight.ai_face();
        th.nextthink = th.nextthink + 0.2;

        effects = effects | Defs.efMuzzleflash;

        fight.ai_face();
        light = lightComponent.createObject(world, { position: position, eulerRotation: eulerRotation });
    }
    function sham_magic4() { th.nextFrame(magic4, sham_magic5); light.frame = 1; }
    function sham_magic5() { th.nextFrame(magic5, sham_magic6); light.frame = 2; }
    function sham_magic6() { th.nextFrame(magic6, sham_magic9);
        light.destroy();
        castLightning();
        magicSound.play();
    }
    function sham_magic9() { th.nextFrame(magic9, sham_magic10); castLightning(); }
    function sham_magic10() { th.nextFrame(magic10, sham_magic11); castLightning(); }
    function sham_magic11() { th.nextFrame(magic11, sham_magic12);
        if (vars.skill.value === 3)
            castLightning();
    }
    function sham_magic12() { th.nextFrame(magic12, sham_run1); }

    function sham_pain1() { th.nextFrame(pain1, sham_pain2); }
    function sham_pain2() { th.nextFrame(pain2, sham_pain3); }
    function sham_pain3() { th.nextFrame(pain3, sham_pain4); }
    function sham_pain4() { th.nextFrame(pain4, sham_pain5); }
    function sham_pain5() { th.nextFrame(pain5, sham_pain6); }
    function sham_pain6() { th.nextFrame(pain6, sham_run1); }

    function sham_pain(attacker, damage) {
        painSound.play();

        if (health <= 0)
            return;

        if ((Math.random() * 400) > damage)
            return;

        if (pain_finished > time)
            return;

        pain_finished = time + 2;
        sham_pain1();
    }

    function sham_death1() { th.nextFrame(death1, sham_death2); }
    function sham_death2() { th.nextFrame(death2, sham_death3); }
    function sham_death3() { th.nextFrame(death3, sham_death4); walkerDead(true); }
    function sham_death4() { th.nextFrame(death4, sham_death5); }
    function sham_death5() { th.nextFrame(death5, sham_death6); }
    function sham_death6() { th.nextFrame(death6, sham_death7); }
    function sham_death7() { th.nextFrame(death7, sham_death8); }
    function sham_death8() { th.nextFrame(death8, sham_death9); }
    function sham_death9() { th.nextFrame(death9, sham_death10); }
    function sham_death10() { th.nextFrame(death10, sham_death11); }
    function sham_death11() { th.nextFrame(death11, sham_death11); }

    function sham_die() {
        if (health < -60) {
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
        sham_death1();
    }

    function shamCheckAttack() {
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

        if (spot1.minus(spot2).length() > 6)
            return false;

        const trace = physicsSystem.castRay(spot1, spot2.minus(spot1), Layers.Normal, [body]);

        if (!trace?.body || trace.body.ent !== targ)
            return false;

        if (enemy_range === Defs.rangeFar)
            return false;

        attack_state = Defs.asMissile;
        attackFinished(2 + 2 * Math.random());
        return true;
    }
    function sightSound() {
        sightSoundFx.play();
    }
}
