#include "contactlistener.h"

void ContactListener::addRejectedBodyPair(int bodyID1, int bodyID2)
{
    QMutexLocker locker(&m_mutex);
    m_rejectedBodyPairs.insert(qMakePair(bodyID1, bodyID2));
}

void ContactListener::removeRejectedBodyPair(int bodyID1, int bodyID2)
{
    QMutexLocker locker(&m_mutex);
    m_rejectedBodyPairs.remove(qMakePair(bodyID1, bodyID2));
}

ContactListener::ValidateResult ContactListener::contactValidate(const BodyContact &bodyContact, const QVector3D &baseOffset, const CollideShapeResult &collisionResult)
{
    Q_UNUSED(bodyContact)
    Q_UNUSED(baseOffset)
    Q_UNUSED(collisionResult)

    QMutexLocker locker(&m_mutex);
    if (m_rejectedBodyPairs.contains(qMakePair(bodyContact.bodyID1, bodyContact.bodyID2))
            || m_rejectedBodyPairs.contains(qMakePair(bodyContact.bodyID2, bodyContact.bodyID1))) {
        return ValidateResult::RejectAllContactsForThisBodyPair;
    }

    return ValidateResult::AcceptAllContactsForThisBodyPair;
}

void ContactListener::contactAdded(const BodyContact &bodyContact, ContactSettings &settings)
{
    int sensorID;
    int bodyID;

    if (bodyContact.isBodyID1Sensor) {
        sensorID = bodyContact.bodyID1;
        bodyID = bodyContact.bodyID2;
    } else if (bodyContact.isBodyID2Sensor) {
        sensorID = bodyContact.bodyID2;
        bodyID = bodyContact.bodyID1;
    } else {
        registerBodyContact(bodyContact);
        return;
    }

    QMutexLocker locker(&m_mutex);
    if (!m_bodiesInSensor.contains(sensorID))
        m_bodiesInSensor[sensorID] = QList<BodyAndCount>();
    BodyAndCount bodyAndCount { bodyID, 1 };
    auto &bodiesInSensor = m_bodiesInSensor[sensorID];
    auto b = std::lower_bound(bodiesInSensor.begin(), bodiesInSensor.end(), bodyAndCount);
    if (b != bodiesInSensor.end() && b->bodyID == bodyID) {
        b->count++;
        return;
    }
    bodiesInSensor.insert(b, bodyAndCount);
    registerEnteredBodyContact(bodyContact);
}

void ContactListener::contactPersisted(const BodyContact &bodyContact, ContactSettings &settings)
{
    Q_UNUSED(bodyContact)
    Q_UNUSED(settings)
}

void ContactListener::contactRemoved(const BodyContact &bodyContact)
{
    int sensorID;
    int bodyID;

    QMutexLocker locker(&m_mutex);
    if (m_bodiesInSensor.contains(bodyContact.bodyID1)) {
        sensorID = bodyContact.bodyID1;
        bodyID = bodyContact.bodyID2;
    } else if (m_bodiesInSensor.contains(bodyContact.bodyID2)) {
        sensorID = bodyContact.bodyID2;
        bodyID = bodyContact.bodyID1;
    } else {
        return;
    }

    BodyAndCount bodyAndCount { bodyID, 1 };
    auto &bodiesInSensor = m_bodiesInSensor[sensorID];
    auto b = std::lower_bound(bodiesInSensor.begin(), bodiesInSensor.end(), bodyAndCount);
    if (b != bodiesInSensor.end() && b->bodyID == bodyID) {
        Q_ASSERT(b->count > 0);
        b->count--;
        if (b->count == 0) {
            bodiesInSensor.erase(b);
            registerExitedBodyContact(bodyContact);
        }
        return;
    }
    Q_ASSERT_X(false, "Body pair not found", "");
}
