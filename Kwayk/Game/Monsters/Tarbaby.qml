import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import Kwayk.Core

Monster {
    id: root

    readonly property int walk1: 0
    readonly property int walk2: 1
    readonly property int walk3: 2
    readonly property int walk4: 3
    readonly property int walk5: 4
    readonly property int walk6: 5
    readonly property int walk7: 6
    readonly property int walk8: 7
    readonly property int walk9: 8
    readonly property int walk10: 9
    readonly property int walk11: 10
    readonly property int walk12: 11
    readonly property int walk13: 12
    readonly property int walk14: 13
    readonly property int walk15: 14
    readonly property int walk16: 15
    readonly property int walk17: 16
    readonly property int walk18: 17
    readonly property int walk19: 18
    readonly property int walk20: 19
    readonly property int walk21: 20
    readonly property int walk22: 21
    readonly property int walk23: 22
    readonly property int walk24: 23
    readonly property int walk25: 24

    readonly property int run1: 25
    readonly property int run2: 26
    readonly property int run3: 27
    readonly property int run4: 28
    readonly property int run5: 29
    readonly property int run6: 30
    readonly property int run7: 31
    readonly property int run8: 32
    readonly property int run9: 33
    readonly property int run10: 34
    readonly property int run11: 35
    readonly property int run12: 36
    readonly property int run13: 37
    readonly property int run14: 38
    readonly property int run15: 39
    readonly property int run16: 40
    readonly property int run17: 41
    readonly property int run18: 42
    readonly property int run19: 43
    readonly property int run20: 44
    readonly property int run21: 45
    readonly property int run22: 46
    readonly property int run23: 47
    readonly property int run24: 48
    readonly property int run25: 49

    readonly property int jump1: 50
    readonly property int jump2: 51
    readonly property int jump3: 52
    readonly property int jump4: 53
    readonly property int jump5: 54
    readonly property int jump6: 55

    readonly property int fly1: 56
    readonly property int fly2: 57
    readonly property int fly3: 58
    readonly property int fly4: 59

    readonly property int exp: 60

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_tarbaby"
    health: 80
    max_health: 80

    th_stand: tbaby_stand1
    th_walk: tbaby_walk1
    th_run: tbaby_run1
    th_missile: tbaby_jump1
    th_melee: tbaby_jump1
    th_die: tbaby_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/tarbaby.mdl"
            skin.source: "qrc:/Assets/progs/skins/tarbaby.png"
            frame: th.frame
        }
    }

    Sound {
        id: hitSound
        ent: parent
        source: "qrc:/Assets/sounds/blob/hit1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: landSound
        ent: parent
        source: "qrc:/Assets/sounds/blob/land1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: deathSound
        ent: parent
        source: "qrc:/Assets/sounds/blob/death1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: sightSoundFx
        ent: parent
        source: "qrc:/Assets/sounds/blob/sight1.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function tbaby_stand1() { th.nextFrame(walk1, tbaby_stand1); ai.ai_stand(); }

    function tbaby_hang1() { th.nextFrame(walk1, tbaby_hang1); ai.ai_stand(); }

    function tbaby_walk1() { th.nextFrame(walk1, tbaby_walk2); ai.ai_turn(); }
    function tbaby_walk2() { th.nextFrame(walk2, tbaby_walk3); ai.ai_turn(); }
    function tbaby_walk3() { th.nextFrame(walk3, tbaby_walk4); ai.ai_turn(); }
    function tbaby_walk4() { th.nextFrame(walk4, tbaby_walk5); ai.ai_turn(); }
    function tbaby_walk5() { th.nextFrame(walk5, tbaby_walk6); ai.ai_turn(); }
    function tbaby_walk6() { th.nextFrame(walk6, tbaby_walk7); ai.ai_turn(); }
    function tbaby_walk7() { th.nextFrame(walk7, tbaby_walk8); ai.ai_turn(); }
    function tbaby_walk8() { th.nextFrame(walk8, tbaby_walk9); ai.ai_turn(); }
    function tbaby_walk9() { th.nextFrame(walk9, tbaby_walk10); ai.ai_turn(); }
    function tbaby_walk10() { th.nextFrame(walk10, tbaby_walk11); ai.ai_turn(); }
    function tbaby_walk11() { th.nextFrame(walk11, tbaby_walk12); ai.ai_walk(0.02); }
    function tbaby_walk12() { th.nextFrame(walk12, tbaby_walk13); ai.ai_walk(0.02); }
    function tbaby_walk13() { th.nextFrame(walk13, tbaby_walk14); ai.ai_walk(0.02); }
    function tbaby_walk14() { th.nextFrame(walk14, tbaby_walk15); ai.ai_walk(0.02); }
    function tbaby_walk15() { th.nextFrame(walk15, tbaby_walk16); ai.ai_walk(0.02); }
    function tbaby_walk16() { th.nextFrame(walk16, tbaby_walk17); ai.ai_walk(0.02); }
    function tbaby_walk17() { th.nextFrame(walk17, tbaby_walk18); ai.ai_walk(0.02); }
    function tbaby_walk18() { th.nextFrame(walk18, tbaby_walk19); ai.ai_walk(0.02); }
    function tbaby_walk19() { th.nextFrame(walk19, tbaby_walk20); ai.ai_walk(0.02); }
    function tbaby_walk20() { th.nextFrame(walk20, tbaby_walk21); ai.ai_walk(0.02); }
    function tbaby_walk21() { th.nextFrame(walk21, tbaby_walk22); ai.ai_walk(0.02); }
    function tbaby_walk22() { th.nextFrame(walk22, tbaby_walk23); ai.ai_walk(0.02); }
    function tbaby_walk23() { th.nextFrame(walk23, tbaby_walk24); ai.ai_walk(0.02); }
    function tbaby_walk24() { th.nextFrame(walk24, tbaby_walk25); ai.ai_walk(0.02); }
    function tbaby_walk25() { th.nextFrame(walk25, tbaby_walk1); ai.ai_walk(0.02); }

    function tbaby_run1() { th.nextFrame(run1, tbaby_run2); fight.ai_face(); }
    function tbaby_run2() { th.nextFrame(run2, tbaby_run3); fight.ai_face(); }
    function tbaby_run3() { th.nextFrame(run3, tbaby_run4); fight.ai_face(); }
    function tbaby_run4() { th.nextFrame(run4, tbaby_run5); fight.ai_face(); }
    function tbaby_run5() { th.nextFrame(run5, tbaby_run6); fight.ai_face(); }
    function tbaby_run6() { th.nextFrame(run6, tbaby_run7); fight.ai_face(); }
    function tbaby_run7() { th.nextFrame(run7, tbaby_run8); fight.ai_face(); }
    function tbaby_run8() { th.nextFrame(run8, tbaby_run9); fight.ai_face(); }
    function tbaby_run9() { th.nextFrame(run9, tbaby_run10); fight.ai_face(); }
    function tbaby_run10() { th.nextFrame(run10, tbaby_run11); fight.ai_face(); }
    function tbaby_run11() { th.nextFrame(run11, tbaby_run12); ai.ai_run(0.02); }
    function tbaby_run12() { th.nextFrame(run12, tbaby_run13); ai.ai_run(0.02); }
    function tbaby_run13() { th.nextFrame(run13, tbaby_run14); ai.ai_run(0.02); }
    function tbaby_run14() { th.nextFrame(run14, tbaby_run15); ai.ai_run(0.02); }
    function tbaby_run15() { th.nextFrame(run15, tbaby_run16); ai.ai_run(0.02); }
    function tbaby_run16() { th.nextFrame(run16, tbaby_run17); ai.ai_run(0.02); }
    function tbaby_run17() { th.nextFrame(run17, tbaby_run18); ai.ai_run(0.02); }
    function tbaby_run18() { th.nextFrame(run18, tbaby_run19); ai.ai_run(0.02); }
    function tbaby_run19() { th.nextFrame(run19, tbaby_run20); ai.ai_run(0.02); }
    function tbaby_run20() { th.nextFrame(run20, tbaby_run21); ai.ai_run(0.02); }
    function tbaby_run21() { th.nextFrame(run21, tbaby_run22); ai.ai_run(0.02); }
    function tbaby_run22() { th.nextFrame(run22, tbaby_run23); ai.ai_run(0.02); }
    function tbaby_run23() { th.nextFrame(run23, tbaby_run24); ai.ai_run(0.02); }
    function tbaby_run24() { th.nextFrame(run24, tbaby_run25); ai.ai_run(0.02); }
    function tbaby_run25() { th.nextFrame(run25, tbaby_run1); ai.ai_run(0.02); }

    function tbaby_jump1() { th.nextFrame(jump1, tbaby_jump2); fight.ai_face(); }
    function tbaby_jump2() { th.nextFrame(jump2, tbaby_jump3); fight.ai_face(); }
    function tbaby_jump3() { th.nextFrame(jump3, tbaby_jump4); fight.ai_face(); }
    function tbaby_jump4() { th.nextFrame(jump4, tbaby_jump5); fight.ai_face(); }
    function tbaby_jump5() { th.nextFrame(jump5, tbaby_jump6);
        th.movetype = "bounce";
        touch = tar_jumpTouch;
        velocity = forward.times(6).plus(Qt.vector3d(0, 2, 0));
        velocity = velocity.plus(Qt.vector3d(0, Math.random() * 1.5, 0));
        onGround = false;
        cnt = 0;
    }
    function tbaby_jump6() { th.nextFrame(jump6, tbaby_fly1); }

    function tbaby_fly1() { th.nextFrame(fly1, tbaby_fly2); }
    function tbaby_fly2() { th.nextFrame(fly2, tbaby_fly3); }
    function tbaby_fly3() { th.nextFrame(fly3, tbaby_fly4); }
    function tbaby_fly4() { th.nextFrame(fly4, tbaby_fly1);
        cnt++;
        if (cnt === 4)
            tbaby_jump5();
    }

    function tbaby_die1() { th.nextFrame(exp, tbaby_die2); takedamage = Defs.damageNo; }
    function tbaby_die2() { th.nextFrame(exp, tbaby_run1);
        weapons.t_radiusDamage(self, self, 120, world);
        
        deathSound.play();

        const org = position.minus(velocity.normalized().times(0.08));
        weapons.becomeExplosion(org);
    }

    function tbaby_die() {
        tbaby_die1();
    }

    function tar_jumpTouch() {
        if (other.takedamage && other.classname !== root.classname) {
            if (velocity.length() > 4) {
                const ldmg = 10 + 10 * Math.random();
                weapons.t_damage(other, self, self, ldmg);
                hitSound.play();
            } else {
                landSound.play();
            }
        } else {
            landSound.play();
        }

        if (!checkBottom(Qt.vector3d(0, 0, 0))) {
            if (onGround) {
                touch = null;
                th.think = tbaby_run1;
                th.nextthink = time + 0.1;
            }
            return;
        }

        touch = null;
        th.think = tbaby_jump1;
        th.nextthink = time + 0.1;
    }

    function sightSound() {
        sightSoundFx.play();
    }
}
