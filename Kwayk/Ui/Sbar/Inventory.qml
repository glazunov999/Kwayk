import QtQuick

import Kwayk.Game as G

Item {
    id: root

    property int items: 0

    Image {
        id: key1
        x: 284
        y: 136
        source: "qrc:/Assets/images/SB_KEY1.png"
        visible: items & G.Defs.itKey1
    }

    Image {
        id: key2
        x: 268
        y: 136
        source: "qrc:/Assets/images/SB_KEY2.png"
        visible: items & G.Defs.itKey2
    }

    Image {
        id: sigil1
        x: 256 - (8 * 3)
        y: 136
        source: "qrc:/Assets/images/SB_SIGIL1.png"
        visible: items & G.Defs.itSigil1
    }

    Image {
        id: sigil2
        x: 256 - (8 * 2)
        y: 136
        source: "qrc:/Assets/images/SB_SIGIL2.png"
        visible: items & G.Defs.itSigil2
    }

    Image {
        id: sigil3
        x: 256 - (8 * 1)
        y: 136
        source: "qrc:/Assets/images/SB_SIGIL3.png"
        visible: items & G.Defs.itSigil3
    }

    Image {
        id: sigil4
        x: 256 - (8 * 0)
        y: 136
        source: "qrc:/Assets/images/SB_SIGIL4.png"
        visible: items & G.Defs.itSigil4
    }
}
