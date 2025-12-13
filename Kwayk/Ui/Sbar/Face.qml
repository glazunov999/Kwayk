import QtQuick

import Kwayk.Game as G

Item {
    id: root

    implicitWidth: 24
    implicitHeight: 24

    readonly property var sb_faces: [
        ["face5", "face_p5"],
        ["face4", "face_p4"],
        ["face3", "face_p3"],
        ["face2", "face_p2"],
        ["face1", "face_p1"],
    ]

    function update() {
        if ((player.items & (G.Defs.itInvisibility | G.Defs.itInvulnerability)) === (G.Defs.itInvisibility | G.Defs.itInvulnerability)) {
            faceSprite.jumpTo("face_invis_invuln");
            return;
        }
        
        if (player.items & G.Defs.itQuad) {
            faceSprite.jumpTo("face_quad");
            return;
        }
        
        if (player.items & G.Defs.itInvisibility) {
            faceSprite.jumpTo("face_invis");
            return;
        }
        
        if (player.items & G.Defs.itInvulnerability) {
            faceSprite.jumpTo("face_invul2");
            return;
        }
        
        // Normal face states
        let f = 0;
        if (player.health >= 100)
            f = 4;
        else
            f = Math.floor(player.health / 20)
        if (f < 0)
            f = 0;

        let anim = 0;
        if (time <= player.faceanimtime)
            anim = 1;

        let sprite = sb_faces[f][anim];
        if (faceSprite.currentSprite !== sprite)
            faceSprite.jumpTo(sprite);
    }

    SpriteSequence {
        id: faceSprite

        anchors.fill: parent

        sprites: [
            Sprite {
                name: "face1"
                source: "qrc:/Assets/images/FACE1.png"
                frameCount: 1
            },
            Sprite {
                name: "face_p1"
                source: "qrc:/Assets/images/FACE_P1.png"
                frameCount: 1
            },
            Sprite {
                name: "face2"
                source: "qrc:/Assets/images/FACE2.png"
                frameCount: 1
            },
            Sprite {
                name: "face_p2"
                source: "qrc:/Assets/images/FACE_P2.png"
                frameCount: 1
            },
            Sprite {
                name: "face3"
                source: "qrc:/Assets/images/FACE3.png"
                frameCount: 1
            },
            Sprite {
                name: "face_p3"
                source: "qrc:/Assets/images/FACE_P3.png"
                frameCount: 1
            },
            Sprite {
                name: "face4"
                source: "qrc:/Assets/images/FACE4.png"
                frameCount: 1
            },
            Sprite {
                name: "face_p4"
                source: "qrc:/Assets/images/FACE_P4.png"
                frameCount: 1
            },
            Sprite {
                name: "face5"
                source: "qrc:/Assets/images/FACE5.png"
                frameCount: 1
            },
            Sprite {
                name: "face_p5"
                source: "qrc:/Assets/images/FACE_P5.png"
                frameCount: 1
            },
            Sprite {
                name: "face_invis"
                source: "qrc:/Assets/images/FACE_INVIS.png"
                frameCount: 1
            },
            Sprite {
                name: "face_invul2"
                source: "qrc:/Assets/images/FACE_INVUL2.png"
                frameCount: 1
            },
            Sprite {
                name: "face_invis_invuln"
                source: "qrc:/Assets/images/FACE_INV2.png"
                frameCount: 1
            },
            Sprite {
                name: "face_quad"
                source: "qrc:/Assets/images/FACE_QUAD.png"
                frameCount: 1
            }
        ]
    }
}
