import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root

    property alias textField: textField
    property alias text: textField.text
    property var history: []
    property int historyIndex: -1
    
    spacing: 0
    
    Label {
        text: ">"
        color: "white"
        font.weight: 700
        font.pixelSize: 12
    }
    
    TextField {
        id: textField
        Layout.fillWidth: true
        color: "white"
        font.weight: 700
        background: Item {}
        focus: true
        font.pixelSize: 12

        cursorDelegate: Label {
            text: "_"
            color: "white"
            font.weight: 700
            font.pixelSize: 12
            
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation { from: 0; to: 1; duration: 250 }
                NumberAnimation { from: 1; to: 0; duration: 250 }
            }
        }
        
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                if (text.trim().length > 0) {
                    root.history.push(text);
                    ui.conPrint(text + "\n", "command");
                    cmds.command = text + "\n";
                    text = "";
                    root.historyIndex = -1;
                }
                event.accepted = true;
                return;
            }

            if (event.key === Qt.Key_Up) {
                if (root.history.length > 0) {
                    root.historyIndex = Math.min(root.historyIndex + 1, root.history.length - 1);
                    text = root.history[root.history.length - 1 - root.historyIndex];
                    textField.cursorPosition = text.length;
                }
                event.accepted = true;
                return;
            }

            if (event.key === Qt.Key_Down) {
                if (root.history.length > 0) {
                    root.historyIndex = Math.max(root.historyIndex - 1, -1);
                    if (root.historyIndex === -1)
                        text = "";
                    else
                        text = root.history[root.history.length - 1 - root.historyIndex];
                    textField.cursorPosition = text.length;
                }
                event.accepted = true;
                return;
            }

            if (keyBindings[event.key] === "toggleconsole") {
                event.accepted = true;
                return;
            }
        }
    }
}
