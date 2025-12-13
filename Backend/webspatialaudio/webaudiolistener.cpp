#include "webaudiolistener.h"
#include "webaudioengine.h"

#ifdef __EMSCRIPTEN__
#include <emscripten/val.h>
#endif

WebAudioListener::WebAudioListener(QQuick3DNode *parent)
    : QQuick3DNode(parent)
{
    m_engine = WebAudioEngine::getEngine();
    m_engine->m_listener = this;
    connect(this, &QQuick3DNode::scenePositionChanged, this, &WebAudioListener::updatePosition);
    connect(this, &QQuick3DNode::sceneRotationChanged, this, &WebAudioListener::updateRotation);
    updatePosition();
    updateRotation();
}

WebAudioListener::~WebAudioListener()
{
    m_engine->m_listener = nullptr;
}

void WebAudioListener::updatePosition()
{
    updateListenerTransform();
}

void WebAudioListener::updateRotation()
{
    updateListenerTransform();
}

void WebAudioListener::updateListenerTransform()
{
#ifdef __EMSCRIPTEN__
    emscripten::val ctx = m_engine->audioContext();
    if (ctx.isUndefined())
        return;
    
    emscripten::val listener = ctx["listener"];
    
    const auto pos = scenePosition();
    const auto fwd = forward();
    const auto up = this->up();

    if (!listener["positionX"].isUndefined()) {
        listener["positionX"].set("value", pos.x());
        listener["positionY"].set("value", pos.y());
        listener["positionZ"].set("value", pos.z());
    } else {
        listener.call<void>("setPosition", pos.x(), pos.y(), pos.z());
    }

    if (!listener["forwardX"].isUndefined()) {
        listener["forwardX"].set("value", fwd.x());
        listener["forwardY"].set("value", fwd.y());
        listener["forwardZ"].set("value", fwd.z());
        listener["upX"].set("value", up.x());
        listener["upY"].set("value", up.y());
        listener["upZ"].set("value", up.z());
    } else {
        listener.call<void>("setOrientation", fwd.x(), fwd.y(), fwd.z(), up.x(), up.y(), up.z());
    }
#endif
}
