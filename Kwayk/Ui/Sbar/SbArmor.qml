import QtQuick

import Kwayk.Game as G

Image {
    id: root

    property int items: 0

    onItemsChanged: {
        if (items & G.Defs.itArmor3)
            source = "qrc:/Assets/images/SB_ARMOR3.png";
        else if (items & G.Defs.itArmor2)
            source = "qrc:/Assets/images/SB_ARMOR2.png";
        else if (items & G.Defs.itArmor1)
            source = "qrc:/Assets/images/SB_ARMOR1.png";
    }
}
