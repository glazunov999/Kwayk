import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics
import QtQuick3D.JoltPhysics.Helpers

Ragdoll {
    id: root

    readonly property real tscale: 0.375

    motionType: Body.Dynamic
    motionQuality: Body.LinearCast

    parts: [
        mixamorig_Hips,
        mixamorig_Spine,
        mixamorig_Spine1,
        mixamorig_Spine2,
        mixamorig_Neck,
        mixamorig_Head,
        mixamorig_LeftShoulder,
        mixamorig_LeftArm,
        mixamorig_LeftForeArm,
        mixamorig_RightShoulder,
        mixamorig_RightArm,
        mixamorig_RightForeArm,
        mixamorig_LeftUpLeg,
        mixamorig_LeftLeg,
        mixamorig_LeftFoot,
        mixamorig_RightUpLeg,
        mixamorig_RightLeg,
        mixamorig_RightFoot
    ]

    RagdollPart {
        id: mixamorig_Hips
        jointName: "mixamorig:Hips"
        mass: 10
        position: Qt.vector3d(2.09808e-09, -2.7036e-05, 0.00777569).times(tscale)
        rotation: Qt.quaternion(0.707107, 0.707107, 5.33851e-08, 5.33851e-08)
        shape: RotatedTranslatedShape {
            eulerRotation: Qt.vector3d(0, 0, -90)
            shape: CapsuleShape {
                diameter: 0.18 * tscale
                height: 0.02 * tscale
            }
        }
        RagdollPart {
            id: mixamorig_Spine
            jointName: "mixamorig:Spine"
            mass: 6
            position: Qt.vector3d(3.65803e-10, 0.0711312, -0.00242279).times(tscale)
            rotation: Qt.quaternion(0.999855, -0.017023, -4.54571e-08, -1.79647e-09)
            shape: RotatedTranslatedShape {
                position: Qt.vector3d(0, 0.02, 0.01).times(tscale)
                eulerRotation: Qt.vector3d(0, 0, -90)
                shape: CapsuleShape {
                    diameter: 0.14 * tscale
                    height: 0.03 * tscale
                }
            }
            constraintToParent: SwingTwistConstraintSettings {
                position1: Qt.vector3d(3.65803e-10, 0.0711312, -0.00242279).times(tscale)
                position2: Qt.vector3d(3.65803e-10, 0.0711312, -0.00242279).times(tscale)
                twistAxis1: Qt.vector3d(0, 1, 0)
                twistAxis2: Qt.vector3d(0, 1, 0)
                planeAxis1: Qt.vector3d(0, 0, 1)
                planeAxis2: Qt.vector3d(0, 0, 1)
                twistMinAngle: -12
                twistMaxAngle: 12
                normalHalfConeAngle: 28
                planeHalfConeAngle: 28
                maxFrictionTorque: 0.015 * tscale * tscale
            }
            RagdollPart {
                id: mixamorig_Spine1
                jointName: "mixamorig:Spine1"
                mass: 5
                position: Qt.vector3d(-2.81164e-14, 0.0830344, 2.9104e-11).times(tscale)
                rotation: Qt.quaternion(1, 1.86265e-09, 1.78156e-15, -3.68461e-17)
                shape: RotatedTranslatedShape {
                    position: Qt.vector3d(0, 0.04, 0.02).times(tscale)
                    eulerRotation: Qt.vector3d(0, 0, -90)
                    shape: CapsuleShape {
                        diameter: 0.18 * tscale
                        height: 0.06 * tscale
                    }
                }
                constraintToParent: SwingTwistConstraintSettings {
                    position1: Qt.vector3d(-2.81164e-14, 0.0830344, 2.9104e-11).times(tscale)
                    position2: Qt.vector3d(-2.81164e-14, 0.0830344, 2.9104e-11).times(tscale)
                    twistAxis1: Qt.vector3d(0, 1, 0)
                    twistAxis2: Qt.vector3d(0, 1, 0)
                    planeAxis1: Qt.vector3d(0, 0, 1)
                    planeAxis2: Qt.vector3d(0, 0, 1)
                    twistMinAngle: -12
                    twistMaxAngle: 12
                    normalHalfConeAngle: 28
                    planeHalfConeAngle: 28
                    maxFrictionTorque: 0.015 * tscale * tscale
                }
                RagdollPart {
                    id: mixamorig_Spine2
                    jointName: "mixamorig:Spine2"
                    mass: 5
                    position: Qt.vector3d(-2.82552e-14, 0.0948965, -4.36557e-10).times(tscale)
                    rotation: Qt.quaternion(1, -1.86265e-09, -1.77636e-15, -5.82519e-17)
                    shape: RotatedTranslatedShape {
                        position: Qt.vector3d(0, 0.05, 0).times(tscale)
                        eulerRotation: Qt.vector3d(0, 0, -90)
                        shape: CapsuleShape {
                            diameter: 0.18 * tscale
                            height: 0.12 * tscale
                        }
                    }
                    constraintToParent: SwingTwistConstraintSettings {
                        position1: Qt.vector3d(-2.82552e-14, 0.0948965, -4.36557e-10).times(tscale)
                        position2: Qt.vector3d(-2.82552e-14, 0.0948965, -4.36557e-10).times(tscale)
                        twistAxis1: Qt.vector3d(0, 1, 0)
                        twistAxis2: Qt.vector3d(0, 1, 0)
                        planeAxis1: Qt.vector3d(0, 0, 1)
                        planeAxis2: Qt.vector3d(0, 0, 1)
                        twistMinAngle: -12
                        twistMaxAngle: 12
                        normalHalfConeAngle: 28
                        planeHalfConeAngle: 28
                        maxFrictionTorque: 0.015 * tscale * tscale
                    }
                    RagdollPart {
                        id: mixamorig_Neck
                        jointName: "mixamorig:Neck"
                        mass: 3
                        position: Qt.vector3d(1.05471e-15, 0.106758, -1.20781e-08).times(tscale)
                        rotation: Qt.quaternion(0.999855, 0.0170231, -1.05517e-07, -7.7393e-10)
                        shape: RotatedTranslatedShape {
                            position: Qt.vector3d(0, 0.06, 0.02).times(tscale)
                            eulerRotation: Qt.vector3d(30, 0, 0)
                            shape: CapsuleShape {
                                diameter: 0.08 * tscale
                                height: 0.02 * tscale
                            }
                        }
                        constraintToParent: SwingTwistConstraintSettings {
                            position1: Qt.vector3d(1.05471e-15, 0.106758, -1.20781e-08).times(tscale)
                            position2: Qt.vector3d(1.05471e-15, 0.106758, -1.20781e-08).times(tscale)
                            twistAxis1: Qt.vector3d(0, 1, 0)
                            twistAxis2: Qt.vector3d(0, 1, 0)
                            planeAxis1: Qt.vector3d(0, 0, 1)
                            planeAxis2: Qt.vector3d(0, 0, 1)
                            twistMinAngle: -5
                            twistMaxAngle: 5
                            normalHalfConeAngle: 8
                            planeHalfConeAngle: 8
                            maxFrictionTorque: 0.01 * tscale * tscale
                        }
                        RagdollPart {
                            id: mixamorig_Head
                            jointName: "mixamorig:Head"
                            mass: 4
                            position: Qt.vector3d(4.12759e-09, 0.0811181, 0.0273358).times(tscale)
                            rotation: Qt.quaternion(1, -6.40181e-09, 1.19209e-07, -7.63155e-16)
                            shape: RotatedTranslatedShape {
                                position: Qt.vector3d(0, 0.05, 0.02).times(tscale)
                                eulerRotation: Qt.vector3d(-20, 0, 0)
                                shape: TaperedCapsuleShape {
                                    topDiameter: 0.14 * tscale
                                    bottomDiameter: 0.12 * tscale
                                    height: 0.07 * tscale
                                }
                            }
                            constraintToParent: SwingTwistConstraintSettings {
                                position1: Qt.vector3d(4.12759e-09, 0.0811181, 0.0273358).times(tscale)
                                position2: Qt.vector3d(4.12759e-09, 0.0811181, 0.0273358).times(tscale)
                                twistAxis1: Qt.vector3d(0, 1, 0)
                                twistAxis2: Qt.vector3d(0, 1, 0)
                                planeAxis1: Qt.vector3d(0, 0, 1)
                                planeAxis2: Qt.vector3d(0, 0, 1)
                                twistMinAngle: -5
                                twistMaxAngle: 5
                                normalHalfConeAngle: 10
                                planeHalfConeAngle: 10
                                maxFrictionTorque: 0.008 * tscale * tscale
                            }
                        }
                    }
                    RagdollPart {
                        id: mixamorig_LeftShoulder
                        jointName: "mixamorig:LeftShoulder"
                        mass: 0.5
                        position: Qt.vector3d(0.0536236, 0.0919823, -0.000307319).times(tscale)
                        rotation: Qt.quaternion(-0.432992, -0.556671, -0.43513, 0.55973)
                        shape: RotatedTranslatedShape {
                            position: Qt.vector3d(0, 0.12, 0).times(tscale)
                            shape: CapsuleShape {
                                diameter: 0.1 * tscale
                                height: 0.04 * tscale
                            }
                        }
                        constraintToParent: SwingTwistConstraintSettings {
                            position1: Qt.vector3d(0.0536236, 0.0919823, -0.000307319).times(tscale)
                            position2: Qt.vector3d(0.0536236, 0.0919823, -0.000307319).times(tscale)
                            twistAxis1: Qt.vector3d(0, 1, 0)
                            twistAxis2: Qt.vector3d(0, 1, 0)
                            planeAxis1: Qt.vector3d(0, 0, 1)
                            planeAxis2: Qt.vector3d(0, 0, 1)
                            twistMinAngle: -15
                            twistMaxAngle: 15
                            normalHalfConeAngle: 20
                            planeHalfConeAngle: 20
                            maxFrictionTorque: 0.02 * tscale * tscale
                        }
                        RagdollPart {
                            id: mixamorig_LeftArm
                            jointName: "mixamorig:LeftArm"
                            mass: 3
                            position: Qt.vector3d(-4.94765e-10, 0.117037, -2.18919e-07).times(tscale)
                            rotation: Qt.quaternion(0.995581, -0.0926645, -0.00141008, 0.0151498)
                            shape: RotatedTranslatedShape {
                                position: Qt.vector3d(0.01, 0.12, -0.01).times(tscale)
                                shape: CapsuleShape {
                                    diameter: 0.08 * tscale
                                    height: 0.06 * tscale
                                }
                            }
                            constraintToParent: SwingTwistConstraintSettings {
                                position1: Qt.vector3d(-4.94765e-10, 0.117037, -2.18919e-07).times(tscale)
                                position2: Qt.vector3d(-4.94765e-10, 0.117037, -2.18919e-07).times(tscale)
                                twistAxis1: Qt.vector3d(0, 1, 0)
                                twistAxis2: Qt.vector3d(0, 1, 0)
                                planeAxis1: Qt.vector3d(0, 0, 1)
                                planeAxis2: Qt.vector3d(0, 0, 1)
                                twistMinAngle: -20
                                twistMaxAngle: 20
                                normalHalfConeAngle: 40
                                planeHalfConeAngle: 40
                                maxFrictionTorque: 0.008 * tscale * tscale
                            }
                            RagdollPart {
                                id: mixamorig_LeftForeArm
                                jointName: "mixamorig:LeftForeArm"
                                mass: 2
                                position: Qt.vector3d(-7.21775e-09, 0.164299, 6.82776e-08).times(tscale)
                                rotation: Qt.quaternion(0.999338, -0.0362753, 0.000102725, -0.00283042)
                                shape: RotatedTranslatedShape {
                                    position: Qt.vector3d(0, 0.14, 0).times(tscale)
                                    shape: CapsuleShape {
                                        diameter: 0.06 * tscale
                                        height: 0.2 * tscale
                                    }
                                }
                                constraintToParent: SwingTwistConstraintSettings {
                                    position1: Qt.vector3d(-7.21775e-09, 0.164299, 6.82776e-08).times(tscale)
                                    position2: Qt.vector3d(-7.21775e-09, 0.164299, 6.82776e-08).times(tscale)
                                    twistAxis1: Qt.vector3d(0, 1, 0)
                                    twistAxis2: Qt.vector3d(0, 1, 0)
                                    planeAxis1: Qt.vector3d(0, 0, 1)
                                    planeAxis2: Qt.vector3d(0, 0, 1)
                                    twistMinAngle: -5
                                    twistMaxAngle: 5
                                    normalHalfConeAngle: 80
                                    planeHalfConeAngle: 15
                                    maxFrictionTorque: 0.006 * tscale * tscale
                                }
                            }
                        }
                    }
                    RagdollPart {
                        id: mixamorig_RightShoulder
                        jointName: "mixamorig:RightShoulder"
                        mass: 0.5
                        position: Qt.vector3d(-0.0536236, 0.0919959, -0.000698807).times(tscale)
                        rotation: Qt.quaternion(0.431598, 0.554627, -0.436643, 0.561654)
                        shape: RotatedTranslatedShape {
                            position: Qt.vector3d(0, 0.12, 0).times(tscale)
                            shape: CapsuleShape {
                                diameter: 0.1 * tscale
                                height: 0.04 * tscale
                            }
                        }
                        constraintToParent: SwingTwistConstraintSettings {
                            position1: Qt.vector3d(-0.0536236, 0.0919959, -0.000698807).times(tscale)
                            position2: Qt.vector3d(-0.0536236, 0.0919959, -0.000698807).times(tscale)
                            twistAxis1: Qt.vector3d(0, 1, 0)
                            twistAxis2: Qt.vector3d(0, 1, 0)
                            planeAxis1: Qt.vector3d(0, 0, 1)
                            planeAxis2: Qt.vector3d(0, 0, 1)
                            twistMinAngle: -15
                            twistMaxAngle: 15
                            normalHalfConeAngle: 20
                            planeHalfConeAngle: 20
                            maxFrictionTorque: 0.02 * tscale * tscale
                        }
                        RagdollPart {
                            id: mixamorig_RightArm
                            jointName: "mixamorig:RightArm"
                            mass: 3
                            position: Qt.vector3d(-3.60887e-09, 0.117037, 1.72382e-07).times(tscale)
                            rotation: Qt.quaternion(0.995513, -0.0924442, 0.0018697, -0.020133)
                            shape: RotatedTranslatedShape {
                                position: Qt.vector3d(-0.01, 0.12, -0.01).times(tscale)
                                shape: CapsuleShape {
                                    diameter: 0.08 * tscale
                                    height: 0.06 * tscale
                                }
                            }
                            constraintToParent: SwingTwistConstraintSettings {
                                position1: Qt.vector3d(-3.60887e-09, 0.117037, 1.72382e-07).times(tscale)
                                position2: Qt.vector3d(-3.60887e-09, 0.117037, 1.72382e-07).times(tscale)
                                twistAxis1: Qt.vector3d(0, 1, 0)
                                twistAxis2: Qt.vector3d(0, 1, 0)
                                planeAxis1: Qt.vector3d(0, 0, 1)
                                planeAxis2: Qt.vector3d(0, 0, 1)
                                twistMinAngle: -20
                                twistMaxAngle: 20
                                normalHalfConeAngle: 40
                                planeHalfConeAngle: 40
                                maxFrictionTorque: 0.008 * tscale * tscale
                            }
                            RagdollPart {
                                id: mixamorig_RightForeArm
                                jointName: "mixamorig:RightForeArm"
                                mass: 2
                                position: Qt.vector3d(-3.49246e-09, 0.164313, 5.61122e-08).times(tscale)
                                rotation: Qt.quaternion(0.999347, -0.0361013, 4.60201e-05, -0.00127691)
                                shape: RotatedTranslatedShape {
                                    position: Qt.vector3d(0, 0.14, 0).times(tscale)
                                    shape: CapsuleShape {
                                        diameter: 0.06 * tscale
                                        height: 0.2 * tscale
                                    }
                                }
                                constraintToParent: SwingTwistConstraintSettings {
                                    position1: Qt.vector3d(-3.49246e-09, 0.164313, 5.61122e-08).times(tscale)
                                    position2: Qt.vector3d(-3.49246e-09, 0.164313, 5.61122e-08).times(tscale)
                                    twistAxis1: Qt.vector3d(0, 1, 0)
                                    twistAxis2: Qt.vector3d(0, 1, 0)
                                    planeAxis1: Qt.vector3d(0, 0, 1)
                                    planeAxis2: Qt.vector3d(0, 0, 1)
                                    twistMinAngle: -5
                                    twistMaxAngle: 5
                                    normalHalfConeAngle: 80
                                    planeHalfConeAngle: 15
                                    maxFrictionTorque: 0.006 * tscale * tscale
                                }
                            }
                        }
                    }
                }
            }
        }
        RagdollPart {
            id: mixamorig_LeftUpLeg
            jointName: "mixamorig:LeftUpLeg"
            mass: 5
            position: Qt.vector3d(0.0572751, -0.0396206, 0.00348879).times(tscale)
            rotation: Qt.quaternion(-0.0121791, -1.72047e-05, -0.00141182, 0.999925)
            shape: RotatedTranslatedShape {
                position: Qt.vector3d(0, 0.18, 0).times(tscale)
                shape: CapsuleShape {
                    diameter: 0.1 * tscale
                    height: 0.24 * tscale
                }
            }
            constraintToParent: SwingTwistConstraintSettings {
                position1: Qt.vector3d(0.0572751, -0.0396206, 0.00348879).times(tscale)
                position2: Qt.vector3d(0.0572751, -0.0396206, 0.00348879).times(tscale)
                twistAxis1: Qt.vector3d(0, -1, 0)
                twistAxis2: Qt.vector3d(0, -1, 0)
                planeAxis1: Qt.vector3d(0, 0, 1)
                planeAxis2: Qt.vector3d(0, 0, 1)
                twistMinAngle: -12
                twistMaxAngle: 12
                normalHalfConeAngle: 22
                planeHalfConeAngle: 22
                maxFrictionTorque: 0.016 * tscale * tscale
            }
            RagdollPart {
                id: mixamorig_LeftLeg
                jointName: "mixamorig:LeftLeg"
                mass: 4
                position: Qt.vector3d(9.51628e-09, 0.342724, 2.02271e-10).times(tscale)
                rotation: Qt.quaternion(0.999823, -0.00733447, 0.0001273, -0.0173456)
                shape: RotatedTranslatedShape {
                    position: Qt.vector3d(0, 0.16, 0).times(tscale)
                    shape: CapsuleShape {
                        diameter: 0.08 * tscale
                        height: 0.28 * tscale
                    }
                }
                constraintToParent: SwingTwistConstraintSettings {
                    position1: Qt.vector3d(9.51628e-09, 0.342724, 2.02271e-10).times(tscale)
                    position2: Qt.vector3d(9.51628e-09, 0.342724, 2.02271e-10).times(tscale)
                    twistAxis1: Qt.vector3d(0, -1, 0)
                    twistAxis2: Qt.vector3d(0, -1, 0)
                    planeAxis1: Qt.vector3d(0, 0, 1)
                    planeAxis2: Qt.vector3d(0, 0, 1)
                    twistMinAngle: -2
                    twistMaxAngle: 2
                    normalHalfConeAngle: 45
                    planeHalfConeAngle: 6
                    maxFrictionTorque: 0.012 * tscale * tscale
                }
                RagdollPart {
                    id: mixamorig_LeftFoot
                    jointName: "mixamorig:LeftFoot"
                    mass: 1
                    position: Qt.vector3d(-6.60771e-09, 0.303422, 1.42245e-09).times(tscale)
                    rotation: Qt.quaternion(0.891798, 0.44703, 0.0623331, -0.0312456)
                    shape: RotatedTranslatedShape {
                        position: Qt.vector3d(0, 0.08, 0).times(tscale)
                        shape: CapsuleShape {
                            diameter: 0.08 * tscale
                            height: 0.06 * tscale
                        }
                    }
                    constraintToParent: SwingTwistConstraintSettings {
                        position1: Qt.vector3d(-6.60771e-09, 0.303422, 1.42245e-09).times(tscale)
                        position2: Qt.vector3d(-6.60771e-09, 0.303422, 1.42245e-09).times(tscale)
                        twistAxis1: Qt.vector3d(0, -1, 0)
                        twistAxis2: Qt.vector3d(0, -1, 0)
                        planeAxis1: Qt.vector3d(0, 0, 1)
                        planeAxis2: Qt.vector3d(0, 0, 1)
                        twistMinAngle: -1
                        twistMaxAngle: 1
                        normalHalfConeAngle: 2
                        planeHalfConeAngle: 4
                        maxFrictionTorque: 0.04 * tscale * tscale
                    }
                }
            }
        }
        RagdollPart {
            id: mixamorig_RightUpLeg
            jointName: "mixamorig:RightUpLeg"
            mass: 5
            position: Qt.vector3d(-0.0572751, -0.0396205, 0.00474689).times(tscale)
            rotation: Qt.quaternion(0.0121788, 4.52287e-05, -0.00371725, 0.999919)
            shape: RotatedTranslatedShape {
                position: Qt.vector3d(0, 0.18, 0).times(tscale)
                shape: CapsuleShape {
                    diameter: 0.1 * tscale
                    height: 0.24 * tscale
                }
            }
            constraintToParent: SwingTwistConstraintSettings {
                position1: Qt.vector3d(-0.0572751, -0.0396205, 0.00474689).times(tscale)
                position2: Qt.vector3d(-0.0572751, -0.0396205, 0.00474689).times(tscale)
                twistAxis1: Qt.vector3d(0, -1, 0)
                twistAxis2: Qt.vector3d(0, -1, 0)
                planeAxis1: Qt.vector3d(0, 0, 1)
                planeAxis2: Qt.vector3d(0, 0, 1)
                twistMinAngle: -12
                twistMaxAngle: 12
                normalHalfConeAngle: 22
                planeHalfConeAngle: 22
                maxFrictionTorque: 0.016 * tscale * tscale
            }
            RagdollPart {
                id: mixamorig_RightLeg
                jointName: "mixamorig:RightLeg"
                mass: 4
                position: Qt.vector3d(-2.73596e-09, 0.342732, 3.73294e-10).times(tscale)
                rotation: Qt.quaternion(0.999849, -0.000636219, -1.09989e-05, 0.0173458)
                shape: RotatedTranslatedShape {
                    position: Qt.vector3d(0, 0.16, 0).times(tscale)
                    shape: CapsuleShape {
                        diameter: 0.08 * tscale
                        height: 0.28 * tscale
                    }
                }
                constraintToParent: SwingTwistConstraintSettings {
                    position1: Qt.vector3d(-2.73596e-09, 0.342732, 3.73294e-10).times(tscale)
                    position2: Qt.vector3d(-2.73596e-09, 0.342732, 3.73294e-10).times(tscale)
                    twistAxis1: Qt.vector3d(0, -1, 0)
                    twistAxis2: Qt.vector3d(0, -1, 0)
                    planeAxis1: Qt.vector3d(0, 0, 1)
                    planeAxis2: Qt.vector3d(0, 0, 1)
                    twistMinAngle: -2
                    twistMaxAngle: 2
                    normalHalfConeAngle: 45
                    planeHalfConeAngle: 6
                    maxFrictionTorque: 0.012 * tscale * tscale
                }
                RagdollPart {
                    id: mixamorig_RightFoot
                    jointName: "mixamorig:RightFoot"
                    mass: 1
                    position: Qt.vector3d(5.36524e-09, 0.303387, 3.47598e-10).times(tscale)
                    rotation: Qt.quaternion(0.894955, 0.440459, -0.0637662, 0.0313831)
                    shape: RotatedTranslatedShape {
                        position: Qt.vector3d(0, 0.08, 0).times(tscale)
                        shape: CapsuleShape {
                            diameter: 0.08 * tscale
                            height: 0.06 * tscale
                        }
                    }
                    constraintToParent: SwingTwistConstraintSettings {
                        position1: Qt.vector3d(5.36524e-09, 0.303387, 3.47598e-10).times(tscale)
                        position2: Qt.vector3d(5.36524e-09, 0.303387, 3.47598e-10).times(tscale)
                        twistAxis1: Qt.vector3d(0, -1, 0)
                        twistAxis2: Qt.vector3d(0, -1, 0)
                        planeAxis1: Qt.vector3d(0, 0, 1)
                        planeAxis2: Qt.vector3d(0, 0, 1)
                        twistMinAngle: -1
                        twistMaxAngle: 1
                        normalHalfConeAngle: 2
                        planeHalfConeAngle: 4
                        maxFrictionTorque: 0.04 * tscale * tscale
                    }
                }
            }
        }
    }
}
