import QtQuick

SpriteSequence {
    id: root

    width: 16
    height: 24

    running: true

    sprites: [
        Sprite {
            name: "menudot1"
            source: "qrc:/Assets/images/menudot1.png"
            frameDuration: 100
            frameCount: 1
            to: { "menudot2" : 1 }
        },
        Sprite {
            name: "menudot2"
            source: "qrc:/Assets/images/menudot2.png"
            frameDuration: 100
            frameCount: 1
            to: { "menudot3" : 1 }
        },
        Sprite {
            name: "menudot3"
            source: "qrc:/Assets/images/menudot3.png"
            frameDuration: 100
            frameCount: 1
            to: { "menudot4" : 1 }
        },
        Sprite {
            name: "menudot4"
            source: "qrc:/Assets/images/menudot4.png"
            frameDuration: 100
            frameCount: 1
            to: { "menudot5" : 1 }
        },
        Sprite {
            name: "menudot5"
            source: "qrc:/Assets/images/menudot5.png"
            frameDuration: 100
            frameCount: 1
            to: { "menudot6" : 1 }
        },
        Sprite {
            name: "menudot6"
            source: "qrc:/Assets/images/menudot6.png"
            frameDuration: 100
            frameCount: 1
            to: { "menudot1" : 1 }
        }
    ]
}
