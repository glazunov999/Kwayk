pragma Singleton

import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Backend

QtObject {
    id: pool

    readonly property int maxSlots: Qt.platform.os === "wasm" ? 12 : 24

    property var slots: []

    readonly property bool wasm: Qt.platform.os === "wasm"

    readonly property Component nativeSpatialComponent: Component {
        SpatialSound {
            distanceModel: SpatialSound.ManualAttenuation
            distanceCutoff: 10000
            autoPlay: false
        }
    }

    readonly property Component webSpatialComponent: Component {
        WebSpatialSound {
            distanceModel: WebSpatialSound.ManualAttenuation
            distanceCutoff: 10000
            autoPlay: false
        }
    }

    readonly property Component nativeAmbientComponent: Component {
        AmbientSound {
            autoPlay: false
        }
    }

    readonly property Component webAmbientComponent: Component {
        WebAmbientSound {
            autoPlay: false
        }
    }

    readonly property Component spatialComponent: wasm ? webSpatialComponent : nativeSpatialComponent
    readonly property Component ambientComponent: wasm ? webAmbientComponent : nativeAmbientComponent

    function createSound(spatial, parentNode) {
        const component = spatial ? spatialComponent : ambientComponent;
        return component.createObject(parentNode);
    }

    function createSlot(spatial, parentNode) {
        const sound = createSound(spatial, parentNode);
        if (!sound)
            return null;

        const slot = { sound, spatial, source: "", owner: null, lastUsed: 0 };
        slots.push(slot);
        return slot;
    }

    function stealPriority(slot) {
        if (slot.owner.attenuation <= 0)
            return 0;
        if (!slot.owner.looping)
            return 1;
        return 2;
    }

    function canSteal(slot, attenuation) {
        return slot.owner.attenuation <= 0 || !slot.owner.looping
                || slot.owner.attenuation < attenuation;
    }

    function rankSteal(slot, best) {
        if (!best)
            return slot;

        const priority = stealPriority(slot);
        const bestPriority = stealPriority(best);
        if (priority !== bestPriority)
            return priority < bestPriority ? slot : best;
        if (slot.owner.attenuation !== best.owner.attenuation)
            return slot.owner.attenuation < best.owner.attenuation ? slot : best;
        return slot.lastUsed < best.lastUsed ? slot : best;
    }

    function pickSlot(spatial, source, attenuation) {
        let unusedSameKind = null;
        let unusedAny = null;
        let steal = null;

        for (const slot of slots) {
            if (slot.owner === null) {
                if (slot.spatial !== spatial) {
                    if (!unusedAny)
                        unusedAny = slot;
                } else if (slot.source === source) {
                    return slot;
                } else if (!unusedSameKind) {
                    unusedSameKind = slot;
                }
                continue;
            }

            if (canSteal(slot, attenuation))
                steal = rankSteal(slot, steal);
        }

        if (unusedSameKind)
            return unusedSameKind;
        if (unusedAny)
            return unusedAny;
        if (slots.length < maxSlots)
            return null;
        return steal;
    }

    function parkSlot(slot) {
        const sound = slot.sound;

        sound.stop();
        sound.loops = 1;

        if (slot.spatial) {
            sound.manualAttenuation = 0;
            sound.position = Qt.vector3d(0, 0, 0);
        } else {
            sound.volume = 1.0;
        }

        slot.owner = null;
        slot.lastUsed = Date.now();
    }

    function revokeSlot(slot) {
        const owner = slot.owner;
        if (!owner)
            return;

        parkSlot(slot);
        if (typeof owner.slotRevoked === "function")
            owner.slotRevoked();
    }

    function retuneSlot(slot, spatial, parentNode) {
        if (slot.spatial === spatial)
            return true;

        slot.sound.stop();
        slot.sound.destroy();
        slot.sound = createSound(spatial, parentNode);
        slot.spatial = spatial;
        slot.source = "";

        if (!slot.sound) {
            slots.splice(slots.indexOf(slot), 1);
            return false;
        }

        return true;
    }

    function configureSlot(slot, owner) {
        const sound = slot.sound;

        if (slot.source !== owner.source) {
            sound.source = owner.source;
            slot.source = owner.source;
        }

        sound.loops = Qt.binding(() => owner.loops);

        if (slot.spatial) {
            sound.manualAttenuation = Qt.binding(() => owner.attenuation);
            // Entities live in meters, spatial audio works in centimeters.
            sound.position = Qt.binding(() => owner.ent ? owner.ent.position.times(100)
                                                        : Qt.vector3d(0, 0, 0));
        } else {
            sound.volume = Qt.binding(() => owner.volume);
        }

        slot.owner = owner;
        slot.lastUsed = Date.now();
    }

    function acquire(owner, parentNode) {
        if (!owner || !parentNode || !owner.source || owner.attenuation <= 0)
            return null;

        const spatial = owner.spatial;

        let slot = pickSlot(spatial, owner.source, owner.attenuation);
        if (slot) {
            revokeSlot(slot);
            if (!retuneSlot(slot, spatial, parentNode))
                return null;
        } else {
            if (slots.length >= maxSlots)
                return null;

            slot = createSlot(spatial, parentNode);
            if (!slot)
                return null;
        }

        slot.sound.stop();
        configureSlot(slot, owner);
        slot.sound.play();

        return slot;
    }

    function release(slot, owner) {
        if (slot && slot.owner === owner)
            parkSlot(slot);
    }
}
