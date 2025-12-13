import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.Particles3D

import Backend

Entity {
    id: root

    property string name: ""
    property string displayName: ""

    readonly property var world: root
    readonly property alias lightStyleTexture: lightStyleTexture
    readonly property alias lightStyleTextureData: lightStyleTextureData

    property bool lightmapEnabled: vars.r_colorlightmaps.value !== 0

    property int worldtype: 0

    property var damage_attacker: null // set by T_Damage
    property var sight_entity: null
    property real sight_entity_time: 0

    property int total_secrets: 0
    property int total_monsters: 0

    property int found_secrets: 0
    property int killed_monsters: 0

    property real completed_time: 0

    property int intermission_running: 0
    property real intermission_exittime: 0

    Texture {
        id: lightStyleTexture
        textureData: LightStyleTexture {
            id: lightStyleTextureData
        }
    }

    function lightstyle(style, val) {
        lightStyleTextureData.styles[style] = val;
    }

    Component.onCompleted: {
        lightstyle(0, "m");
        lightstyle(1, "mmnmmommommnonmmonqnmmo");
        lightstyle(2, "abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba");
        lightstyle(3, "mmmmmaaaaammmmmaaaaaabcdefgabcdefg");
        lightstyle(4, "mamamamamama");
        lightstyle(5, "jklmnopqrstuvwxyzyxwvutsrqponmlkj");
        lightstyle(6, "nmonqnmomnmomomno");
        lightstyle(7, "mmmaaaabcdefgmmmmaaaammmaamm");
        lightstyle(8, "mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa");
        lightstyle(9, "aaaaaaaazzzzzzzz");
        lightstyle(10, "mmamammmmammamamaaamammma");
        lightstyle(11, "abcdefghijklmnopqrrqponmlkjihgfedcba");
        lightstyle(63, "a");
    }

    onIntermission_runningChanged: {
        if (intermission_running === 1)
            completed_time = time;
    }
}
