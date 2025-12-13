import QtQuick

Item {
    id: root

    property string str: ""
    property int digits: 0
    property int color: 0

    readonly property int count: str.length > digits ? digits : str.length

    implicitWidth: count * 24
    implicitHeight: 24

    Item {
        x: (digits - root.count) * 24
        Repeater {
            model: root.count
            Image {
                x: (root.count - index - 1) * 24
                source: "qrc:/Assets/images/" + (root.color ? "ANUM_" : "NUM_" )
                                          + (str.charAt(str.length - index - 1) !== "-" ? str.charAt(str.length - index - 1) : "MINUS")
                                          + ".png"
            }
        }
    }
}
