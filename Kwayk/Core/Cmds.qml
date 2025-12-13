import QtQuick

import "../js/keys.js" as Key

Item {
    id: root

    property string command;

    property var functions: ({
        "exec": exec,
        "alias": alias_f,
        "bind": bind,
        "unbind": unbind,
        "unbindall": unbindall,
        "quit": quit,
        "+moveup": playerController.upDown,
        "-moveup": playerController.upUp,
        "+movedown": playerController.downDown,
        "-movedown": playerController.downUp,
        "+left": playerController.leftDown,
        "-left": playerController.leftUp,
        "+right": playerController.rightDown,
        "-right": playerController.rightUp,
        "+forward": playerController.forwardDown,
        "-forward": playerController.forwardUp,
        "+back": playerController.backDown,
        "-back": playerController.backUp,
        "+lookup": playerController.lookupDown,
        "-lookup": playerController.lookupUp,
        "+lookdown": playerController.lookdownDown,
        "-lookdown": playerController.lookdownUp,
        "+strafe": playerController.strafeDown,
        "-strafe": playerController.strafeUp,
        "+moveleft": playerController.moveleftDown,
        "-moveleft": playerController.moveleftUp,
        "+moveright": playerController.moverightDown,
        "-moveright": playerController.moverightUp,
        "+speed": playerController.speedDown,
        "-speed": playerController.speedUp,
        "+attack": playerController.attackDown,
        "-attack": playerController.attackUp,
        "+use": playerController.useDown,
        "-use": playerController.useUp,
        "+jump": playerController.jumpDown,
        "-jump": playerController.jumpUp,
    })

    property var alias_: []

    property string token: ""

    signal bindFinished;

    onCommandChanged: execute();

    function addCommand(name, command) {
        if (vars.vars[name]) {
            ui.conPrint(`AddCommand ${name} already defined as a var\n`, "warning");
            return;
        }

        if (functions[name]) {
            ui.conPrint(`AddCommand ${name} already defined\n`, "warning");
            return;
        }

        functions[name] = command;
    }

    function completeCommand(partial) {
        if (!partial.length)
            return;
        for (let i = 0; i < functions.length; ++i) {
            const name = functions[i].name;
            if (name.startsWith(partial))
                return name;
        }
        return null;
    }

    function execute() {
        const lines = command.split("\n");
        for (var i = 0; i < lines.length; ++i) {
            const line = lines[i].trim();
            let quotes = 0;
            let cmd = ""
            for (var j = 0; j < line.length; ++j) {
                if (line[j] === '"')
                    quotes++;
                if (!(quotes & 1) && line[j] === ';') {
                    executeString(cmd);
                    cmd = "";
                    continue;
                }
                cmd += line[j];
            }
            executeString(cmd);
        }
        command = "";
    }

    function executeString(text) {
        if (!text)
            return;

        const argv = tokenizeString(text);
        if (!argv || !argv.length)
            return;

        const name = argv[0].toLowerCase();
        const func = functions[name];
        if (func) {
            func(argv);
            return;
        }

        for (let i = 0; i < alias_.length; ++i) {
            if (alias_[i].name === name) {
                command = alias_[i].value + command;
                return;
            }
        }

        vars.command = { argv }
    }

    function tokenizeString(text) {
        const argv = [];
        while (true) {
            text = parse(text);
            if (text === null)
                break;
            argv.push(token);
        }
        return argv;
    }

    function exec(argv) {
        if (argv.length !== 2) {
            ui.conPrint("exec <filename> : execute a script file\n");
            return;
        }

        ui.conPrint(`execing ${argv[1]}\n`);
        command = game.scripts[argv[1]] || "";
    }

    function alias_f(argv) {
        if (argv.length === 1) {
            ui.conPrint("Current alias commands:\n")
            for (let i = 0; i < alias_.length; ++i)
                ui.conPrint(`${alias_[i].name} + " : " + ${alias_[i].value}\n`);
        }

        const s = argv[1];
        let i = 0;
        for (; i < alias_.length; ++i) {
            if (alias_[i].name === s)
                break;
        }

        let cmd = "";
        for (let j = 2; j < argv.length; ++j) {
            cmd += argv[j];
            if (j !== argv.length - 1)
                cmd += " ";
        }

        alias_[i] = { name: s, value: cmd };
    }

    function bind(argv) {
        const c = argv.length;
        if (c !== 2 && c !== 3) {
            ui.conPrint("bind <key> [command] : attach a command to a key\n");
            return;
        }
        const b = Key.stringToKeynum(argv[1]);
        if (b === null) {
            ui.conPrint(`"${argv[1]}" isn't a valid key\n`, "warning");
            return;
        }
        if (c === 2) {
            if (keyBindings[b] !== null)
                ui.conPrint(`"${argv[1]}" = "${keyBindings[b]}"\n`, "info");
            else
                ui.conPrint(`"${argv[1]}" is not bound\n`, "warning");
            return;
        }
        let cmd = "";
        for (var i = 2; i < c; ++i) {
            cmd += argv[i];
            if (i !== (c - 1))
                cmd += " ";
        }
        keyBindings[b] = cmd;
        bindFinished();
    }

    function unbind(argv) {
        if (argv.length !== 2) {
            ui.conPrint("unbind <key> : remove commands from a key\n");
            return;
        }
        const b = Key.stringToKeynum(argv[1]);
        if (b === null) {
            ui.conPrint(`"${argv[1]}" isn't a valid key\n`, "warning");
            return;
        }
        const cmd = keyBindings[b];
        keyBindings[b] = null;
        bindFinished();
    }

    function unbindall(argv) {
        keyBindings = [];
        bindFinished();
    }

    function quit(argv) {
        Qt.quit();
    }

    function parse(data) {
        token = "";

        if (data === null)
            return null;

        let text = data.trim();

        // skip "//" comments
        if (text.startsWith("//")) {
            text = text.substring(2);
            while (text.length) {
                if (text[0] === "\n") {
                    text = text.substring(1);
                    break
                }
                text = text.substring(1);
            }
            text = text.trim();
        }

        if (!text)
            return null;

        // skip "/*..*/" comments
        if (text.startsWith("/*")) {
            text = text.substring(2);
            while (text.length) {
                if (text.startsWith("*/")) {
                    text = text.substring(2);
                    break;
                }
                text = text.substring(1);
            }
            text = text.trim();
        }

        if (!text)
            return null;

        // handle quated strings
        if (text[0] === '\"') {
            text = text.substring(1);
            while (text.length) {
                if (text[0] === '\"') {
                    text = text.substring(1);
                    return text;
                }
                token += text[0];
                text = text.substring(1);
            }
        }

        // parse single characters
        let c = text[0];
        if (c === '{' || c === '}' || c === '(' || c === ')' || c === '\'' || c === ':') {
            token = c;
            text = text.substring(1);
            return text;
        }

        // parse a regular word
        let n = 0;
        do {
            token += c;
            text = text.substring(1);
            c = text[0];
            n = text.charCodeAt(0);
            if (c === '{' || c === '}' || c === '(' || c === ')' || c === '\'')
                break;
        } while (n > 32);

        return text;
    }
}
