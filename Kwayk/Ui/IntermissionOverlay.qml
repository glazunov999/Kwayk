import QtQuick

import "Sbar"

Item {
    id: root

    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
    transformOrigin: Item.Center

    Image {
        x: 64
        y: 24
        source: "qrc:/Assets/images/complete.png"
    }

    Image {
        x: 0
        y: 56
        source: "qrc:/Assets/images/inter.png"
    }

    Num {
        x: 102
        y: 64
        str: Math.floor((world?.completed_time ?? 0) / 60)
        digits: 3
    }

    Image {
        x: 174
        y: 64
        source: "qrc:/Assets/images/NUM_COLON.png"
    }

    Num {
        x: 198
        y: 64
        str: Math.floor((world?.completed_time ?? 0) % 60).toString().padStart(2, "0")
        digits: 2
    }

    Image {
        x: 246
        y: 64
        source: "qrc:/Assets/images/NUM_COLON.png"
    }

    Num {
        x: 266
        y: 64
        str: Math.floor(((world?.completed_time ?? 0) * 1000 % 1000) / 10).toString().padStart(2, "0")
        digits: 2
    }

    Num {
        x: 160
        y: 104
        str: world?.found_secrets ?? 0
        digits: 3
    }

    Image {
        x: 232
        y: 104
        source: "qrc:/Assets/images/NUM_SLASH.png"
    }

    Num {
        x: 240
        y: 104
        str: world?.total_secrets ?? 0
        digits: 3
    }

    Num {
        x: 160
        y: 144
        str: world?.killed_monsters ?? 0
        digits: 3
    }

    Image {
        x: 232
        y: 144
        source: "qrc:/Assets/images/NUM_SLASH.png"
    }

    Num {
        x: 240
        y: 144
        str: world?.total_monsters ?? 0
        digits: 3
    }
}
