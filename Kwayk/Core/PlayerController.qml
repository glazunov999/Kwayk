import QtQuick

import Backend

Item {
    id: root

    property int button0: 0
    property int button1: 0
    property int button2: 0

    property real forwardMove: 0
    property real sideMove: 0
    property real upMove: 0

    property vector3d playerRotation: Qt.vector3d(0, 0, 0)

    function upDown(argv) {
        status.keyDown(status.inUp, argv[1]);
    }

    function upUp(argv) {
        status.keyUp(status.inUp, argv[1]);
    }

    function downDown(argv) {
        status.keyDown(status.inDown, argv[1]);
    }

    function downUp(argv) {
        status.keyUp(status.inDown, argv[1]);
    }

    function leftDown(argv) {
        status.keyDown(status.inLeft, argv[1]);
    }

    function leftUp(argv) {
        status.keyUp(status.inLeft, argv[1]);
    }

    function rightDown(argv) {
        status.keyDown(status.inRight, argv[1]);
    }

    function rightUp(argv) {
        status.keyUp(status.inRight, argv[1]);
    }

    function forwardDown(argv) {
        status.keyDown(status.inForward, argv[1]);
    }

    function forwardUp(argv) {
        status.keyUp(status.inForward, argv[1]);
    }

    function backDown(argv) {
        status.keyDown(status.inBack, argv[1]);
    }

    function backUp(argv) {
        status.keyUp(status.inBack, argv[1]);
    }

    function lookupDown(argv) {
        status.keyDown(status.inLookup, argv[1]);
    }

    function lookupUp(argv) {
        status.keyUp(status.inLookup, argv[1]);
    }

    function lookdownDown(argv) {
        status.keyDown(status.inLookdown, argv[1]);
    }

    function lookdownUp(argv) {
        status.keyUp(status.inLookdown, argv[1]);
    }

    function strafeDown(argv) {
        status.keyDown(status.inStrafe, argv[1]);
    }

    function strafeUp(argv) {
        status.keyUp(status.inStrafe, argv[1]);
    }

    function moveleftDown(argv) {
        status.keyDown(status.inMoveleft, argv[1]);
    }

    function moveleftUp(argv) {
        status.keyUp(status.inMoveleft, argv[1]);
    }

    function moverightDown(argv) {
        status.keyDown(status.inMoveright, argv[1]);
    }

    function moverightUp(argv) {
        status.keyUp(status.inMoveright, argv[1]);
    }

    function speedDown(argv) {
        status.keyDown(status.inSpeed, argv[1]);
    }

    function speedUp(argv) {
        status.keyUp(status.inSpeed, argv[1]);
    }

    function attackDown(argv) {
        status.keyDown(status.inAttack, argv[1]);
    }

    function attackUp(argv) {
        status.keyUp(status.inAttack, argv[1]);
    }

    function useDown(argv) {
        status.keyDown(status.inUse, argv[1]);
    }

    function useUp(argv) {
        status.keyUp(status.inUse, argv[1]);
    }

    function jumpDown(argv) {
        status.keyDown(status.inJump, argv[1]);
    }

    function jumpUp(argv) {
        status.keyUp(status.inJump, argv[1]);
    }

    function reset() {
        status.inAttack.down = [0, 0];
        status.inAttack.state = 0;
        status.inJump.down = [0, 0];
        status.inJump.state = 0;
        status.inUse.down = [0, 0];
        status.inUse.state = 0;
        button0 = 0;
        button1 = 0;
        button2 = 0;
    }

    function processInput(dm) {
        status.baseMove();
        status.mouseMove();

        let bits = 0;

        if (status.inAttack.state & 3)
            bits |= 1;
        status.inAttack.state &= ~2;

        if (status.inJump.state & 3)
            bits |= 2;
        status.inJump.state &= ~2;

        button0 = (bits & 1);
        button2 = (bits & 2) >> 1;
    }

    QtObject {
        id: status

        property var inForward: ({ down: [0, 0], state: 0 })
        property var inBack: ({ down: [0, 0], state: 0 })
        property var inLeft: ({ down: [0, 0], state: 0 })
        property var inRight: ({ down: [0, 0], state: 0 })
        property var inUp: ({ down: [0, 0], state: 0 })
        property var inDown: ({ down: [0, 0], state: 0 })
        property var inLookup: ({ down: [0, 0], state: 0 })
        property var inLookdown: ({ down: [0, 0], state: 0 })
        property var inStrafe: ({ down: [0, 0], state: 0 })
        property var inMoveleft: ({ down: [0, 0], state: 0 })
        property var inMoveright: ({ down: [0, 0], state: 0 })
        property var inSpeed: ({ down: [0, 0], state: 0 })
        property var inAttack: ({ down: [0, 0], state: 0 })
        property var inUse: ({ down: [0, 0], state: 0 })
        property var inJump: ({ down: [0, 0], state: 0 })

        function adjustAngles() {
            let speed;

            if (inSpeed.state & 1)
                speed = frameTime * vars.cl_anglespeedkey.value;
            else
                speed = frameTime;

            if (!(inStrafe.state & 1)) {
                playerRotation.y -= speed * vars.cl_yawspeed.value * keyState(inRight);
                playerRotation.y += speed * vars.cl_yawspeed.value * keyState(inLeft);
            }

            const up = keyState(inLookup);
            const down = keyState(inLookdown);

            playerRotation.x += speed * vars.cl_pitchspeed.value * up;
            playerRotation.x -= speed * vars.cl_pitchspeed.value * down;

            if (playerRotation.x > vars.cl_maxpitch.value)
                playerRotation.x = vars.cl_maxpitch.value;
            if (playerRotation.x < vars.cl_minpitch.value)
                playerRotation.x = vars.cl_minpitch.value;

            if (playerRotation.z > 50)
                playerRotation.z = 50;
            if (playerRotation.z < -50)
                playerRotation.z = -50;
        }

        function baseMove() {
            adjustAngles()

            forwardMove = 0;
            sideMove = 0;
            upMove = 0;

            if (inStrafe.state & 1) {
                sideMove += vars.cl_sidespeed.value / 100 * keyState(inRight);
                sideMove -= vars.cl_sidespeed.value / 100 * keyState(inLeft);
            }

            sideMove += vars.cl_sidespeed.value / 100 * keyState(inMoveright);
            sideMove -= vars.cl_sidespeed.value / 100 * keyState(inMoveleft);

            upMove += vars.cl_upspeed.value / 100 * keyState(inUp);
            upMove -= vars.cl_upspeed.value / 100 * keyState(inDown);

            forwardMove += vars.cl_forwardspeed.value / 100 * keyState(inForward);
            forwardMove -= vars.cl_backspeed.value / 100 * keyState(inBack);

            if (inSpeed.state & 1) {
                forwardMove *= vars.cl_movespeedkey.value;
                sideMove *= vars.cl_movespeedkey.value;
                upMove *= vars.cl_movespeedkey.value;
            }
        }

        function mouseMove() {
            if (ui.weaponWheelVisible)
                return;
            
            const sens = vars.sensitivity.value;

            const dm = mouseController.delta;
            const dmx = dm.x * sens;
            const dmy = dm.y * sens;

            playerRotation.y += vars.m_yaw.value * dmx;

            playerRotation.x += vars.m_pitch.value * dmy;
            if (playerRotation.x > vars.cl_maxpitch.value)
                playerRotation.x = vars.cl_maxpitch.value;
            if (playerRotation.x < vars.cl_minpitch.value)
                playerRotation.x = vars.cl_minpitch.value;
        }

        function keyState(key) {
            const impulseDown = (key.state & 2) !== 0;
            const impulseUp = (key.state & 4) !== 0;
            const down = (key.state & 1) !== 0;
            let val = 0;

            if (impulseDown && !impulseUp)
                val = down ? 0.5 : 0;

            if (impulseUp && !impulseDown)
                val = 0;

            if (!impulseDown && !impulseUp)
                val = down ? 1.0 : 0;

            if (impulseDown && impulseUp)
                val = down ? 0.75 : 0.25;

            key.state &= 1;     // Clear impulses

            return val;
        }

        function keyDown(b, c) {
            let k;
            if (c)
                k = parseInt(c)
            else
                k = -1;

            if (k === b.down[0] || k === b.down[1])
                return;

            if (!b.down[0]) {
                b.down[0] = k;
            } else if (!b.down[1]) {
                b.down[1] = k;
            } else {
                console.log("Three keys down for a button");
                return;
            }

            if (b.state & 1)
                return;         // Down
            b.state |= 1 + 2;   // Down + Impulse Down
        }

        function keyUp(b, c) {
            let k;
            if (c) {
                k = parseInt(c);
            } else {
                b.down[0] = b.down[1] = 0;
                b.state = 4;
                return;
            }

            if (b.down[0] === k)
                b.down[0] = 0;
            else if (b.down[1] === k)
                b.down[1] = 0;
            else
                return;

            if (b.down[0] || b.down[1])
                return;

            if (!(b.state & 1))
                return;
            b.state &= ~1;      // Up
            b.state |= 4;       // Impulse Up
        }
    }
}
