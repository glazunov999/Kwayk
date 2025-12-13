import QtQuick

import Kwayk.Game

Trigger {
    id: root

    touch: trigger_skill_touch

    function trigger_skill_touch() {
        if (other.classname !== "player")
            return;

        vars.val = { name: "skill", value: parseInt(message) };
    }
}
