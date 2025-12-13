import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Core
import Kwayk.Game
import Backend

import "../js/math.js" as M

Entity {
    id: root

    property vector3d angles: Qt.vector3d(0, 0, 0)

    property vector3d view_ofs: Qt.vector3d(0, 0, 0)
    property bool monster: false
    property real pausetime: 0
    property real super_damage_finished: 0
    property real pain_finished: 0
    property bool onGround: false

    property int weapon: 0
    property int currentammo: 0
    property int ammo_shells: 0
    property int ammo_nails: 0
    property int ammo_rockets: 0
    property int ammo_cells: 0

    property var deadBody: null

    property alias modelComponent: modelLoader.sourceComponent
    property Component headComponent: null

    readonly property alias weapons: weapons
    readonly property alias updateSettings: updateSettings
    readonly property alias shape: shape

    readonly property alias characterContactListener: characterContactListener

    readonly property var backpackComponent: Qt.createComponent("Items/Backpack.qml")

    property int objectLayer: solid ? Layers.Walker : Layers.Item

    th.movetype: "walk"

    Component.onCompleted: {
        body = characterComponent.createObject(world, { position,
                                                        eulerRotation,
                                                        innerBodyShapeLayer: objectLayer,
                                                        supportingVolume: Qt.vector4d(0, 1, 0, -root.size.x / 2) });
    }

    th.onPhysics: {
        if (effects & Defs.efDimlight) {
            if (items & Defs.itQuad)
                quadLight.update();
            if (items & Defs.itInvulnerability)
                invulnerabilityLight.update();
        }

        if (effects & Defs.efMuzzleflash)
            muzzleflashLight.update();

        effects = effects - (effects & Defs.efMuzzleflash);
    }

    Connections {
        target: body
        enabled: root.visible
        function onCharacterContact(body, position, normal) {
            other = body.ent ?? null;
            if (touch !== null && other !== null)
                touch();
        }
    }

    Connections {
        target: body
        enabled: root.visible && (th.movetype === "bounce" || th.movetype === "toss") && !velocity.fuzzyEquals(Qt.vector3d(0, 0, 0))
        function onCharacterContact(contactBody, position, normal) {
            if (onGround) {
                clipVelocity(normal, th.movetype === "bounce" ? 1.5 : 1.0);
                if (normal.y > 0.7 && (velocity.y < 0.6 || th.movetype !== "bounce"))
                    velocity = Qt.vector3d(0, 0, 0);
                decals.spawnBloodDecal(position, normal);
            }
        }
    }

    Weapons { id: weapons }

    ExtendedUpdateSettings {
        id: updateSettings;
        walkStairsStepUp: Qt.vector3d(0, 0.12, 0)
        stickToFloorStepDown: Qt.vector3d(0, -0.05, 0)
        walkStairsMinStepForward: 0.02
        walkStairsStepForwardTest: 0.15
        walkStairsCosAngleForwardContact: Math.cos(Math.PI / 3)
    }

    RotatedTranslatedShape {
        id: shape
        shape: CapsuleShape {
            height: root.size.y - root.size.x
            diameter: root.size.x
        }
        y: root.size.y / 2
    }

    CharacterContactListener {
        id: characterContactListener
    }

    Component {
        id: characterComponent

        CharacterVirtual {
            property var ent: root
            characterContactListener: root.characterContactListener
            shape: root.shape
            innerBodyShape: solid ? root.shape : null
            predictiveContactDistance: 0.1
            penetrationRecoverySpeed: 1
        }
    }

    Loader3D { id: modelLoader }

    Component {
        id: gibComponent

        Gib {
            id: gib
            property string name: ""
            Alias {
                mdl.source: "qrc:/Assets/progs/" + gib.name + ".mdl"
                skin.source: "qrc:/Assets/progs/skins/" + gib.name + ".png"
                active: false
                alpha: gib.alpha
            }
        }
    }

    Component {
        id: deadBodyComponent

        Solid {
            shape: CapsuleShape {
                height: root.size.y - root.size.x
                diameter: root.size.x
            }

            objectLayer: Layers.Dead
            motionType: Body.Static
            ent: root

            eulerRotation.x: -90
            position.y: root.center.y - root.size.x
        }
    }

    Dlight {
        id: quadLight
        y: 0.16
        color: Qt.rgba(0.2, 0.4, 1.0, 1.0)
    }

    Dlight {
        id: invulnerabilityLight
        y: 0.16
        color: Qt.rgba(1.0, 1.0, 0.0, 1.0)
    }

    Dlight {
        id: muzzleflashLight
        y: 0.16
        z: -0.18
        color: Qt.rgba(0.6, 0.6, 0.2, 1.0)
    }

    FlyTrail {
        target: root
    }

    function updatePosition() {
        body.setLinearVelocity(velocity);
        body.extendedUpdate(frameTime, physicsSystem.gravity, updateSettings, objectLayer, [body]);
        position = body.position.minus(root.center);
        onGround = body.isSupported();

        if (th.movetype === "walk" || th.movetype === "step") {
            body.updateGroundVelocity();
            const groundVelocity = body.getGroundVelocity();
            if (body.getGroundState() === CharacterVirtual.OnGround
                    && !body.isSlopeTooSteep(body.getGroundNormal())) {
                velocity.y = groundVelocity.y;
            }
        }
    }

    function physicsToss() {
        if (!onGround)
            addGravity();

        updatePosition();
        checkWaterTransition();
    }

    function clipVelocity(normal, overbounce) {
        var backoff = velocity.dotProduct(normal) * overbounce;
        velocity.x -= normal.x * backoff;
        if (velocity.x > -0.001 && velocity.x < 0.001)
            velocity.x = 0;
        velocity.y -= normal.y * backoff;
        if (velocity.y > -0.001 && velocity.y < 0.001)
            velocity.y = 0;
        velocity.z -= normal.z * backoff;
        if (velocity.z > -0.001 && velocity.z < 0.001)
            velocity.z = 0;
    }

    function addGravity() {
        velocity.y += physicsSystem.gravity.y * frameTime;
    }

    function velocityForDamage(dm) {
        let v = Qt.vector3d(1 * M.crandom(), 2 + 1 * M.crandom(), 1 * M.crandom());

        if (dm > -50)
            v = v.times(0.7);
        else if (dm > -200)
            v = v.times(2);
        else
            v = v.times(10);

        return v;
    }

    function throwGib(gibname, dm) {
        const velocity = velocityForDamage(dm);
        const avelocity = Qt.vector3d(Math.random() * 6, Math.random() * 6, Math.random() * 6);
        gibComponent.createObject(world, { position: root.position, name: gibname, velocity, avelocity });
    }

    function throwHead(dm) {
        th.nextthink = -1;
        th.movetype = "bounce";
        takedamage = Defs.damageNo;
        flags = Defs.gib;
        deadBody?.destroy();
        solid = false;
        mins = Qt.vector3d(-0.16, 0, -0.16);
        maxs = Qt.vector3d(0.16, 0.56, 0.16);
        body.setShape(1.5 * 0.02, Layers.Walker, [body]);
        view_ofs = Qt.vector3d(0, 0.8, 0);
        modelComponent = headComponent;
        velocity = velocityForDamage(dm);
        onGround = false;
    }

    function walkerDead(dead) {
        deadBody?.destroy();
        if (dead) {
            deadBody = deadBodyComponent.createObject(root);
            takedamage = Defs.damageDead;
            solid = false;
            health = 0;
        } else {
            takedamage = Defs.damageAim;
            solid = true;
        }
    }

    function dropBackpack() {
        if ((ammo_shells + ammo_nails + ammo_rockets + ammo_cells) === 0)
            return; // nothig in it

        const velocity = Qt.vector3d(-1 + Math.random() * 2, 3, -1 + Math.random() * 2);

        const item = backpackComponent.createObject(world, { position: root.position.minus(Qt.vector3d(0, 0.24, 0)), velocity });
        item.items = weapon;

        item.ammo_shells = ammo_shells;
        item.ammo_nails = ammo_nails;
        item.ammo_rockets = ammo_rockets;
        item.ammo_cells = ammo_cells;
    }

    function monster_death_use() {
        th.movetype = "step";

        if (!target)
            return;

        activator = enemy;
        useTargets();
    }
}
