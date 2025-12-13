import QtQuick
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core

Light {
    id: root

    readonly property int startOff: 1

    property int style: 0

    use: light_use

    Sound {
        ent: parent
        volume: 0.5
        attenuationType: Defs.attnStatic
        source: "qrc:/Assets/sounds/ambience/fl_hum1.wav"
        loops: SpatialSound.Infinite
        autoPlay: true
    }
}
