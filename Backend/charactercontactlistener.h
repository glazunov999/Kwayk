#ifndef CHARACTERCONTACTLISTENER
#define CHARACTERCONTACTLISTENER

#include <QObject>

#include <QtQuick3DJoltPhysics/abstractcharactercontactlistener.h>

class CharacterContactListener : public AbstractCharacterContactListener
{
    Q_OBJECT
    QML_ELEMENT
public:
    CharacterContactListener() = default;

    void onAdjustBodyVelocity(int bodyID2, QVector3D &linearVelocity, QVector3D &angularVelocity) override;
    void onContactAdded(const Contact &contact, CharacterContactSettings &settings) override;
    void onContactSolve(const Contact &contact, const QVector3D &contactVelocity, const QVector3D &characterVelocity, QVector3D &newCharacterVelocity, bool isSlopeToSteep) override;
    void onCharacterContactAdded(const Contact &contact, CharacterContactSettings &settings) override;
    void onCharacterContactSolve(const Contact &contact, const QVector3D &contactVelocity, const QVector3D &characterVelocity, QVector3D &newCharacterVelocity) override;
};

#endif // CHARACTERCONTACTLISTENER
