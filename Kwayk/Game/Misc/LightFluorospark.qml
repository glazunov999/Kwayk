import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Core
import Kwayk.Game

Entity {
    id: root

    Sound {
        ent: parent
        volume: 0.5
        attenuationType: Defs.attnStatic
        source: "qrc:/Assets/sounds/ambience/buzz1.wav"
        loops: SpatialSound.Infinite
        autoPlay: true
    }
}
