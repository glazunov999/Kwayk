#include "webambientsound.h"
#include "webaudioengine.h"

#include <QDebug>

WebAmbientSound::WebAmbientSound(QObject *parent)
    : QObject(parent)
{
    m_engine = WebAudioEngine::getEngine();
    m_engine->addAmbientSound(this);
}

WebAmbientSound::~WebAmbientSound()
{
    stop();
    m_engine->removeAmbientSound(this);
}

QUrl WebAmbientSound::source() const
{
    return m_source;
}

void WebAmbientSound::setSource(const QUrl &source)
{
    if (m_source == source)
        return;
    
    m_source = source;
    emit sourceChanged();
}

float WebAmbientSound::volume() const
{
    return m_volume;
}

void WebAmbientSound::setVolume(float volume)
{
    if (qFuzzyCompare(m_volume, volume))
        return;
    
    m_volume = volume;
    
#ifdef __EMSCRIPTEN__
    if (!m_gainNode.isUndefined())
        m_gainNode["gain"].set("value", volume);
#endif
    
    emit volumeChanged();
}

int WebAmbientSound::loops() const
{
    return m_loops;
}

void WebAmbientSound::setLoops(int loops)
{
    if (m_loops == loops)
        return;
    
    m_loops = loops;
    emit loopsChanged();
}

bool WebAmbientSound::autoPlay() const
{
    return m_autoPlay;
}

void WebAmbientSound::setAutoPlay(bool autoPlay)
{
    if (m_autoPlay == autoPlay)
        return;
    
    m_autoPlay = autoPlay;
    emit autoPlayChanged();
}

void WebAmbientSound::componentComplete()
{
    if (m_autoPlay)
        play();
}

void WebAmbientSound::play()
{
#ifdef __EMSCRIPTEN__
    if (!m_engine || m_source.isEmpty())
        return;
    
    m_engine->start();
    m_engine->load(m_source, this);
#endif
}

void WebAmbientSound::pause()
{
    stop();
}

void WebAmbientSound::stop()
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

void WebAmbientSound::createSourceNode()
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

    m_sourceNode.call<void>("connect", m_gainNode);
    m_gainNode.call<void>("connect", m_engine->masterGain());

    m_sourceNode.call<void>("start", 0);
#endif
}
