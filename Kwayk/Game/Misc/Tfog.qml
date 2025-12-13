import QtQuick

import Kwayk.Game
import Kwayk.Core

Entity {
    id: root

    readonly property var teles: [tele1, tele2, tele3, tele4, tele5]

    Sound {
        id: tele1
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/misc/r_tele1.wav"
    }

    Sound {
        id: tele2
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/misc/r_tele2.wav"
    }

    Sound {
        id: tele3
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/misc/r_tele3.wav"
    }

    Sound {
        id: tele4
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/misc/r_tele4.wav"
    }

    Sound {
        id: tele5
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/misc/r_tele5.wav"
    }

    function play_teleport() {
        const v = Math.floor(Math.random() * 5);
        teles[v].play();
    }

    Component.onCompleted: {
        th.nextthink = time + 0.2;
        th.think = play_teleport;
    }
}
