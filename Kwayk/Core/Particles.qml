import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D

ParticleSystem3D {
    id: root

    readonly property var d_8to24table: [
        "#000000", "#0f0f0f", "#1f1f1f", "#2f2f2f", "#3f3f3f", "#4b4b4b", "#5b5b5b", "#6b6b6b",
        "#7b7b7b", "#8b8b8b", "#9b9b9b", "#ababab", "#bbbbbb", "#cbcbcb", "#dbdbdb", "#ebebeb",
        "#0f0b07", "#170f0b", "#1f170b", "#271b0f", "#2f2313", "#372b17", "#3f2f17", "#4b371b",
        "#533b1b", "#5b431f", "#634b1f", "#6b531f", "#73571f", "#7b5f23", "#836723", "#8f6f23",
        "#0b0b0f", "#13131b", "#1b1b27", "#272733", "#2f2f3f", "#37374b", "#3f3f57", "#474767",
        "#4f4f73", "#5b5b7f", "#63638b", "#6b6b97", "#7373a3", "#7b7baf", "#8383bb", "#8b8bcb",
        "#000000", "#070700", "#0b0b00", "#131300", "#1b1b00", "#232300", "#2b2b07", "#2f2f07",
        "#373707", "#3f3f07", "#474707", "#4b4b0b", "#53530b", "#5b5b0b", "#63630b", "#6b6b0f",
        "#070000", "#0f0000", "#170000", "#1f0000", "#270000", "#2f0000", "#370000", "#3f0000",
        "#470000", "#4f0000", "#570000", "#5f0000", "#670000", "#6f0000", "#770000", "#7f0000",
        "#131300", "#1b1b00", "#232300", "#2f2b00", "#372f00", "#433700", "#4b3b07", "#574307",
        "#5f4707", "#6b4b0b", "#77530f", "#835713", "#8b5b13", "#975f1b", "#a3631f", "#af6723",
        "#231307", "#2f170b", "#3b1f0f", "#4b2313", "#572b17", "#632f1f", "#733723", "#7f3b2b",
        "#8f4333", "#9f4f33", "#af632f", "#bf772f", "#cf8f2b", "#dfab27", "#efcb1f", "#fff31b",
        "#0b0700", "#1b1300", "#2b230f", "#372b13", "#47331b", "#533723", "#633f2b", "#6f4733",
        "#7f533f", "#8b5f47", "#9b6b53", "#a77b5f", "#b7876b", "#c3937b", "#d3a38b", "#e3b397",
        "#ab8ba3", "#9f7f97", "#937387", "#8b677b", "#7f5b6f", "#775363", "#6b4b57", "#5f3f4b",
        "#573743", "#4b2f37", "#43272f", "#371f23", "#2b171b", "#231313", "#170b0b", "#0f0707",
        "#bb739f", "#af6b8f", "#a35f83", "#975777", "#8b4f6b", "#7f4b5f", "#734353", "#6b3b4b",
        "#5f333f", "#532b37", "#47232b", "#3b1f23", "#2f171b", "#231313", "#170b0b", "#0f0707",
        "#dbc3bb", "#cbb3a7", "#bfa39b", "#af978b", "#a3877b", "#977b6f", "#876f5f", "#7b6353",
        "#6b5747", "#5f4b3b", "#533f33", "#433327", "#372b1f", "#271f17", "#1b130f", "#0f0b07",
        "#6f837b", "#677b6f", "#5f7367", "#576b5f", "#4f6357", "#475b4f", "#3f5347", "#374b3f",
        "#2f4337", "#2b3b2f", "#233327", "#1f2b1f", "#172317", "#0f1b13", "#0b130b", "#070b07",
        "#fff31b", "#efdf17", "#dbcb13", "#cbb70f", "#bba70f", "#ab970b", "#9b8307", "#8b7307",
        "#7b6307", "#6b5300", "#5b4700", "#4b3700", "#3b2b00", "#2b1f00", "#1b0f00", "#0b0700",
        "#0000ff", "#0b0bef", "#1313df", "#1b1bcf", "#2323bf", "#2b2baf", "#2f2f9f", "#2f2f8f",
        "#2f2f7f", "#2f2f6f", "#2f2f5f", "#2b2b4f", "#23233f", "#1b1b2f", "#13131f", "#0b0b0f",
        "#2b0000", "#3b0000", "#4b0700", "#5f0700", "#6f0f00", "#7f1707", "#931f07", "#a3270b",
        "#b7330f", "#c34b1b", "#cf632b", "#db7f3b", "#e3974f", "#e7ab5f", "#efbf77", "#f7d38b",
        "#a77b3b", "#b79b37", "#c7c337", "#e7e357", "#7fbfff", "#abe7ff", "#d7ffff", "#670000",
        "#8b0000", "#b30000", "#d70000", "#ff0000", "#fff393", "#fff7c7", "#ffffff", "#9f5b53"
    ];

    readonly property var ramp1: [0x6f, 0x6d, 0x6b, 0x69, 0x67, 0x65, 0x63, 0x61]
    readonly property var ramp2: [0x6f, 0x6e, 0x6d, 0x6c, 0x6b, 0x6a, 0x68, 0x66]
    readonly property var ramp3: [0x6d, 0x6b, 6, 5, 4, 3]

    property int tracercount: 0

    Component {
        id: particleComponent
        Model {
            source: "#Cube"
            scale: Qt.vector3d(0.00025, 0.00025, 0.00025)
            materials: PrincipledMaterial {}
        }
    }

    ModelParticle3D {
        id: gravParticle
        delegate: particleComponent
        maxAmount: 4000
        fadeOutEffect: Particle3D.FadeOpacity
    }

    ModelParticle3D {
        id: fireParticle
        delegate: particleComponent
        maxAmount: 4000
        fadeOutEffect: Particle3D.FadeScale
    }

    ModelParticle3D {
        id: bloodParticle
        delegate: particleComponent
        maxAmount: 4000
        fadeOutEffect: Particle3D.FadeScale
    }

    ModelParticle3D {
        id: explosionParticle
        delegate: particleComponent
        maxAmount: 2000
        fadeOutEffect: Particle3D.FadeScale
    }

    ModelParticle3D {
        id: explosion2Particle
        delegate: particleComponent
        maxAmount: 2000
        fadeOutEffect: Particle3D.FadeScale
    }

    ModelParticle3D {
        id: tracerParticle
        delegate: particleComponent
        maxAmount: 4000
        fadeOutEffect: Particle3D.FadeScale
    }

    SpriteParticle3D {
        id: explodeParticle
        sprite: Texture {
            source: "qrc:/Assets/images/s_explod.png"
        }
        spriteSequence: SpriteSequence3D {
            frameCount: 6
            interpolate: true
        }
        billboard: true
        particleScale: 0.5
    }

    SpriteParticle3D {
        id: bubbleParticle
        sprite: Texture {
            source: "qrc:/Assets/images/s_bubble.png"
        }
        spriteSequence: SpriteSequence3D {
            frameCount: 2
            interpolate: true
        }
        billboard: true
        particleScale: 0.25
    }

    ParticleEmitter3D {
        id: gravParticleEmitter
        particle: gravParticle
        lifeSpan: 300
        lifeSpanVariation: 300
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: teleportSplashParticleEmitter
        particle: gravParticle
        lifeSpan: 400
        lifeSpanVariation: 200
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: lavaSplashParticleEmitter
        particle: gravParticle
        lifeSpan: 2500
        lifeSpanVariation: 500
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: fireParticleEmitter
        particle: fireParticle
        lifeSpan: 1000
        lifeSpanVariation: 200
    }

    ParticleEmitter3D {
        id: bloodParticleEmitter
        particle: bloodParticle
        lifeSpan: 2000
    }

    ParticleEmitter3D {
        id: explodeParticleEmitter
        particle: explodeParticle
        lifeSpan: 600
    }

    ParticleEmitter3D {
        id: bubbleParticleEmitter
        particle: bubbleParticle
        lifeSpan: 10000
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: explosionParticleEmitter
        particle: explosionParticle
        lifeSpan: 600
        lifeSpanVariation: 200
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: explosion2ParticleEmitter
        particle: explosion2Particle
        lifeSpan: 400
        lifeSpanVariation: 100
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: tracerParticleEmitter
        particle: tracerParticle
        lifeSpan: 500
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    ParticleEmitter3D {
        id: tracer3ParticleEmitter
        particle: tracerParticle
        lifeSpan: 300
        velocity: VectorDirection3D {
            direction: Qt.vector3d(0, 0, 0)
        }
    }

    Gravity3D {
        direction: Qt.vector3d(0, -1, 0)
        magnitude: vars.sv_gravity.value / 100 * 0.05
        particles: [gravParticle, explosionParticle, bloodParticle]
    }

    Gravity3D {
        direction: Qt.vector3d(0, 1, 0)
        magnitude: vars.sv_gravity.value / 100 * 0.05
        particles: [fireParticle, explosion2Particle]
    }

    Gravity3D {
        direction: Qt.vector3d(1, 1, 1)
        magnitude: 4 * 0.16
        particles: [explosionParticle]
    }

    Gravity3D {
        direction: Qt.vector3d(-1, -1, -1)
        magnitude: 0.16
        particles: [explosion2Particle]
    }

    Wander3D {
        uniqueAmount: Qt.vector3d(0.05, 0.02, 0.05)
        uniquePace: Qt.vector3d(0.2, 0.05, 0.2)
        uniqueAmountVariation: 0.8
        uniquePaceVariation: 0.5
        particles: [bubbleParticle]
    }

    function calcParticleScale(org) {
        let scale = org.minus(camera.position).times(camera.forward);
        scale = scale.x + scale.y + scale.z;
        if (scale < 0.2)
            scale = 1;
        else
            scale = 1 + scale * 0.16;
        return scale;
    }

    function adjustParticleGamma(particle, gamma) {
        particle.color.r = Math.pow(particle.color.r, gamma);
        particle.color.g = Math.pow(particle.color.g, gamma);
        particle.color.b = Math.pow(particle.color.b, gamma);
    }

    function runParticleEffect(pos, dir, color, count) {
        for (let i = 0; i < count; ++i) {
            const org = Qt.vector3d(pos.x + (Math.random() * 16 - 8) / 100,
                                    pos.y + (Math.random() * 16 - 8) / 100,
                                    pos.z + (Math.random() * 16 - 8) / 100);
            const ramp = (color & 0xf8) + Math.floor(Math.random() * 8.0);
            gravParticleEmitter.particleScale = calcParticleScale(org);
            gravParticleEmitter.velocity.direction = dir.times(10);
            gravParticle.color = d_8to24table[ramp];
            adjustParticleGamma(gravParticle, 0.5);
            gravParticleEmitter.burst(1, 0, org);
        }
    }

    function lavaSplash(pos) {
        for (let i = -16; i < 16; ++i) {
            for (let j = -16; j < 16; ++j) {
                for (let k = 0; k < 1; ++k) {
                    let dir = Qt.vector3d(j * 8, 256, -i * 8);
                    const org = pos.plus(Qt.vector3d((pos.x + dir.x) / 100,
                                                     (pos.y + Math.random() * 64) / 100,
                                                     (pos.z + dir.z) / 100));
                    const vel = (50 + Math.random() * 64) / 100;
                    dir = dir.normalized();
                    lavaSplashParticleEmitter.particleScale = calcParticleScale(org);
                    lavaSplashParticleEmitter.velocity.direction = dir.times(vel);
                    gravParticle.color = d_8to24table[224 + Math.floor(Math.random() * 8)];
                    adjustParticleGamma(gravParticle, 0.5);
                    lavaSplashParticleEmitter.burst(1, 0, org);
                }
            }
        }
    }

    function teleportSplash(pos) {
        for (let i = -16; i < 16; i += 4) {
            for (let j = -16; j < 16; j += 4) {
                for (let k = -24; k < 32; k += 4) {
                    const dir = Qt.vector3d(j, k, i).times(8).normalized();
                    const org = pos.plus(Qt.vector3d((i + Math.random() * 4) / 100,
                                                     (k + Math.random() * 4) / 100,
                                                     (j + Math.random() * 4) / 100));
                    const vel = (50 + Math.random() * 64) / 100;
                    teleportSplashParticleEmitter.particleScale = calcParticleScale(org);
                    teleportSplashParticleEmitter.velocity.direction = dir.times(vel);
                    gravParticle.color = d_8to24table[7 + Math.floor(Math.random() * 8)];
                    adjustParticleGamma(gravParticle, 0.5);
                    teleportSplashParticleEmitter.burst(1, 0, org);
                }
            }
        }
    }

    function particle(pos, dir, color, count) {
        if (count === 255)
            particleExplosion(pos)
        else
            runParticleEffect(pos, dir, color, count);
    }

    function rocketTrail(start, end, accumulator, type) {
        let vec = end.minus(start);
        let step;
        if (type === 4)
            step = 0.06;
        else
            step = 0.03;

        accumulator.value += vec.length();
        const count = Math.floor(accumulator.value / step);
        accumulator.value -= count * step;

        if (count <= 0)
            return;

        vec = vec.normalized().times(step);

        for (let i = 0; i < count; ++i) {
            let org;
            const ramp = Math.floor(Math.random() * 4.0);
            switch (type) {
            // rocket
            case 0:
                org = Qt.vector3d(start.x + (Math.random() * 6 - 3) / 100,
                                  start.y + (Math.random() * 6 - 3) / 100,
                                  start.z + (Math.random() * 6 - 3) / 100);
                fireParticleEmitter.particleScale = calcParticleScale(org);
                fireParticle.color = d_8to24table[ramp3[ramp]];
                adjustParticleGamma(fireParticle, 0.5);
                fireParticleEmitter.burst(1, 0, org);
                break;
            // grenade
            case 1:
                org = Qt.vector3d(start.x + (Math.random() * 6 - 3) / 100,
                                  start.y + (Math.random() * 6 - 3) / 100,
                                  start.z + (Math.random() * 6 - 3) / 100);
                fireParticleEmitter.particleScale = calcParticleScale(org);
                fireParticle.color = d_8to24table[ramp3[ramp + 2]];
                adjustParticleGamma(fireParticle, 0.5);
                fireParticleEmitter.burst(1, 0, org);
                break;
            // gib/zomgib
            case 2:
            case 4:
                org = Qt.vector3d(start.x + (Math.random() * 6 - 3) / 100,
                                  start.y + (Math.random() * 6 - 3) / 100,
                                  start.z + (Math.random() * 6 - 3) / 100);
                bloodParticleEmitter.particleScale = calcParticleScale(org);
                bloodParticle.color = d_8to24table[67 + ramp];
                adjustParticleGamma(bloodParticle, 0.5);
                bloodParticleEmitter.burst(1, 0, org);
                break;
            //tracer
            case 3:
            case 5:
                if (type === 3)
                    tracerParticle.color = d_8to24table[52 + ((tracercount & 4) << 1)];
                else
                    tracerParticle.color = d_8to24table[230 + ((tracercount & 4) << 1)];
                adjustParticleGamma(tracerParticle, 0.5);
                tracercount++;
                if (tracercount & 1)
                    tracerParticleEmitter.velocity.direction = Qt.vector3d(3 * vec.z, -3 * vec.x, 0);
                else
                    tracerParticleEmitter.velocity.direction = Qt.vector3d(-3 * vec.z, 3 * vec.x, 0);
                org = start;
                tracerParticleEmitter.particleScale = calcParticleScale(org);
                tracerParticleEmitter.burst(1, 0, org);
                break;
            case 6:
                tracerParticle.color = d_8to24table[152 + Math.floor(Math.random() * 4)];
                adjustParticleGamma(tracerParticle, 0.5);
                org = Qt.vector3d(start.x + (Math.random() * 16 - 8) / 100,
                                  start.y + (Math.random() * 16 - 8) / 100,
                                  start.z + (Math.random() * 16 - 8) / 100);
                tracer3ParticleEmitter.particleScale = calcParticleScale(org);
                tracer3ParticleEmitter.burst(1, 0, org);
                break;
            }

            start = start.plus(vec);
        }
    }

    function particleExplosion(pos) {
        for (let i = 0; i < 512; ++i) {
            const org = Qt.vector3d(pos.x + (Math.random() * 32 - 16) / 100,
                                    pos.y + (Math.random() * 32 - 16) / 100,
                                    pos.z + (Math.random() * 32 - 16) / 100);
            const ramp = Math.floor(Math.random() * 4.0);
            explosionParticleEmitter.particleScale = calcParticleScale(org);
            explosionParticle.color = d_8to24table[ramp1[ramp]];
            explosionParticleEmitter.velocity.direction = Qt.vector3d((Math.random() * 512 - 256) / 100,
                                                                      (Math.random() * 512 - 256) / 100,
                                                                      (Math.random() * 512 - 256) / 100);
            explosionParticleEmitter.burst(1, 0, org);
        }

        for (let i = 0; i < 512; ++i) {
            const org = Qt.vector3d(pos.x + (Math.random() * 32 - 16) / 100,
                                    pos.y + (Math.random() * 32 - 16) / 100,
                                    pos.z + (Math.random() * 32 - 16) / 100);
            const ramp = Math.floor(Math.random() * 4.0);
            explosion2ParticleEmitter.particleScale = calcParticleScale(org);
            explosion2Particle.color = d_8to24table[ramp2[ramp]];
            explosion2ParticleEmitter.velocity.direction = Qt.vector3d((Math.random() * 512 - 256) / 100,
                                                                       (Math.random() * 512 - 256) / 100,
                                                                       (Math.random() * 512 - 256) / 100);
            explosion2ParticleEmitter.burst(1, 0, org);
        }

        explodeParticleEmitter.burst(1, 0, pos);
    }

    function spawnBubble(pos) {
        bubbleParticleEmitter.velocity.direction = Qt.vector3d(0, 0.15, 0);
        bubbleParticleEmitter.burst(1, 0, pos);
    }
}
