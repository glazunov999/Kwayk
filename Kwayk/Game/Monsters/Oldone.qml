import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game

Monster {
    id: root

    readonly property int old1: 0
    readonly property int old2: 1
    readonly property int old3: 2
    readonly property int old4: 3
    readonly property int old5: 4
    readonly property int old6: 5
    readonly property int old7: 6
    readonly property int old8: 7
    readonly property int old9: 8
    readonly property int old10: 9
    readonly property int old11: 10
    readonly property int old12: 11
    readonly property int old13: 12
    readonly property int old14: 13
    readonly property int old15: 14
    readonly property int old16: 15
    readonly property int old17: 16
    readonly property int old18: 17
    readonly property int old19: 18
    readonly property int old20: 19
    readonly property int old21: 20
    readonly property int old22: 21
    readonly property int old23: 22
    readonly property int old24: 23
    readonly property int old25: 24
    readonly property int old26: 25
    readonly property int old27: 26
    readonly property int old28: 27
    readonly property int old29: 28
    readonly property int old30: 29
    readonly property int old31: 30
    readonly property int old32: 31
    readonly property int old33: 32
    readonly property int old34: 33
    readonly property int old35: 34
    readonly property int old36: 35
    readonly property int old37: 36
    readonly property int old38: 37
    readonly property int old39: 38
    readonly property int old40: 39
    readonly property int old41: 40
    readonly property int old42: 41
    readonly property int old43: 42
    readonly property int old44: 43
    readonly property int old45: 44
    readonly property int old46: 45

    readonly property int shake1: 46
    readonly property int shake2: 47
    readonly property int shake3: 48
    readonly property int shake4: 49
    readonly property int shake5: 50
    readonly property int shake6: 51
    readonly property int shake7: 52
    readonly property int shake8: 53
    readonly property int shake9: 54
    readonly property int shake10: 55
    readonly property int shake11: 56
    readonly property int shake12: 57
    readonly property int shake13: 58
    readonly property int shake14: 59
    readonly property int shake15: 60
    readonly property int shake16: 61
    readonly property int shake17: 62
    readonly property int shake18: 63
    readonly property int shake19: 64
    readonly property int shake20: 65

    // Monster properties
    mins: Qt.vector3d(-1.60, -0.24, -1.28)
    maxs: Qt.vector3d(1.60, 2.56, 1.28)
    
    classname: "monster_oldone"
    health: 40000  // kill by telefrag only
    max_health: 40000
    
    takedamage: Defs.damageYes
    
    th_stand: old_idle1
    th_walk: old_idle1
    th_run: old_idle1
    th_pain: nopain
    th_die: finale_1
    
    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/oldone.mdl"
            skin.source: "qrc:/Assets/progs/skins/oldone.png"
            frame: th.frame
        }
    }

    Component.onCompleted: {
        th.nextthink = time + 0.1;
        th.think = old_idle1;
    }

    function old_idle1() { th.nextFrame(old1, old_idle2); }
    function old_idle2() { th.nextFrame(old2, old_idle3); }
    function old_idle3() { th.nextFrame(old3, old_idle4); }
    function old_idle4() { th.nextFrame(old4, old_idle5); }
    function old_idle5() { th.nextFrame(old5, old_idle6); }
    function old_idle6() { th.nextFrame(old6, old_idle7); }
    function old_idle7() { th.nextFrame(old7, old_idle8); }
    function old_idle8() { th.nextFrame(old8, old_idle9); }
    function old_idle9() { th.nextFrame(old9, old_idle10); }
    function old_idle10() { th.nextFrame(old10, old_idle11); }
    function old_idle11() { th.nextFrame(old11, old_idle12); }
    function old_idle12() { th.nextFrame(old12, old_idle13); }
    function old_idle13() { th.nextFrame(old13, old_idle14); }
    function old_idle14() { th.nextFrame(old14, old_idle15); }
    function old_idle15() { th.nextFrame(old15, old_idle16); }
    function old_idle16() { th.nextFrame(old16, old_idle17); }
    function old_idle17() { th.nextFrame(old17, old_idle18); }
    function old_idle18() { th.nextFrame(old18, old_idle19); }
    function old_idle19() { th.nextFrame(old19, old_idle20); }
    function old_idle20() { th.nextFrame(old20, old_idle21); }
    function old_idle21() { th.nextFrame(old21, old_idle22); }
    function old_idle22() { th.nextFrame(old22, old_idle23); }
    function old_idle23() { th.nextFrame(old23, old_idle24); }
    function old_idle24() { th.nextFrame(old24, old_idle25); }
    function old_idle25() { th.nextFrame(old25, old_idle26); }
    function old_idle26() { th.nextFrame(old26, old_idle27); }
    function old_idle27() { th.nextFrame(old27, old_idle28); }
    function old_idle28() { th.nextFrame(old28, old_idle29); }
    function old_idle29() { th.nextFrame(old29, old_idle30); }
    function old_idle30() { th.nextFrame(old30, old_idle31); }
    function old_idle31() { th.nextFrame(old31, old_idle32); }
    function old_idle32() { th.nextFrame(old32, old_idle33); }
    function old_idle33() { th.nextFrame(old33, old_idle34); }
    function old_idle34() { th.nextFrame(old34, old_idle35); }
    function old_idle35() { th.nextFrame(old35, old_idle36); }
    function old_idle36() { th.nextFrame(old36, old_idle37); }
    function old_idle37() { th.nextFrame(old37, old_idle38); }
    function old_idle38() { th.nextFrame(old38, old_idle39); }
    function old_idle39() { th.nextFrame(old39, old_idle40); }
    function old_idle40() { th.nextFrame(old40, old_idle41); }
    function old_idle41() { th.nextFrame(old41, old_idle42); }
    function old_idle42() { th.nextFrame(old42, old_idle43); }
    function old_idle43() { th.nextFrame(old43, old_idle44); }
    function old_idle44() { th.nextFrame(old44, old_idle45); }
    function old_idle45() { th.nextFrame(old45, old_idle46); }
    function old_idle46() { th.nextFrame(old46, old_idle1); }

    function old_thrash1() { th.nextFrame(shake1, old_thrash2); lightstyle(0, "m"); }
    function old_thrash2() { th.nextFrame(shake2, old_thrash3); lightstyle(0, "k"); }
    function old_thrash3() { th.nextFrame(shake3, old_thrash4); lightstyle(0, "k"); }
    function old_thrash4() { th.nextFrame(shake4, old_thrash5); lightstyle(0, "i"); }
    function old_thrash5() { th.nextFrame(shake5, old_thrash6); lightstyle(0, "g"); }
    function old_thrash6() { th.nextFrame(shake6, old_thrash7); lightstyle(0, "e"); }
    function old_thrash7() { th.nextFrame(shake7, old_thrash8); lightstyle(0, "c"); }
    function old_thrash8() { th.nextFrame(shake8, old_thrash9); lightstyle(0, "a"); }
    function old_thrash9() { th.nextFrame(shake9, old_thrash10); lightstyle(0, "c"); }
    function old_thrash10() { th.nextFrame(shake10, old_thrash11); lightstyle(0, "e"); }
    function old_thrash11() { th.nextFrame(shake11, old_thrash12); lightstyle(0, "g"); }
    function old_thrash12() { th.nextFrame(shake12, old_thrash13); lightstyle(0, "i"); }
    function old_thrash13() { th.nextFrame(shake13, old_thrash14); lightstyle(0, "k"); }
    function old_thrash14() { th.nextFrame(shake14, old_thrash15); lightstyle(0, "m"); }
    function old_thrash15() { th.nextFrame(shake15, old_thrash16);
        lightstyle(0, "m");
        cnt++;
        if (cnt !== 3) {
            th.think = old_thrash1;
        }
    }
    function old_thrash16() { th.nextFrame(shake16, old_thrash17); lightstyle(0, "g"); }
    function old_thrash17() { th.nextFrame(shake17, old_thrash18); lightstyle(0, "c"); }
    function old_thrash18() { th.nextFrame(shake18, old_thrash19); lightstyle(0, "b"); }
    function old_thrash19() { th.nextFrame(shake19, old_thrash20); lightstyle(0, "a"); }
    function old_thrash20() { th.nextFrame(shake20, old_thrash20); finale_4(); }

    // Finale sequence functions
    function finale_1() {
        // TODO
    }

    function finale_2() {
        // TODO
    }

    function finale_3() {
        // TODO
    }

    function finale_4() {
        // TODO
    }

    // Pain function - Oldone doesn't take normal damage
    function nopain(attacker, damage) {
        health = 40000;
    }
}
