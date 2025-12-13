#ifndef CONTACTLISTENER_H
#define CONTACTLISTENER_H

#include <QtQuick3DJoltPhysics/abstractcontactlistener.h>

#include <QtQml/QQmlEngine>
#include <QHash>
#include <QSet>
#include <QMutex>

class ContactListener : public AbstractContactListener
{
    Q_OBJECT
    QML_ELEMENT
public:
    ContactListener() = default;

    ValidateResult contactValidate(const BodyContact &bodyContact, const QVector3D &baseOffset, const CollideShapeResult &collisionResult) override;
    void contactAdded(const BodyContact &bodyContact, ContactSettings &settings) override;
    void contactPersisted(const BodyContact &bodyContact, ContactSettings &settings) override;
    void contactRemoved(const BodyContact &bodyContact) override;

    Q_INVOKABLE void addRejectedBodyPair(int bodyID1, int bodyID2);
    Q_INVOKABLE void removeRejectedBodyPair(int bodyID1, int bodyID2);

private:
    struct BodyAndCount {
        int bodyID;
        unsigned int count;

        bool operator < (const BodyAndCount &rhs) const { return bodyID < rhs.bodyID; }
    };

    QSet<QPair<int, int>> m_rejectedBodyPairs;
    QHash<int, QList<BodyAndCount>> m_bodiesInSensor;
    mutable QMutex m_mutex;
};

#endif // CONTACTLISTENER_H
