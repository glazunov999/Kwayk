#ifndef WEBAUDIOLISTENER_H
#define WEBAUDIOLISTENER_H

#include <QObject>
#include <QQmlEngine>
#include <private/qquick3dnode_p.h>

class WebAudioEngine;

class WebAudioListener : public QQuick3DNode
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit WebAudioListener(QQuick3DNode *parent = nullptr);
    ~WebAudioListener();

protected:
    QSSGRenderGraphObject *updateSpatialNode(QSSGRenderGraphObject *) override { return nullptr; }

private Q_SLOTS:
    void updatePosition();
    void updateRotation();

private:
    void updateListenerTransform();
    WebAudioEngine *m_engine = nullptr;
};

#endif // WEBAUDIOLISTENER_H
