import QtQuick

import "../Controls" as C

C.Label {
    id: root

    text: "axe"

    property bool highlighted: false

    light: highlighted
}
