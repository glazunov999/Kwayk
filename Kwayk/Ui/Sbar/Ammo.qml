import QtQuick

import Kwayk.Game as G

Image {
    id: root

    property int items: 0

    onItemsChanged: {
        if (items & G.Defs.itShells)
            source = "qrc:/Assets/images/SB_SHELLS.png";
        else if (items & G.Defs.itNails)
            source = "qrc:/Assets/images/SB_NAILS.png";
        else if (items & G.Defs.itRockets)
            source = "qrc:/Assets/images/SB_ROCKET.png";
        else if (items & G.Defs.itCells)
            source = "qrc:/Assets/images/SB_CELLS.png";
        else
            source = "";
    }
}
