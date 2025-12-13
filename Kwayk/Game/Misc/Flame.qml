import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core

Entity {
    id: root

    Alias {
        mdl.source: "qrc:/Assets/progs/flame.mdl"
        skin.source: "qrc:/Assets/progs/skins/flame.png"
        interpolate: false
        castsShadows: false
    }

    Sound {
        ent: parent
        source: "qrc:/Assets/sounds/ambience/fire1.wav"
        attenuationType: Defs.attnStatic
        volume: 0.5
        autoPlay: true
        loops: SpatialSound.Infinite
    }
}
