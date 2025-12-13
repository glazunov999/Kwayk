#include "charactercontactlistener.h"

#include <QVector3D>

void CharacterContactListener::onAdjustBodyVelocity(int bodyID2, QVector3D &linearVelocity, QVector3D &angularVelocity)
{
    Q_UNUSED(bodyID2)
    Q_UNUSED(linearVelocity)
    Q_UNUSED(angularVelocity)
}

void CharacterContactListener::onContactAdded(const Contact &contact, CharacterContactSettings &settings)
{
    registerContact(contact);
}

void CharacterContactListener::onContactSolve(const Contact &contact, const QVector3D &contactVelocity, const QVector3D &characterVelocity, QVector3D &newCharacterVelocity, bool isSlopeToSteep)
{
    Q_UNUSED(contact)
    Q_UNUSED(contactVelocity)
    Q_UNUSED(characterVelocity)
    Q_UNUSED(newCharacterVelocity)
    Q_UNUSED(isSlopeToSteep)
}

void CharacterContactListener::onCharacterContactAdded(const Contact &contact, CharacterContactSettings &settings)
{
    settings.canPushCharacter = false;
    settings.canReceiveImpulses = false;

    registerContact(contact);
}

void CharacterContactListener::onCharacterContactSolve(const Contact &contact, const QVector3D &contactVelocity, const QVector3D &characterVelocity, QVector3D &newCharacterVelocity)
{
    Q_UNUSED(contact)
    Q_UNUSED(contactVelocity)
    Q_UNUSED(characterVelocity)
    Q_UNUSED(newCharacterVelocity)
}
