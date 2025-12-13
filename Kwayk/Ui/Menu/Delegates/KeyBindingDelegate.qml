import QtQuick
import QtQuick.Layouts

import "../../Controls" as C
import "../../../js/keys.js" as Key

Item {
    id: root

    required property string name
    required property var keys
    required property bool bindGrab

    implicitHeight: layout.implicitHeight

    RowLayout {
        id: layout

        anchors.fill: parent

        C.Label {
            Layout.fillWidth: true
            text: name
            light: true
        }

        C.Label {
            Layout.preferredWidth: 108
            light: true
            text: keysText(keys, bindGrab)
        }
    }

    function keysText(keys, bindGrab) {
        if (bindGrab)
            return "...";

        if (!keys.count)
            return "???";

        let str = "";
        for (let i = 0; i < keys.count; ++i) {
            if (str)
                str += ",";
            str += Key.keynumToString(keys.get(i).key)
        }

        return str;
    }
}
