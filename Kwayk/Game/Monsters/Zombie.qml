import QtQuick
import QtQuick3D

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
    readonly property int stand10: 9
    readonly property int stand11: 10
    readonly property int stand12: 11
    readonly property int stand13: 12
    readonly property int stand14: 13
    readonly property int stand15: 14

    readonly property int walk1: 15
    readonly property int walk2: 16
    readonly property int walk3: 17
    readonly property int walk4: 18
    readonly property int walk5: 19
    readonly property int walk6: 20
    readonly property int walk7: 21
    readonly property int walk8: 22
    readonly property int walk9: 23
    readonly property int walk10: 24
    readonly property int walk11: 25
    readonly property int walk12: 26
    readonly property int walk13: 27
    readonly property int walk14: 28
    readonly property int walk15: 29
    readonly property int walk16: 30
    readonly property int walk17: 31
    readonly property int walk18: 32
    readonly property int walk19: 33

    readonly property int run1: 34
    readonly property int run2: 35
    readonly property int run3: 36
    readonly property int run4: 37
    readonly property int run5: 38
    readonly property int run6: 39
    readonly property int run7: 40
    readonly property int run8: 41
    readonly property int run9: 42
    readonly property int run10: 43
    readonly property int run11: 44
    readonly property int run12: 45
    readonly property int run13: 46
    readonly property int run14: 47
    readonly property int run15: 48
    readonly property int run16: 49
    readonly property int run17: 50
    readonly property int run18: 51

    readonly property int atta1: 52
    readonly property int atta2: 53
    readonly property int atta3: 54
    readonly property int atta4: 55
    readonly property int atta5: 56
    readonly property int atta6: 57
    readonly property int atta7: 58
    readonly property int atta8: 59
    readonly property int atta9: 60
    readonly property int atta10: 61
    readonly property int atta11: 62
    readonly property int atta12: 63
    readonly property int atta13: 64

    readonly property int attb1: 65
    readonly property int attb2: 66
    readonly property int attb3: 67
    readonly property int attb4: 68
    readonly property int attb5: 69
    readonly property int attb6: 70
    readonly property int attb7: 71
    readonly property int attb8: 72
    readonly property int attb9: 73
    readonly property int attb10: 74
    readonly property int attb11: 75
    readonly property int attb12: 76
    readonly property int attb13: 77
    readonly property int attb14: 78

    readonly property int attc1: 79
    readonly property int attc2: 80
    readonly property int attc3: 81
    readonly property int attc4: 82
    readonly property int attc5: 83
    readonly property int attc6: 84
    readonly property int attc7: 85
    readonly property int attc8: 86
    readonly property int attc9: 87
    readonly property int attc10: 88
    readonly property int attc11: 89
    readonly property int attc12: 90

    readonly property int paina1: 91
    readonly property int paina2: 92
    readonly property int paina3: 93
    readonly property int paina4: 94
    readonly property int paina5: 95
    readonly property int paina6: 96
    readonly property int paina7: 97
    readonly property int paina8: 98
    readonly property int paina9: 99
    readonly property int paina10: 100
    readonly property int paina11: 101
    readonly property int paina12: 102

    readonly property int painb1: 103
    readonly property int painb2: 104
    readonly property int painb3: 105
    readonly property int painb4: 106
    readonly property int painb5: 107
    readonly property int painb6: 108
    readonly property int painb7: 109
    readonly property int painb8: 110
    readonly property int painb9: 111
    readonly property int painb10: 112
    readonly property int painb11: 113
    readonly property int painb12: 114
    readonly property int painb13: 115
    readonly property int painb14: 116
    readonly property int painb15: 117
    readonly property int painb16: 118
    readonly property int painb17: 119
    readonly property int painb18: 120
    readonly property int painb19: 121
    readonly property int painb20: 122
    readonly property int painb21: 123
    readonly property int painb22: 124
    readonly property int painb23: 125
    readonly property int painb24: 126
    readonly property int painb25: 127
    readonly property int painb26: 128
    readonly property int painb27: 129
    readonly property int painb28: 130

    readonly property int painc1: 131
    readonly property int painc2: 132
    readonly property int painc3: 133
    readonly property int painc4: 134
    readonly property int painc5: 135
    readonly property int painc6: 136
    readonly property int painc7: 137
    readonly property int painc8: 138
    readonly property int painc9: 139
    readonly property int painc10: 140
    readonly property int painc11: 141
    readonly property int painc12: 142
    readonly property int painc13: 143
    readonly property int painc14: 144
    readonly property int painc15: 145
    readonly property int painc16: 146
    readonly property int painc17: 147
    readonly property int painc18: 148

    readonly property int paind1: 149
    readonly property int paind2: 150
    readonly property int paind3: 151
    readonly property int paind4: 152
    readonly property int paind5: 153
    readonly property int paind6: 154
    readonly property int paind7: 155
    readonly property int paind8: 156
    readonly property int paind9: 157
    readonly property int paind10: 158
    readonly property int paind11: 159
    readonly property int paind12: 160
    readonly property int paind13: 161

    readonly property int paine1: 162
    readonly property int paine2: 163
    readonly property int paine3: 164
    readonly property int paine4: 165
    readonly property int paine5: 166
    readonly property int paine6: 167
    readonly property int paine7: 168
    readonly property int paine8: 169
    readonly property int paine9: 170
    readonly property int paine10: 171
    readonly property int paine11: 172
    readonly property int paine12: 173
    readonly property int paine13: 174
    readonly property int paine14: 175
    readonly property int paine15: 176
    readonly property int paine16: 177
    readonly property int paine17: 178
    readonly property int paine18: 179
    readonly property int paine19: 180
    readonly property int paine20: 181
    readonly property int paine21: 182
    readonly property int paine22: 183
    readonly property int paine23: 184
    readonly property int paine24: 185
    readonly property int paine25: 186
    readonly property int paine26: 187
    readonly property int paine27: 188
    readonly property int paine28: 189
    readonly property int paine29: 190
    readonly property int paine30: 191

    property int inpain: 0

    readonly property var zomGibComponent: Qt.createComponent("../Flies/ZomGib.qml")

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_zombie"
    health: 60
    max_health: 60

    th_stand: zombie_stand1
    th_walk: zombie_walk1
    th_run: zombie_run1
    th_missile: zombie_missile
    th_pain: zombie_pain
    th_die: zombie_die

    modelComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/zombie.mdl"
            skin.source: "qrc:/Assets/progs/skins/zombie.png"
            frame: th.frame
        }
    }

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_zombie.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_zombie.png"
            active: false
        }
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_idle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: idle1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_idle1.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: idlew2Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/idle_w2.wav"
        attenuationType: Defs.attnStatic
    }

    Sound {
        id: shot1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_shot1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: gibSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_gib.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: painSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_pain.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: pain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_pain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: fallSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_fall.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: hitSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_hit.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: missSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_miss.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        walkmonster_start();
    }

    function zombie_stand1() { th.nextFrame(stand1, zombie_stand2); ai.ai_stand(); }
    function zombie_stand2() { th.nextFrame(stand2, zombie_stand3); ai.ai_stand();  }
    function zombie_stand3() { th.nextFrame(stand3, zombie_stand4); ai.ai_stand();  }
    function zombie_stand4() { th.nextFrame(stand4, zombie_stand5); ai.ai_stand();  }
    function zombie_stand5() { th.nextFrame(stand5, zombie_stand6); ai.ai_stand();  }
    function zombie_stand6() { th.nextFrame(stand6, zombie_stand7); ai.ai_stand();  }
    function zombie_stand7() { th.nextFrame(stand7, zombie_stand8); ai.ai_stand();  }
    function zombie_stand8() { th.nextFrame(stand8, zombie_stand9); ai.ai_stand();  }
    function zombie_stand9() { th.nextFrame(stand9, zombie_stand10); ai.ai_stand();  }
    function zombie_stand10() { th.nextFrame(stand10, zombie_stand11); ai.ai_stand();  }
    function zombie_stand11() { th.nextFrame(stand11, zombie_stand12); ai.ai_stand();  }
    function zombie_stand12() { th.nextFrame(stand12, zombie_stand13); ai.ai_stand();  }
    function zombie_stand13() { th.nextFrame(stand13, zombie_stand14); ai.ai_stand();  }
    function zombie_stand14() { th.nextFrame(stand14, zombie_stand15); ai.ai_stand();  }
    function zombie_stand15() { th.nextFrame(stand15, zombie_stand1); ai.ai_stand();  }

    function zombie_walk1() { th.nextFrame(walk1, zombie_walk2); ai.ai_walk(0); }
    function zombie_walk2() { th.nextFrame(walk2, zombie_walk3); ai.ai_walk(0.02); }
    function zombie_walk3() { th.nextFrame(walk3, zombie_walk4); ai.ai_walk(0.03);  }
    function zombie_walk4() { th.nextFrame(walk4, zombie_walk5); ai.ai_walk(0.02);  }
    function zombie_walk5() { th.nextFrame(walk5, zombie_walk6); ai.ai_walk(0.01);  }
    function zombie_walk6() { th.nextFrame(walk6, zombie_walk7); ai.ai_walk(0);  }
    function zombie_walk7() { th.nextFrame(walk7, zombie_walk8); ai.ai_walk(0);  }
    function zombie_walk8() { th.nextFrame(walk8, zombie_walk9); ai.ai_walk(0);  }
    function zombie_walk9() { th.nextFrame(walk9, zombie_walk10); ai.ai_walk(0);  }
    function zombie_walk10() { th.nextFrame(walk10, zombie_walk11); ai.ai_walk(0);  }
    function zombie_walk11() { th.nextFrame(walk11, zombie_walk12); ai.ai_walk(0.02);  }
    function zombie_walk12() { th.nextFrame(walk12, zombie_walk13); ai.ai_walk(0.02);  }
    function zombie_walk13() { th.nextFrame(walk13, zombie_walk14); ai.ai_walk(0.01);  }
    function zombie_walk14() { th.nextFrame(walk14, zombie_walk15); ai.ai_walk(0);  }
    function zombie_walk15() { th.nextFrame(walk15, zombie_walk16); ai.ai_walk(0);  }
    function zombie_walk16() { th.nextFrame(walk16, zombie_walk17); ai.ai_walk(0);  }
    function zombie_walk17() { th.nextFrame(walk17, zombie_walk18); ai.ai_walk(0);  }
    function zombie_walk18() { th.nextFrame(walk18, zombie_walk19); ai.ai_walk(0);  }
    function zombie_walk19() { th.nextFrame(walk19, zombie_walk1);
        ai.ai_walk(0);
        if (Math.random() < 0.2)
            idleSound.play();
    }

    function zombie_run1() { th.nextFrame(run1, zombie_run2); ai.ai_run(0.01); inpain = 0; }
    function zombie_run2() { th.nextFrame(run2, zombie_run3); ai.ai_run(0.01); }
    function zombie_run3() { th.nextFrame(run3, zombie_run4); ai.ai_run(0); }
    function zombie_run4() { th.nextFrame(run4, zombie_run5); ai.ai_run(0.01); }
    function zombie_run5() { th.nextFrame(run5, zombie_run6); ai.ai_run(0.02); }
    function zombie_run6() { th.nextFrame(run6, zombie_run7); ai.ai_run(0.03); }
    function zombie_run7() { th.nextFrame(run7, zombie_run8); ai.ai_run(0.04); }
    function zombie_run8() { th.nextFrame(run8, zombie_run9); ai.ai_run(0.04); }
    function zombie_run9() { th.nextFrame(run9, zombie_run10); ai.ai_run(0.02); }
    function zombie_run10() { th.nextFrame(run10, zombie_run11); ai.ai_run(0); }
    function zombie_run11() { th.nextFrame(run11, zombie_run12); ai.ai_run(0); }
    function zombie_run12() { th.nextFrame(run12, zombie_run13); ai.ai_run(0); }
    function zombie_run13() { th.nextFrame(run13, zombie_run14); ai.ai_run(0.02); }
    function zombie_run14() { th.nextFrame(run14, zombie_run15); ai.ai_run(0.04); }
    function zombie_run15() { th.nextFrame(run15, zombie_run16); ai.ai_run(0.06); }
    function zombie_run16() { th.nextFrame(run16, zombie_run17); ai.ai_run(0.07); }
    function zombie_run17() { th.nextFrame(run17, zombie_run18); ai.ai_run(0.03); }
    function zombie_run18() { th.nextFrame(run18, zombie_run1);
        ai.ai_run(0.08);
        if (Math.random() < 0.2)
            idleSound.play();
        else if (Math.random() > 0.8)
            idle1Sound.play();
    }

    function zombieFireGrenade(st) {
        shot1Sound.play();

        const org = position.plus(forward.times(st.x)).plus(right.times(z)).plus(up.times(y - 0.24))

        let velocity = enemy.position.minus(position).normalized();
        velocity = velocity.times(6);
        velocity.y = 2;

        const settings = {
            position: position,
            velocity: velocity,
            avelocity: Qt.vector3d(30, 10, 20),
            owner: self
        }

        zomGibComponent.createObject(world, settings);
    }

    function zombie_atta1() { th.nextFrame(atta1, zombie_atta2); fight.ai_face(); }
    function zombie_atta2() { th.nextFrame(atta2, zombie_atta3); fight.ai_face(); }
    function zombie_atta3() { th.nextFrame(atta3, zombie_atta4); fight.ai_face(); }
    function zombie_atta4() { th.nextFrame(atta4, zombie_atta5); fight.ai_face(); }
    function zombie_atta5() { th.nextFrame(atta5, zombie_atta6); fight.ai_face(); }
    function zombie_atta6() { th.nextFrame(atta6, zombie_atta7); fight.ai_face(); }
    function zombie_atta7() { th.nextFrame(atta7, zombie_atta8); fight.ai_face(); }
    function zombie_atta8() { th.nextFrame(atta8, zombie_atta9); fight.ai_face(); }
    function zombie_atta9() { th.nextFrame(atta9, zombie_atta10); fight.ai_face(); }
    function zombie_atta10() { th.nextFrame(atta10, zombie_atta11); fight.ai_face(); }
    function zombie_atta11() { th.nextFrame(atta11, zombie_atta12); fight.ai_face(); }
    function zombie_atta12() { th.nextFrame(atta12, zombie_atta13); fight.ai_face(); }
    function zombie_atta13() { th.nextFrame(atta13, zombie_run1); fight.ai_face(); zombieFireGrenade(Qt.vector3d(-0.10, 0.30, 0.22)); }

    function zombie_attb1() { th.nextFrame(attb1, zombie_attb2); fight.ai_face(); }
    function zombie_attb2() { th.nextFrame(attb2, zombie_attb3); fight.ai_face(); }
    function zombie_attb3() { th.nextFrame(attb3, zombie_attb4); fight.ai_face(); }
    function zombie_attb4() { th.nextFrame(attb4, zombie_attb5); fight.ai_face(); }
    function zombie_attb5() { th.nextFrame(attb5, zombie_attb6); fight.ai_face(); }
    function zombie_attb6() { th.nextFrame(attb6, zombie_attb7); fight.ai_face(); }
    function zombie_attb7() { th.nextFrame(attb7, zombie_attb8); fight.ai_face(); }
    function zombie_attb8() { th.nextFrame(attb8, zombie_attb9); fight.ai_face(); }
    function zombie_attb9() { th.nextFrame(attb9, zombie_attb10); fight.ai_face(); }
    function zombie_attb10() { th.nextFrame(attb10, zombie_attb11); fight.ai_face(); }
    function zombie_attb11() { th.nextFrame(attb11, zombie_attb12); fight.ai_face(); }
    function zombie_attb12() { th.nextFrame(attb12, zombie_attb13); fight.ai_face(); }
    function zombie_attb13() { th.nextFrame(attb13, zombie_attb14); fight.ai_face(); }
    function zombie_attb14() { th.nextFrame(attb14, zombie_run1); fight.ai_face(); zombieFireGrenade(Qt.vector3d(-0.10, 0.29, 0.24)); }

    function zombie_attc1() { th.nextFrame(attc1, zombie_attc2); fight.ai_face(); }
    function zombie_attc2() { th.nextFrame(attc2, zombie_attc3); fight.ai_face(); }
    function zombie_attc3() { th.nextFrame(attc3, zombie_attc4); fight.ai_face(); }
    function zombie_attc4() { th.nextFrame(attc4, zombie_attc5); fight.ai_face(); }
    function zombie_attc5() { th.nextFrame(attc5, zombie_attc6); fight.ai_face(); }
    function zombie_attc6() { th.nextFrame(attc6, zombie_attc7); fight.ai_face(); }
    function zombie_attc7() { th.nextFrame(attc7, zombie_attc8); fight.ai_face(); }
    function zombie_attc8() { th.nextFrame(attc8, zombie_attc9); fight.ai_face(); }
    function zombie_attc9() { th.nextFrame(attc9, zombie_attc10); fight.ai_face(); }
    function zombie_attc10() { th.nextFrame(attc10, zombie_attc11); fight.ai_face(); }
    function zombie_attc11() { th.nextFrame(attc11, zombie_attc12); fight.ai_face(); }
    function zombie_attc12() { th.nextFrame(attc12, zombie_run1); fight.ai_face(); zombieFireGrenade(Qt.vector3d(-0.10, 0.29, 0.19)); }

    function zombie_missile() {
        const r = Math.random();

        if (r < 0.3)
            zombie_atta1();
        else if (r < 0.6)
            zombie_attb1();
        else
            zombie_attc1();
    }

    function zombie_paina1() { th.nextFrame(paina1, zombie_paina2); painSound.play(); }
    function zombie_paina2() { th.nextFrame(paina2, zombie_paina3); ai.ai_painforward(0.03); }
    function zombie_paina3() { th.nextFrame(paina3, zombie_paina4); ai.ai_painforward(0.01); }
    function zombie_paina4() { th.nextFrame(paina4, zombie_paina5); ai.ai_pain(0.01); }
    function zombie_paina5() { th.nextFrame(paina5, zombie_paina6); ai.ai_pain(0.03);}
    function zombie_paina6() { th.nextFrame(paina6, zombie_paina7); ai.ai_pain(0.01);}
    function zombie_paina7() { th.nextFrame(paina7, zombie_paina8); }
    function zombie_paina8() { th.nextFrame(paina8, zombie_paina9); }
    function zombie_paina9() { th.nextFrame(paina9, zombie_paina10); }
    function zombie_paina10() { th.nextFrame(paina10, zombie_paina11); }
    function zombie_paina11() { th.nextFrame(paina11, zombie_paina12); }
    function zombie_paina12() { th.nextFrame(paina12, zombie_run1); }

    function zombie_painb1() { th.nextFrame(painb1, zombie_painb2); pain1Sound.play(); }
    function zombie_painb2() { th.nextFrame(painb2, zombie_painb3); ai.ai_pain(0.02); }
    function zombie_painb3() { th.nextFrame(painb3, zombie_painb4); ai.ai_pain(0.08); }
    function zombie_painb4() { th.nextFrame(painb4, zombie_painb5); ai.ai_pain(0.06); }
    function zombie_painb5() { th.nextFrame(painb5, zombie_painb6); ai.ai_pain(0.02); }
    function zombie_painb6() { th.nextFrame(painb6, zombie_painb7); }
    function zombie_painb7() { th.nextFrame(painb7, zombie_painb8); }
    function zombie_painb8() { th.nextFrame(painb8, zombie_painb9); }
    function zombie_painb9() { th.nextFrame(painb9, zombie_painb10); fallSound.play(); }
    function zombie_painb10() { th.nextFrame(painb10, zombie_painb11); }
    function zombie_painb11() { th.nextFrame(painb11, zombie_painb12); }
    function zombie_painb12() { th.nextFrame(painb12, zombie_painb13); }
    function zombie_painb13() { th.nextFrame(painb13, zombie_painb14); }
    function zombie_painb14() { th.nextFrame(painb14, zombie_painb15); }
    function zombie_painb15() { th.nextFrame(painb15, zombie_painb16); }
    function zombie_painb16() { th.nextFrame(painb16, zombie_painb17); }
    function zombie_painb17() { th.nextFrame(painb17, zombie_painb18); }
    function zombie_painb18() { th.nextFrame(painb18, zombie_painb19); }
    function zombie_painb19() { th.nextFrame(painb19, zombie_painb20); }
    function zombie_painb20() { th.nextFrame(painb20, zombie_painb21); }
    function zombie_painb21() { th.nextFrame(painb21, zombie_painb22); }
    function zombie_painb22() { th.nextFrame(painb22, zombie_painb23); }
    function zombie_painb23() { th.nextFrame(painb23, zombie_painb24); }
    function zombie_painb24() { th.nextFrame(painb24, zombie_painb25); }
    function zombie_painb25() { th.nextFrame(painb25, zombie_painb26); ai.ai_painforward(0.01); }
    function zombie_painb26() { th.nextFrame(painb26, zombie_painb27); }
    function zombie_painb27() { th.nextFrame(painb27, zombie_painb28); }
    function zombie_painb28() { th.nextFrame(painb28, zombie_run1); }

    function zombie_painc1() { th.nextFrame(painc1, zombie_painc2); pain1Sound.play(); }
    function zombie_painc2() { th.nextFrame(painc2, zombie_painc3); }
    function zombie_painc3() { th.nextFrame(painc3, zombie_painc4); ai.ai_pain(0.03); }
    function zombie_painc4() { th.nextFrame(painc4, zombie_painc5); ai.ai_pain(0.01); }
    function zombie_painc5() { th.nextFrame(painc5, zombie_painc6); }
    function zombie_painc6() { th.nextFrame(painc6, zombie_painc7); }
    function zombie_painc7() { th.nextFrame(painc7, zombie_painc8); }
    function zombie_painc8() { th.nextFrame(painc8, zombie_painc9); }
    function zombie_painc9() { th.nextFrame(painc9, zombie_painc10); }
    function zombie_painc10() { th.nextFrame(painc10, zombie_painc11); }
    function zombie_painc11() { th.nextFrame(painc11, zombie_painc12); ai.ai_painforward(0.01); }
    function zombie_painc12() { th.nextFrame(painc12, zombie_painc13); ai.ai_painforward(0.01); }
    function zombie_painc13() { th.nextFrame(painc13, zombie_painc14); }
    function zombie_painc14() { th.nextFrame(painc14, zombie_painc15); }
    function zombie_painc15() { th.nextFrame(painc15, zombie_painc16); }
    function zombie_painc16() { th.nextFrame(painc16, zombie_painc17); }
    function zombie_painc17() { th.nextFrame(painc17, zombie_painc18); }
    function zombie_painc18() { th.nextFrame(painc18, zombie_run1); }

    function zombie_paind1() { th.nextFrame(paind1, zombie_paind2); painSound.play();}
    function zombie_paind2() { th.nextFrame(paind2, zombie_paind3); }
    function zombie_paind3() { th.nextFrame(paind3, zombie_paind4); }
    function zombie_paind4() { th.nextFrame(paind4, zombie_paind5); }
    function zombie_paind5() { th.nextFrame(paind5, zombie_paind6); }
    function zombie_paind6() { th.nextFrame(paind6, zombie_paind7); }
    function zombie_paind7() { th.nextFrame(paind7, zombie_paind8); }
    function zombie_paind8() { th.nextFrame(paind8, zombie_paind9); }
    function zombie_paind9() { th.nextFrame(paind9, zombie_paind10); ai.ai_pain(0.01); }
    function zombie_paind10() { th.nextFrame(paind10, zombie_paind11); }
    function zombie_paind11() { th.nextFrame(paind11, zombie_paind12); }
    function zombie_paind12() { th.nextFrame(paind12, zombie_paind13); }
    function zombie_paind13() { th.nextFrame(paind13, zombie_run1); }

    function zombie_paine1() { th.nextFrame(paine1, zombie_paine2); painSound.play(); health = 60; }
    function zombie_paine2() { th.nextFrame(paine2, zombie_paine3); ai.ai_pain(0.08); }
    function zombie_paine3() { th.nextFrame(paine3, zombie_paine4); ai.ai_pain(0.05);}
    function zombie_paine4() { th.nextFrame(paine4, zombie_paine5); ai.ai_pain(0.03);}
    function zombie_paine5() { th.nextFrame(paine5, zombie_paine6); ai.ai_pain(0.01);}
    function zombie_paine6() { th.nextFrame(paine6, zombie_paine7); ai.ai_pain(0.02);}
    function zombie_paine7() { th.nextFrame(paine7, zombie_paine8); ai.ai_pain(0.01);}
    function zombie_paine8() { th.nextFrame(paine8, zombie_paine9); ai.ai_pain(0.01);}
    function zombie_paine9() { th.nextFrame(paine9, zombie_paine10); ai.ai_pain(0.02);}
    function zombie_paine10() { th.nextFrame(paine10, zombie_paine11); fallSound.play(); walkerDead(true); }
    function zombie_paine11() { th.nextFrame(paine11, zombie_paine12); th.nextthink = th.nextthink + 5; health = 60; }
    function zombie_paine12() { th.nextFrame(paine12, zombie_paine13);
        health = 60;
        idleSound.play();
        walkerDead(false);
        if (!walkmove(0, 0)) {
            th.think = zombie_paine11;
            walkerDead(true);
        }
    }
    function zombie_paine13() { th.nextFrame(paine13, zombie_paine14); }
    function zombie_paine14() { th.nextFrame(paine14, zombie_paine15); }
    function zombie_paine15() { th.nextFrame(paine15, zombie_paine16); }
    function zombie_paine16() { th.nextFrame(paine16, zombie_paine17); }
    function zombie_paine17() { th.nextFrame(paine17, zombie_paine18); }
    function zombie_paine18() { th.nextFrame(paine18, zombie_paine19); }
    function zombie_paine19() { th.nextFrame(paine19, zombie_paine20); }
    function zombie_paine20() { th.nextFrame(paine20, zombie_paine21); }
    function zombie_paine21() { th.nextFrame(paine21, zombie_paine22); }
    function zombie_paine22() { th.nextFrame(paine22, zombie_paine23); }
    function zombie_paine23() { th.nextFrame(paine23, zombie_paine24); }
    function zombie_paine24() { th.nextFrame(paine24, zombie_paine25); }
    function zombie_paine25() { th.nextFrame(paine25, zombie_paine26); }
    function zombie_paine26() { th.nextFrame(paine26, zombie_paine27); ai.ai_painforward(0.05); }
    function zombie_paine27() { th.nextFrame(paine27, zombie_paine28); ai.ai_painforward(0.03); }
    function zombie_paine28() { th.nextFrame(paine28, zombie_paine29); ai.ai_painforward(0.01); }
    function zombie_paine29() { th.nextFrame(paine29, zombie_paine30); ai.ai_pain(0.01); }
    function zombie_paine30() { th.nextFrame(paine30, zombie_run1); }

    function zombie_die() {
        gibSound.play();
        throwHead(health);
        throwGib("gib1", health);
        throwGib("gib2", health);
        throwGib("gib3", health);
    }

    function zombie_pain(attacker, damage) {
        health = 60;

        if (damage < 9)
            return;

        if (inpain === 2)
            return;

        if (damage >= 25) {
            inpain = 2;
            zombie_paine1();
            return;
        }

        if (inpain) {
            pain_finished = time + 3;
            return;
        }

        if (pain_finished > time) {
            inpain = 2;
            zombie_paine1();
            return;
        }

        inpain = 1;

        const r = Math.random();
        if (r < 0.25)
            zombie_paina1();
        else if (r < 0.5)
            zombie_painb1();
        else if (r < 0.75)
            zombie_painc1();
        else
            zombie_paind1();
    }

    function sightSound() {
        idleSound.play();
    }
}
