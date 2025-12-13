#include "webspatialsound.h"
#include "webaudioengine.h"

#include <QDebug>
#include <cmath>

WebSpatialSound::WebSpatialSound(QQuick3DNode *parent)
    : QQuick3DNode(parent)
{
    m_engine = WebAudioEngine::getEngine();
    m_engine->addSpatialSound(this);
    connect(this, &QQuick3DNode::scenePositionChanged, this, &WebSpatialSound::updatePosition);
}

WebSpatialSound::~WebSpatialSound()
{
    stop();
    m_engine->removeSpatialSound(this);
}

QUrl WebSpatialSound::source() const
{
    return m_source;
}

void WebSpatialSound::setSource(const QUrl &source)
{
    if (m_source == source)
        return;
    
    m_source = source;
    emit sourceChanged();
}

float WebSpatialSound::volume() const
{
    return m_volume;
}

void WebSpatialSound::setVolume(float volume)
{
    if (qFuzzyCompare(m_volume, volume))
        return;
    
    m_volume = volume;
    updateGain();
    emit volumeChanged();
}

int WebSpatialSound::loops() const
{
    return m_loops;
}

void WebSpatialSound::setLoops(int loops)
{
    if (m_loops == loops)
        return;
    
    m_loops = loops;
    emit loopsChanged();
}

bool WebSpatialSound::autoPlay() const
{
    return m_autoPlay;
}

void WebSpatialSound::setAutoPlay(bool autoPlay)
{
    if (m_autoPlay == autoPlay)
        return;
    
    m_autoPlay = autoPlay;
    emit autoPlayChanged();
}

float WebSpatialSound::directivity() const
{
    return m_directivity;
}

void WebSpatialSound::setDirectivity(float directivity)
{
    directivity = qBound(0.0f, directivity, 1.0f);
    if (qFuzzyCompare(m_directivity, directivity))
        return;
    
    m_directivity = directivity;
    updatePannerNode();
    emit directivityChanged();
}

float WebSpatialSound::directivityOrder() const
{
    return m_directivityOrder;
}

void WebSpatialSound::setDirectivityOrder(float order)
{
    order = qMax(1.0f, order);
    if (qFuzzyCompare(m_directivityOrder, order))
        return;
    
    m_directivityOrder = order;
    updatePannerNode();
    emit directivityOrderChanged();
}

WebSpatialSound::DistanceModel WebSpatialSound::distanceModel() const
{
    return m_distanceModel;
}

void WebSpatialSound::setDistanceModel(DistanceModel model)
{
    if (m_distanceModel == model)
        return;
    
    m_distanceModel = model;
    updatePannerNode();
    emit distanceModelChanged();
}

float WebSpatialSound::distanceCutoff() const
{
    return m_distanceCutoff;
}

void WebSpatialSound::setDistanceCutoff(float cutoff)
{
    if (qFuzzyCompare(m_distanceCutoff, cutoff))
        return;
    
    m_distanceCutoff = cutoff;
    updatePannerNode();
    emit distanceCutoffChanged();
}

float WebSpatialSound::manualAttenuation() const
{
    return m_manualAttenuation;
}

void WebSpatialSound::setManualAttenuation(float attenuation)
{
    if (qFuzzyCompare(m_manualAttenuation, attenuation))
        return;
    
    m_manualAttenuation = attenuation;
    updateGain();
    emit manualAttenuationChanged();
}

float WebSpatialSound::size() const
{
    return m_size;
}

void WebSpatialSound::setSize(float size)
{
    if (qFuzzyCompare(m_size, size))
        return;
    
    m_size = size;
    updatePannerNode();
    emit sizeChanged();
}

void WebSpatialSound::play()
{
#ifdef __EMSCRIPTEN__
    if (m_source.isEmpty())
        return;
    
    m_engine->start();
    m_engine->load(m_source, this);
#endif
}

void WebSpatialSound::pause()
{
    stop();
}

void WebSpatialSound::stop()
{
#ifdef __EMSCRIPTEN__
    if (!m_sourceNode.isUndefined()) {
        try {
            m_sourceNode.call<void>("stop");
        } catch (...) {}
        m_sourceNode = emscripten::val::undefined();
    }
#endif
}

void WebSpatialSound::componentComplete()
{
    QQuick3DNode::componentComplete();
    if (m_autoPlay)
        play();
}

void WebSpatialSound::updatePosition()
{
#ifdef __EMSCRIPTEN__
    if (m_pannerNode.isUndefined())
        return;
    
    auto pos = scenePosition();
    
    if (!m_pannerNode["positionX"].isUndefined()) {
        m_pannerNode["positionX"].set("value", pos.x());
        m_pannerNode["positionY"].set("value", pos.y());
        m_pannerNode["positionZ"].set("value", pos.z());
    } else {
        m_pannerNode.call<void>("setPosition", pos.x(), pos.y(), pos.z());
    }
#endif
}

void WebSpatialSound::updatePannerNode()
{
#ifdef __EMSCRIPTEN__
    if (m_pannerNode.isUndefined())
        return;

    std::string distModel;
    switch (m_distanceModel) {
    case Linear:
        distModel = "linear";
        break;
    case Logarithmic:
    default:
        distModel = "inverse";
        break;
    case ManualAttenuation:
        distModel = "linear";
        break;
    }
    m_pannerNode.set("distanceModel", distModel);

    m_pannerNode.set("refDistance", static_cast<double>(m_size));
    m_pannerNode.set("maxDistance", static_cast<double>(m_distanceCutoff));
    
    if (m_distanceModel == ManualAttenuation)
        m_pannerNode.set("rolloffFactor", 0.0);
    else
        m_pannerNode.set("rolloffFactor", 1.0);

    updateGain();

    float innerAngle = 360.0f * (1.0f - m_directivity);
    float outerAngle = 360.0f;
    float outerGain = 1.0f - m_directivity;

    innerAngle = innerAngle / m_directivityOrder;
    
    m_pannerNode.set("coneInnerAngle", static_cast<double>(innerAngle));
    m_pannerNode.set("coneOuterAngle", static_cast<double>(outerAngle));
    m_pannerNode.set("coneOuterGain", static_cast<double>(outerGain));
#endif
}

void WebSpatialSound::updateGain()
{
#ifdef __EMSCRIPTEN__
    if (m_gainNode.isUndefined())
        return;

    float gain = m_volume;
    if (m_distanceModel == ManualAttenuation)
        gain *= m_manualAttenuation;
    
    m_gainNode["gain"].set("value", gain);
#endif
}

void WebSpatialSound::createSourceNode()
{
#ifdef __EMSCRIPTEN__
    emscripten::val ctx = m_engine->audioContext();
    if (ctx.isUndefined())
        return;
    
    emscripten::val buffer = m_engine->getAudioBuffer(m_source);
    if (buffer.isUndefined())
        return;

    stop();

    m_sourceNode = ctx.call<emscripten::val>("createBufferSource");
    m_sourceNode.set("buffer", buffer);
    m_sourceNode.set("loop", m_loops == Infinite);

    m_gainNode = ctx.call<emscripten::val>("createGain");
    m_gainNode["gain"].set("value", m_volume);

    m_pannerNode = ctx.call<emscripten::val>("createPanner");
    m_pannerNode.set("panningModel", std::string("HRTF"));

    updatePannerNode();
    updatePosition();

    m_sourceNode.call<void>("connect", m_pannerNode);
    m_pannerNode.call<void>("connect", m_gainNode);
    m_gainNode.call<void>("connect", m_engine->masterGain());

    m_sourceNode.call<void>("start", 0);
#endif
}
