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
    readonly property int attack9: 8
    readonly property int attack10: 9
    readonly property int attack11: 10
    readonly property int attack12: 11
    readonly property int attack13: 12
    readonly property int attack14: 13
    readonly property int attack15: 14
    readonly property int attack16: 15
    readonly property int attack17: 16
    readonly property int attack18: 17

    readonly property int death1: 18
    readonly property int death2: 19
    readonly property int death3: 20
    readonly property int death4: 21
    readonly property int death5: 22
    readonly property int death6: 23
    readonly property int death7: 24
    readonly property int death8: 25
    readonly property int death9: 26
    readonly property int death10: 27
    readonly property int death11: 28
    readonly property int death12: 29
    readonly property int death13: 30
    readonly property int death14: 31
    readonly property int death15: 32
    readonly property int death16: 33
    readonly property int death17: 34
    readonly property int death18: 35
    readonly property int death19: 36
    readonly property int death20: 37
    readonly property int death21: 38

    readonly property int swim1: 39
    readonly property int swim2: 40
    readonly property int swim3: 41
    readonly property int swim4: 42
    readonly property int swim5: 43
    readonly property int swim6: 44
    readonly property int swim7: 45
    readonly property int swim8: 46
    readonly property int swim9: 47
    readonly property int swim10: 48
    readonly property int swim11: 49
    readonly property int swim12: 50
    readonly property int swim13: 51
    readonly property int swim14: 52
    readonly property int swim15: 53
    readonly property int swim16: 54
    readonly property int swim17: 55
    readonly property int swim18: 56

    readonly property int pain1: 57
    readonly property int pain2: 58
    readonly property int pain3: 59
    readonly property int pain4: 60
    readonly property int pain5: 61
    readonly property int pain6: 62
    readonly property int pain7: 63
    readonly property int pain8: 64
    readonly property int pain9: 65

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.24, 0.16)
    
    classname: "monster_fish"
    health: 25
    max_health: 25

    th.movetype: "swim"

    th_stand: f_stand1
    th_walk: f_walk1
    th_run: f_run1
    th_melee: f_attack1
    th_pain: fish_pain
    th_die: f_death1

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/fish.mdl"
            skin.source: "qrc:/Assets/progs/skins/fish.png"
            frame: th.frame
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/fish/idle.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: biteSound
        ent: parent
        source: "qrc:/Assets/sounds/fish/bite.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: deathSound
        ent: parent
        source: "qrc:/Assets/sounds/fish/death.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        swimmonster_start();
    }

    function f_stand1() { th.nextFrame(swim1, f_stand2); ai.ai_stand(); }
    function f_stand2() { th.nextFrame(swim2, f_stand3); ai.ai_stand(); }
    function f_stand3() { th.nextFrame(swim3, f_stand4); ai.ai_stand(); }
    function f_stand4() { th.nextFrame(swim4, f_stand5); ai.ai_stand(); }
    function f_stand5() { th.nextFrame(swim5, f_stand6); ai.ai_stand(); }
    function f_stand6() { th.nextFrame(swim6, f_stand7); ai.ai_stand(); }
    function f_stand7() { th.nextFrame(swim7, f_stand8); ai.ai_stand(); }
    function f_stand8() { th.nextFrame(swim8, f_stand9); ai.ai_stand(); }
    function f_stand9() { th.nextFrame(swim9, f_stand10); ai.ai_stand(); }
    function f_stand10() { th.nextFrame(swim10, f_stand11); ai.ai_stand(); }
    function f_stand11() { th.nextFrame(swim11, f_stand12); ai.ai_stand(); }
    function f_stand12() { th.nextFrame(swim12, f_stand13); ai.ai_stand(); }
    function f_stand13() { th.nextFrame(swim13, f_stand14); ai.ai_stand(); }
    function f_stand14() { th.nextFrame(swim14, f_stand15); ai.ai_stand(); }
    function f_stand15() { th.nextFrame(swim15, f_stand16); ai.ai_stand(); }
    function f_stand16() { th.nextFrame(swim16, f_stand17); ai.ai_stand(); }
    function f_stand17() { th.nextFrame(swim17, f_stand18); ai.ai_stand(); }
    function f_stand18() { th.nextFrame(swim18, f_stand1); ai.ai_stand(); }

    function f_walk1() { th.nextFrame(swim1, f_walk2); ai.ai_walk(0.08); }
    function f_walk2() { th.nextFrame(swim2, f_walk3); ai.ai_walk(0.08); }
    function f_walk3() { th.nextFrame(swim3, f_walk4); ai.ai_walk(0.08); }
    function f_walk4() { th.nextFrame(swim4, f_walk5); ai.ai_walk(0.08); }
    function f_walk5() { th.nextFrame(swim5, f_walk6); ai.ai_walk(0.08); }
    function f_walk6() { th.nextFrame(swim6, f_walk7); ai.ai_walk(0.08); }
    function f_walk7() { th.nextFrame(swim7, f_walk8); ai.ai_walk(0.08); }
    function f_walk8() { th.nextFrame(swim8, f_walk9); ai.ai_walk(0.08); }
    function f_walk9() { th.nextFrame(swim9, f_walk10); ai.ai_walk(0.08); }
    function f_walk10() { th.nextFrame(swim10, f_walk11); ai.ai_walk(0.08); }
    function f_walk11() { th.nextFrame(swim11, f_walk12); ai.ai_walk(0.08); }
    function f_walk12() { th.nextFrame(swim12, f_walk13); ai.ai_walk(0.08); }
    function f_walk13() { th.nextFrame(swim13, f_walk14); ai.ai_walk(0.08); }
    function f_walk14() { th.nextFrame(swim14, f_walk15); ai.ai_walk(0.08); }
    function f_walk15() { th.nextFrame(swim15, f_walk16); ai.ai_walk(0.08); }
    function f_walk16() { th.nextFrame(swim16, f_walk17); ai.ai_walk(0.08); }
    function f_walk17() { th.nextFrame(swim17, f_walk18); ai.ai_walk(0.08); }
    function f_walk18() { th.nextFrame(swim18, f_walk1); ai.ai_walk(0.08); }

    function f_run1() { th.nextFrame(swim1, f_run2); 
        ai.ai_run(0.12);
        if (Math.random() < 0.5)
            idleSound.play();
    }
    function f_run2() { th.nextFrame(swim3, f_run3); ai.ai_run(0.12); }
    function f_run3() { th.nextFrame(swim5, f_run4); ai.ai_run(0.12); }
    function f_run4() { th.nextFrame(swim7, f_run5); ai.ai_run(0.12); }
    function f_run5() { th.nextFrame(swim9, f_run6); ai.ai_run(0.12); }
    function f_run6() { th.nextFrame(swim11, f_run7); ai.ai_run(0.12); }
    function f_run7() { th.nextFrame(swim13, f_run8); ai.ai_run(0.12); }
    function f_run8() { th.nextFrame(swim15, f_run9); ai.ai_run(0.12); }
    function f_run9() { th.nextFrame(swim17, f_run1); ai.ai_run(0.12); }

    function f_attack1() { th.nextFrame(attack1, f_attack2); fight.ai_charge(0.10); }
    function f_attack2() { th.nextFrame(attack2, f_attack3); fight.ai_charge(0.10); }
    function f_attack3() { th.nextFrame(attack3, f_attack4); fish_melee(); }
    function f_attack4() { th.nextFrame(attack4, f_attack5); fight.ai_charge(0.10); }
    function f_attack5() { th.nextFrame(attack5, f_attack6); fight.ai_charge(0.10); }
    function f_attack6() { th.nextFrame(attack6, f_attack7); fight.ai_charge(0.10); }
    function f_attack7() { th.nextFrame(attack7, f_attack8); fight.ai_charge(0.10); }
    function f_attack8() { th.nextFrame(attack8, f_attack9); fight.ai_charge(0.10); }
    function f_attack9() { th.nextFrame(attack9, f_attack10); fish_melee(); }
    function f_attack10() { th.nextFrame(attack10, f_attack11); fight.ai_charge(0.10); }
    function f_attack11() { th.nextFrame(attack11, f_attack12); fight.ai_charge(0.10); }
    function f_attack12() { th.nextFrame(attack12, f_attack13); fight.ai_charge(0.10); }
    function f_attack13() { th.nextFrame(attack13, f_attack14); fight.ai_charge(0.10); }
    function f_attack14() { th.nextFrame(attack14, f_attack15); fight.ai_charge(0.10); }
    function f_attack15() { th.nextFrame(attack15, f_attack16); fish_melee(); }
    function f_attack16() { th.nextFrame(attack16, f_attack17); fight.ai_charge(0.10); }
    function f_attack17() { th.nextFrame(attack17, f_attack18); fight.ai_charge(0.10); }
    function f_attack18() { th.nextFrame(attack18, f_run1); fight.ai_charge(0.10); }

    function f_death1() { th.nextFrame(death1, f_death2); deathSound.play();  }
    function f_death2() { th.nextFrame(death2, f_death3); }
    function f_death3() { th.nextFrame(death3, f_death4); }
    function f_death4() { th.nextFrame(death4, f_death5); }
    function f_death5() { th.nextFrame(death5, f_death6); }
    function f_death6() { th.nextFrame(death6, f_death7); }
    function f_death7() { th.nextFrame(death7, f_death8); }
    function f_death8() { th.nextFrame(death8, f_death9); }
    function f_death9() { th.nextFrame(death9, f_death10); }
    function f_death10() { th.nextFrame(death10, f_death11); }
    function f_death11() { th.nextFrame(death11, f_death12); }
    function f_death12() { th.nextFrame(death12, f_death13); }
    function f_death13() { th.nextFrame(death13, f_death14); }
    function f_death14() { th.nextFrame(death14, f_death15); }
    function f_death15() { th.nextFrame(death15, f_death16); }
    function f_death16() { th.nextFrame(death16, f_death17); }
    function f_death17() { th.nextFrame(death17, f_death18); }
    function f_death18() { th.nextFrame(death18, f_death19); }
    function f_death19() { th.nextFrame(death19, f_death20); }
    function f_death20() { th.nextFrame(death20, f_death21); }
    function f_death21() { th.nextFrame(death21, f_death21); solid = false; }

    function f_pain1() { th.nextFrame(pain1, f_pain2); }
    function f_pain2() { th.nextFrame(pain2, f_pain3); ai.ai_pain(0.06); }
    function f_pain3() { th.nextFrame(pain3, f_pain4); ai.ai_pain(0.06); }
    function f_pain4() { th.nextFrame(pain4, f_pain5); ai.ai_pain(0.06); }
    function f_pain5() { th.nextFrame(pain5, f_pain6); ai.ai_pain(0.06); }
    function f_pain6() { th.nextFrame(pain6, f_pain7); ai.ai_pain(0.06); }
    function f_pain7() { th.nextFrame(pain7, f_pain8); ai.ai_pain(0.06); }
    function f_pain8() { th.nextFrame(pain8, f_pain9); ai.ai_pain(0.06); }
    function f_pain9() { th.nextFrame(pain9, f_run1); ai.ai_pain(0.06); }

    function fish_melee() {
        if (!enemy)
            return;

        const delta = enemy.position.minus(position);
        if (delta.length() > 0.6)
            return;

        biteSound.play();
        const ldmg = (Math.random() + Math.random()) * 3;
        weapons.t_damage(enemy, self, self, ldmg);
    }

    function fish_pain(attacker, damage) {
        f_pain1();
    }

    function sightSound() {
        // empty
    }
}
