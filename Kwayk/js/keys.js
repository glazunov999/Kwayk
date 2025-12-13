
// Специальные коды для кнопок мыши (как в Quake)
const K_MOUSE1 = 0x10000001;
const K_MOUSE2 = 0x10000002;
const K_MOUSE3 = 0x10000004;
const K_MWHEELUP = 0x10000010;
const K_MWHEELDOWN = 0x10000020;

const keyNames = [
    {name: "MOUSE1", keyNum: K_MOUSE1},
    {name: "MOUSE2", keyNum: K_MOUSE2},
    {name: "MOUSE3", keyNum: K_MOUSE3},
    {name: "MWHEELUP", keyNum: K_MWHEELUP},
    {name: "MWHEELDOWN", keyNum: K_MWHEELDOWN},

    {name: "TAB", keyNum: Qt.Key_Tab},
    {name: "ENTER", keyNum: Qt.Key_Return},
    {name: "ESCAPE", keyNum: Qt.Key_Escape},
    {name: "SPACE", keyNum: Qt.Key_Space},
    {name: "BACKSPACE", keyNum: Qt.Key_Backspace},
    {name: "UPARROW", keyNum: Qt.Key_Up},
    {name: "DOWNARROW", keyNum: Qt.Key_Down},
    {name: "LEFTARROW", keyNum: Qt.Key_Left},
    {name: "RIGHTARROW", keyNum: Qt.Key_Right},

    {name: "ALT", keyNum: Qt.Key_Alt},
    {name: "CTRL", keyNum: Qt.Key_Control},
    {name: "SHIFT", keyNum: Qt.Key_Shift},

    {name: "F1", keyNum: Qt.Key_F1},
    {name: "F2", keyNum: Qt.Key_F2},
    {name: "F3", keyNum: Qt.Key_F3},
    {name: "F4", keyNum: Qt.Key_F4},
    {name: "F5", keyNum: Qt.Key_F5},
    {name: "F6", keyNum: Qt.Key_F6},
    {name: "F7", keyNum: Qt.Key_F7},
    {name: "F8", keyNum: Qt.Key_F8},
    {name: "F9", keyNum: Qt.Key_F9},
    {name: "F10", keyNum: Qt.Key_F10},
    {name: "F11", keyNum: Qt.Key_F11},
    {name: "F12", keyNum: Qt.Key_F12},

    {name: "INS", keyNum: Qt.Key_Insert},
    {name: "DEL", keyNum: Qt.Key_Delete},
    {name: "PGDN", keyNum: Qt.Key_PageDown},
    {name: "PGUP", keyNum: Qt.Key_PageUp},
    {name: "HOME", keyNum: Qt.Key_Home},
    {name: "END", keyNum: Qt.Key_End},

    {name: "0", keyNum: Qt.Key_0},
    {name: "1", keyNum: Qt.Key_1},
    {name: "2", keyNum: Qt.Key_2},
    {name: "3", keyNum: Qt.Key_3},
    {name: "4", keyNum: Qt.Key_4},
    {name: "5", keyNum: Qt.Key_5},
    {name: "6", keyNum: Qt.Key_6},
    {name: "7", keyNum: Qt.Key_7},
    {name: "8", keyNum: Qt.Key_8},
    {name: "9", keyNum: Qt.Key_9},

    {name: "'", keyNum: Qt.Key_Apostrophe},
    {name: ";", keyNum: Qt.Key_Semicolon},
    {name: ",", keyNum: Qt.Key_Comma},
    {name: ".", keyNum: Qt.Key_Period},
    {name: "/", keyNum: Qt.Key_Slash},
    {name: "[", keyNum: Qt.Key_BracketLeft},
    {name: "\\", keyNum: Qt.Key_Backslash},
    {name: "]", keyNum: Qt.Key_BracketRight},
    {name: "`", keyNum: Qt.Key_QuoteLeft},
    {name: "-", keyNum: Qt.Key_Minus},
    {name: "=", keyNum: Qt.Key_Equal},

    {name: "A", keyNum: Qt.Key_A},
    {name: "B", keyNum: Qt.Key_B},
    {name: "C", keyNum: Qt.Key_C},
    {name: "D", keyNum: Qt.Key_D},
    {name: "E", keyNum: Qt.Key_E},
    {name: "F", keyNum: Qt.Key_F},
    {name: "G", keyNum: Qt.Key_G},
    {name: "H", keyNum: Qt.Key_H},
    {name: "I", keyNum: Qt.Key_I},
    {name: "J", keyNum: Qt.Key_J},
    {name: "K", keyNum: Qt.Key_K},
    {name: "L", keyNum: Qt.Key_L},
    {name: "M", keyNum: Qt.Key_M},
    {name: "N", keyNum: Qt.Key_N},
    {name: "O", keyNum: Qt.Key_O},
    {name: "P", keyNum: Qt.Key_P},
    {name: "Q", keyNum: Qt.Key_Q},
    {name: "R", keyNum: Qt.Key_R},
    {name: "S", keyNum: Qt.Key_S},
    {name: "T", keyNum: Qt.Key_T},
    {name: "U", keyNum: Qt.Key_U},
    {name: "V", keyNum: Qt.Key_V},
    {name: "W", keyNum: Qt.Key_W},
    {name: "X", keyNum: Qt.Key_X},
    {name: "Y", keyNum: Qt.Key_Y},
    {name: "Z", keyNum: Qt.Key_Z},
];

const consoleKeys = new Set([
    ...Array.from({length: 95}, (_, i) => i + 32).filter(code => code !== 96 && code !== 126),
    Qt.Key_Tab, Qt.Key_Return, Qt.Key_Escape, Qt.Key_Backspace,
    Qt.Key_Up, Qt.Key_Down, Qt.Key_Left, Qt.Key_Right,
    Qt.Key_Control, Qt.Key_Shift, Qt.Key_Insert, Qt.Key_Delete,
    Qt.Key_PageDown, Qt.Key_PageUp, Qt.Key_Home, Qt.Key_End
]);

function stringToKeynum(str) {
    if (!str)
        return -1;
    const name = str.toUpperCase();
    for (var i = 0; i < keyNames.length; ++i) {
        if (keyNames[i].name === name)
            return keyNames[i].keyNum;
    }

    return null;
}

function keynumToString(keyNum) {
    if (keyNum === -1)
        return "<KEY NOT FOUND>";
    for (var i = 0; i < keyNames.length; ++i) {
        if (keyNames[i].keyNum === keyNum)
            return keyNames[i].name;
    }

    return "<UNKNOWN KEYNUM>";
}

function mouseButtonToKeynum(button) {
    switch (button) {
    case Qt.LeftButton:
        return K_MOUSE1;
    case Qt.RightButton:
        return K_MOUSE2;
    case Qt.MiddleButton:
        return K_MOUSE3;
    default:
        return -1;
    }
}

function wheelToKeynum(angleDelta) {
    if (angleDelta > 0)
        return K_MWHEELUP;
    else if (angleDelta < 0)
        return K_MWHEELDOWN;
    return -1;
}
