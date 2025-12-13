import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core

Entity {
    id: root

    Sound {
        ent: parent
        volume: 0.5
        attenuationType: Defs.attnStatic
        source: "qrc:/Assets/sounds/ambience/fl_hum1.wav"
        loops: SpatialSound.Infinite
        autoPlay: true
    }
}
