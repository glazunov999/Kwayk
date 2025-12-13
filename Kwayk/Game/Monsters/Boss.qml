import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import Kwayk.Core

import "../../js/vec.js" as Vec

Monster {
    id: root

    readonly property int rise1: 0
    readonly property int rise2: 1
    readonly property int rise3: 2
    readonly property int rise4: 3
    readonly property int rise5: 4
    readonly property int rise6: 5
    readonly property int rise7: 6
    readonly property int rise8: 7
    readonly property int rise9: 8
    readonly property int rise10: 9
    readonly property int rise11: 10
    readonly property int rise12: 11
    readonly property int rise13: 12
    readonly property int rise14: 13
    readonly property int rise15: 14
    readonly property int rise16: 15
    readonly property int rise17: 16

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
    readonly property int walk13: 29
    readonly property int walk14: 30
    readonly property int walk15: 31
    readonly property int walk16: 32
    readonly property int walk17: 33
    readonly property int walk18: 34
    readonly property int walk19: 35
    readonly property int walk20: 36
    readonly property int walk21: 37
    readonly property int walk22: 38
    readonly property int walk23: 39
    readonly property int walk24: 40
    readonly property int walk25: 41
    readonly property int walk26: 42
    readonly property int walk27: 43
    readonly property int walk28: 44
    readonly property int walk29: 45
    readonly property int walk30: 46
    readonly property int walk31: 47

    readonly property int death1: 48
    readonly property int death2: 49
    readonly property int death3: 50
    readonly property int death4: 51
    readonly property int death5: 52
    readonly property int death6: 53
    readonly property int death7: 54
    readonly property int death8: 55
    readonly property int death9: 56

    readonly property int attack1: 57
    readonly property int attack2: 58
    readonly property int attack3: 59
    readonly property int attack4: 60
    readonly property int attack5: 61
    readonly property int attack6: 62
    readonly property int attack7: 63
    readonly property int attack8: 64
    readonly property int attack9: 65
    readonly property int attack10: 66
    readonly property int attack11: 67
    readonly property int attack12: 68
    readonly property int attack13: 69
    readonly property int attack14: 70
    readonly property int attack15: 71
    readonly property int attack16: 72
    readonly property int attack17: 73
    readonly property int attack18: 74
    readonly property int attack19: 75
    readonly property int attack20: 76
    readonly property int attack21: 77
    readonly property int attack22: 78
    readonly property int attack23: 79

    readonly property int shocka1: 80
    readonly property int shocka2: 81
    readonly property int shocka3: 82
    readonly property int shocka4: 83
    readonly property int shocka5: 84
    readonly property int shocka6: 85
    readonly property int shocka7: 86
    readonly property int shocka8: 87
    readonly property int shocka9: 88
    readonly property int shocka10: 89

    readonly property int shockb1: 90
    readonly property int shockb2: 91
    readonly property int shockb3: 92
    readonly property int shockb4: 93
    readonly property int shockb5: 94
    readonly property int shockb6: 95

    readonly property int shockc1: 96
    readonly property int shockc2: 97
    readonly property int shockc3: 98
    readonly property int shockc4: 99
    readonly property int shockc5: 100
    readonly property int shockc6: 101
    readonly property int shockc7: 102
    readonly property int shockc8: 103
    readonly property int shockc9: 104
    readonly property int shockc10: 105

    mins: Qt.vector3d(-1.28, -0.24, -1.28)
    maxs: Qt.vector3d(1.28, 2.56, 1.28)

    classname: "monster_boss"

    th.movetype: "step";
    takedamage: Defs.damageNo
    visible: false

    yaw_speed: 20

    use: boss_awake

    readonly property var lavaballComponent: Qt.createComponent("../Flies/BossLavaball.qml")

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/boss.mdl"
            skin.source: "qrc:/Assets/progs/skins/boss.png"
            frame: th.frame
            emissiveIntensity: 2
            emissiveColor: "#ff2200"
        }
    }

    Sound {
        id: out1Sound
        ent: parent
        source: "qrc:/Assets/sounds/boss1/out1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sight1Sound
        ent: parent
        source: "qrc:/Assets/sounds/boss1/sight1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: throwSound
        ent: parent
        source: "qrc:/Assets/sounds/boss1/throw.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: painSound
        ent: parent
        source: "qrc:/Assets/sounds/boss1/pain.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: deathSound
        ent: parent
        source: "qrc:/Assets/sounds/boss1/death.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        total_monsters++;
    }

    function boss_face() {
        enemy = player;
        fight.ai_face();
    }

    function boss_rise1() { th.nextFrame(rise1, boss_rise2); out1Sound.play(); }
    function boss_rise2() { th.nextFrame(rise2, boss_rise3); sight1Sound.play(); }
    function boss_rise3() { th.nextFrame(rise3, boss_rise4); }
    function boss_rise4() { th.nextFrame(rise4, boss_rise5); }
    function boss_rise5() { th.nextFrame(rise5, boss_rise6); }
    function boss_rise6() { th.nextFrame(rise6, boss_rise7); }
    function boss_rise7() { th.nextFrame(rise7, boss_rise8); }
    function boss_rise8() { th.nextFrame(rise8, boss_rise9); }
    function boss_rise9() { th.nextFrame(rise9, boss_rise10); }
    function boss_rise10() { th.nextFrame(rise10, boss_rise11); }
    function boss_rise11() { th.nextFrame(rise11, boss_rise12); }
    function boss_rise12() { th.nextFrame(rise12, boss_rise13); }
    function boss_rise13() { th.nextFrame(rise13, boss_rise14); }
    function boss_rise14() { th.nextFrame(rise14, boss_rise15); }
    function boss_rise15() { th.nextFrame(rise15, boss_rise16); }
    function boss_rise16() { th.nextFrame(rise16, boss_rise17); }
    function boss_rise17() { th.nextFrame(rise17, boss_missile1); }

    function boss_idle1() { th.nextFrame(walk1, boss_idle2); }
    function boss_idle2() { th.nextFrame(walk2, boss_idle3); boss_face(); }
    function boss_idle3() { th.nextFrame(walk3, boss_idle4); boss_face(); }
    function boss_idle4() { th.nextFrame(walk4, boss_idle5); boss_face(); }
    function boss_idle5() { th.nextFrame(walk5, boss_idle6); boss_face(); }
    function boss_idle6() { th.nextFrame(walk6, boss_idle7); boss_face(); }
    function boss_idle7() { th.nextFrame(walk7, boss_idle8); boss_face(); }
    function boss_idle8() { th.nextFrame(walk8, boss_idle9); boss_face(); }
    function boss_idle9() { th.nextFrame(walk9, boss_idle10); boss_face(); }
    function boss_idle10() { th.nextFrame(walk10, boss_idle11); boss_face(); }
    function boss_idle11() { th.nextFrame(walk11, boss_idle12); boss_face(); }
    function boss_idle12() { th.nextFrame(walk12, boss_idle13); boss_face(); }
    function boss_idle13() { th.nextFrame(walk13, boss_idle14); boss_face(); }
    function boss_idle14() { th.nextFrame(walk14, boss_idle15); boss_face(); }
    function boss_idle15() { th.nextFrame(walk15, boss_idle16); boss_face(); }
    function boss_idle16() { th.nextFrame(walk16, boss_idle17); boss_face(); }
    function boss_idle17() { th.nextFrame(walk17, boss_idle18); boss_face(); }
    function boss_idle18() { th.nextFrame(walk18, boss_idle19); boss_face(); }
    function boss_idle19() { th.nextFrame(walk19, boss_idle20); boss_face(); }
    function boss_idle20() { th.nextFrame(walk20, boss_idle21); boss_face(); }
    function boss_idle21() { th.nextFrame(walk21, boss_idle22); boss_face(); }
    function boss_idle22() { th.nextFrame(walk22, boss_idle23); boss_face(); }
    function boss_idle23() { th.nextFrame(walk23, boss_idle24); boss_face(); }
    function boss_idle24() { th.nextFrame(walk24, boss_idle25); boss_face(); }
    function boss_idle25() { th.nextFrame(walk25, boss_idle26); boss_face(); }
    function boss_idle26() { th.nextFrame(walk26, boss_idle27); boss_face(); }
    function boss_idle27() { th.nextFrame(walk27, boss_idle28); boss_face(); }
    function boss_idle28() { th.nextFrame(walk28, boss_idle29); boss_face(); }
    function boss_idle29() { th.nextFrame(walk29, boss_idle30); boss_face(); }
    function boss_idle30() { th.nextFrame(walk30, boss_idle31); boss_face(); }
    function boss_idle31() { th.nextFrame(walk31, boss_idle1); boss_face(); }

    function boss_missile1() { th.nextFrame(attack1, boss_missile2); boss_face(); }
    function boss_missile2() { th.nextFrame(attack2, boss_missile3); boss_face(); }
    function boss_missile3() { th.nextFrame(attack3, boss_missile4); boss_face(); }
    function boss_missile4() { th.nextFrame(attack4, boss_missile5); boss_face(); }
    function boss_missile5() { th.nextFrame(attack5, boss_missile6); boss_face(); }
    function boss_missile6() { th.nextFrame(attack6, boss_missile7); boss_face(); }
    function boss_missile7() { th.nextFrame(attack7, boss_missile8); boss_face(); }
    function boss_missile8() { th.nextFrame(attack8, boss_missile9); boss_face(); }
    function boss_missile9() { th.nextFrame(attack9, boss_missile10); boss_missile(Qt.vector3d(1.0, 1.0, 2.0)); }
    function boss_missile10() { th.nextFrame(attack10, boss_missile11); boss_face(); }
    function boss_missile11() { th.nextFrame(attack11, boss_missile12); boss_face(); }
    function boss_missile12() { th.nextFrame(attack12, boss_missile13); boss_face(); }
    function boss_missile13() { th.nextFrame(attack13, boss_missile14); boss_face(); }
    function boss_missile14() { th.nextFrame(attack14, boss_missile15); boss_face(); }
    function boss_missile15() { th.nextFrame(attack15, boss_missile16); boss_face(); }
    function boss_missile16() { th.nextFrame(attack16, boss_missile17); boss_face(); }
    function boss_missile17() { th.nextFrame(attack17, boss_missile18); boss_face(); }
    function boss_missile18() { th.nextFrame(attack18, boss_missile19); boss_face(); }
    function boss_missile19() { th.nextFrame(attack19, boss_missile20); boss_face(); }
    function boss_missile20() { th.nextFrame(attack20, boss_missile21); boss_missile(Qt.vector3d(1.0, -1.0, 2.0)); }
    function boss_missile21() { th.nextFrame(attack21, boss_missile22); boss_face(); }
    function boss_missile22() { th.nextFrame(attack22, boss_missile23); boss_face(); }
    function boss_missile23() { th.nextFrame(attack23, boss_missile1); boss_face(); }

    function boss_shocka1() { th.nextFrame(shocka1, boss_shocka2); }
    function boss_shocka2() { th.nextFrame(shocka2, boss_shocka3); }
    function boss_shocka3() { th.nextFrame(shocka3, boss_shocka4); }
    function boss_shocka4() { th.nextFrame(shocka4, boss_shocka5); }
    function boss_shocka5() { th.nextFrame(shocka5, boss_shocka6); }
    function boss_shocka6() { th.nextFrame(shocka6, boss_shocka7); }
    function boss_shocka7() { th.nextFrame(shocka7, boss_shocka8); }
    function boss_shocka8() { th.nextFrame(shocka8, boss_shocka9); }
    function boss_shocka9() { th.nextFrame(shocka9, boss_shocka10); }
    function boss_shocka10() { th.nextFrame(shocka10, boss_missile1); }

    function boss_shockb1() { th.nextFrame(shockb1, boss_shockb2); }
    function boss_shockb2() { th.nextFrame(shockb2, boss_shockb3); }
    function boss_shockb3() { th.nextFrame(shockb3, boss_shockb4); }
    function boss_shockb4() { th.nextFrame(shockb4, boss_shockb5); }
    function boss_shockb5() { th.nextFrame(shockb5, boss_shockb6); }
    function boss_shockb6() { th.nextFrame(shockb6, boss_shockb7); }
    function boss_shockb7() { th.nextFrame(shockb1, boss_shockb8); }
    function boss_shockb8() { th.nextFrame(shockb2, boss_shockb9); }
    function boss_shockb9() { th.nextFrame(shockb3, boss_shockb10); }
    function boss_shockb10() { th.nextFrame(shockb4, boss_missile1); }

    function boss_shockc1() { th.nextFrame(shockc1, boss_shockc2); }
    function boss_shockc2() { th.nextFrame(shockc2, boss_shockc3); }
    function boss_shockc3() { th.nextFrame(shockc3, boss_shockc4); }
    function boss_shockc4() { th.nextFrame(shockc4, boss_shockc5); }
    function boss_shockc5() { th.nextFrame(shockc5, boss_shockc6); }
    function boss_shockc6() { th.nextFrame(shockc6, boss_shockc7); }
    function boss_shockc7() { th.nextFrame(shockc7, boss_shockc8); }
    function boss_shockc8() { th.nextFrame(shockc8, boss_shockc9); }
    function boss_shockc9() { th.nextFrame(shockc9, boss_shockc10); }
    function boss_shockc10() { th.nextFrame(shockc10, boss_death1); }

    function boss_death1() { th.nextFrame(death1, boss_death2); deathSound.play(); }
    function boss_death2() { th.nextFrame(death2, boss_death3); }
    function boss_death3() { th.nextFrame(death3, boss_death4); }
    function boss_death4() { th.nextFrame(death4, boss_death5); }
    function boss_death5() { th.nextFrame(death5, boss_death6); }
    function boss_death6() { th.nextFrame(death6, boss_death7); }
    function boss_death7() { th.nextFrame(death7, boss_death8); }
    function boss_death8() { th.nextFrame(death8, boss_death9); }
    function boss_death9() { th.nextFrame(death9, boss_death10);
        out1Sound.play();
        particles.lavaSplash(position);
    }
    function boss_death10() { th.nextFrame(death9, boss_death10);
        killed_monsters++;
        useTargets();
        solid = false;
        visible = false;
    }

    function boss_missile(p) {
        const offang = Vec.vectoangles(enemy.position.minus(position));

        const org = position.plus(forward.times(p.x)).plus(right.times(p.y)).plus(Qt.vector3d(0, p.z, 0));

        let d = enemy.position;

        // lead the player on hard mode
        if (vars.skill.value > 1) {
            const t = enemy.position.minus(org).length() / 3.0;
            const vec = enemy.velocity;
            vec.y = 0;
            d = enemy.position.plus(vec.times(t));
        }

        let vec = d.minus(org).normalized();

        // Create lavaball
        const lavaball = lavaballComponent.createObject(world, {
            position: org,
            avelocity: Qt.vector3d(2, 1, 3),
            velocity: vec.times(3.0),
            owner: root
        });

        throwSound.play();

        // check for dead enemy
        if (enemy.health <= 0)
            boss_idle1();
    }

    function boss_awake() {
        solid = true;
        visible = true;

        takedamage = Defs.damageNo;

        if (vars.skill.value === 0)
            health = 1;
        else
            health = 3;

        enemy = activator;

        particles.lavaSplash(position);

        boss_rise1();
    }

    function boss_pain_lightning() {
        if (health <= 0)
            return;

        painSound.play();
        health = health - 1;

        enemy = activator;

        if (health >= 2)
            boss_shocka1();
        else if (health === 1)
            boss_shockb1();
        else if (health <= 0)
            boss_shockc1();
    }
}
