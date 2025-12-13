import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core

Entity {
    id: root

    Sound {
        ent: parent
        volume: 1.0
        attenuationType: Defs.attnStatic
        source: "qrc:/Assets/sounds/ambience/buzz1.wav"
        loops: SpatialSound.Infinite
        autoPlay: true
    }
}
