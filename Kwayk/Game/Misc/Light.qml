import QtQuick

import Kwayk.Game

Entity {
    id: root

    readonly property int startOff: 1

    property int style: 0

    use: light_use

    Component.onCompleted: {
        if (style >= 32) {
            if (spawnflags & startOff)
                lightstyle(style, "a");
            else
                lightstyle(style, "m");
        }
    }

    function light_use() {
        if (spawnflags & startOff) {
            lightstyle(style, "m");
            spawnflags = spawnflags - startOff;
        } else {
            lightstyle(style, "a");
            spawnflags = spawnflags + startOff;
        }
    }
}
