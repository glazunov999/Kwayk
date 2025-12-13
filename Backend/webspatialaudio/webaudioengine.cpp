#include "webaudioengine.h"
#include "webaudiolistener.h"
#include "webspatialsound.h"
#include "webambientsound.h"

#include <QQmlContext>
#include <QQmlFile>
#include <QFile>
#include <QDebug>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <emscripten/val.h>

using namespace emscripten;

EM_JS(void, js_decodeAudioData, (const char *dataPtr, int dataLen, const char *keyPtr), {
    console.log('js_decodeAudioData: Module.webAudioCtx =', Module.webAudioCtx);
    var ctx = Module.webAudioCtx;
    if (!ctx) {
        console.log('js_decodeAudioData: creating new AudioContext');
        ctx = Module.webAudioCtx = new (window.AudioContext || window.webkitAudioContext)();
    }

    var key = UTF8ToString(keyPtr);

    var audioData = new Uint8Array(dataLen);
    for (var i = 0; i < dataLen; i++)
        audioData[i] = HEAPU8[dataPtr + i];

    ctx.decodeAudioData(audioData.buffer).then(function(buffer) {
        if (!Module.webAudioBuffers)
            Module.webAudioBuffers = {};

        Module.webAudioBuffers[key] = buffer;
        console.log('WebAudio: decoded', key, 'duration:', buffer.duration);

        var keyCallbackPtr = stringToNewUTF8(key);
        Module._webAudioBufferDecoded(keyCallbackPtr);
        _free(keyCallbackPtr);
    }).catch(function(err) {
        console.error('WebAudio decode error:', key, err);
    });
})

#endif

static WebAudioEngine *globalEngine = nullptr;

#ifdef __EMSCRIPTEN__
extern "C" {
    EMSCRIPTEN_KEEPALIVE
    void webAudioBufferDecoded(const char *key) {
        if (globalEngine)
            globalEngine->onBufferDecoded(QUrl(QString::fromUtf8(key)));
    }
}
#endif

WebAudioEngine::WebAudioEngine(QObject *parent)
    : QObject(parent)
{
    if (globalEngine)
        return;

    globalEngine = this;
    initAudioContext();
}

WebAudioEngine::~WebAudioEngine()
{
}

void WebAudioEngine::setMasterVolume(float volume)
{
    if (qFuzzyCompare(globalEngine->m_masterVolume, volume))
        return;

    globalEngine->m_masterVolume = volume;

#ifdef __EMSCRIPTEN__
    if (!globalEngine->m_masterGain.isUndefined())
        globalEngine->m_masterGain["gain"].set("value", volume);
#endif

    emit masterVolumeChanged();
}

float WebAudioEngine::masterVolume() const
{
    return globalEngine->m_masterVolume;
}

WebAudioEngine *WebAudioEngine::getEngine()
{
    if (!globalEngine)
        globalEngine = new WebAudioEngine();
    return globalEngine;
}

void WebAudioEngine::addSpatialSound(WebSpatialSound *sound)
{
    m_spatialSounds.append(sound);
}

void WebAudioEngine::removeSpatialSound(WebSpatialSound *sound)
{
    m_spatialSounds.removeOne(sound);
}

void WebAudioEngine::addAmbientSound(WebAmbientSound *sound)
{
    m_ambientSounds.append(sound);
}

void WebAudioEngine::removeAmbientSound(WebAmbientSound *sound)
{
    m_ambientSounds.removeOne(sound);
}

void WebAudioEngine::initAudioContext()
{
#ifdef __EMSCRIPTEN__
    val AudioContext = val::global("AudioContext");
    if (AudioContext.isUndefined())
        AudioContext = val::global("webkitAudioContext");

    if (AudioContext.isUndefined())
        return;

    m_audioContext = AudioContext.new_();

    val Module = val::global("Module");
    if (!Module.isUndefined())
        Module.set("webAudioCtx", m_audioContext);

    m_masterGain = m_audioContext.call<val>("createGain");
    m_masterGain["gain"].set("value", m_masterVolume);
    m_masterGain.call<void>("connect", m_audioContext["destination"]);
#endif
}

void WebAudioEngine::load(const QUrl &source, QObject *sound)
{
#ifdef __EMSCRIPTEN__
    if (m_bufferCache.contains(source)) {
        QMetaObject::invokeMethod(sound, "createSourceNode", Qt::QueuedConnection);
        return;
    }

    if (m_pendingSounds.contains(source))
        return;

    const QQmlContext *context = qmlContext(this);
    const auto &filePath = QQmlFile::urlToLocalFileOrQrc(context ? context->resolvedUrl(source) : source);

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly))
        return;

    m_pendingSounds[source] = sound;
    m_dataCache[source] = file.readAll();

    auto key = source.toString();
    js_decodeAudioData(m_dataCache[source].constData(), m_dataCache[source].size(), key.toUtf8().constData());
#else
    Q_UNUSED(source);
    Q_UNUSED(sound);
#endif
}

void WebAudioEngine::onBufferDecoded(const QUrl &source)
{
#ifdef __EMSCRIPTEN__
    val buffers = val::module_property("webAudioBuffers");
    if (!buffers.isUndefined()) {
        val buffer = buffers[source.toString().toStdString()];
        if (!buffer.isUndefined())
            m_bufferCache[source] = buffer;
    }

    m_dataCache.remove(source);

    if (m_pendingSounds.contains(source)) {
        auto *sound = m_pendingSounds[source];
        QMetaObject::invokeMethod(sound, "createSourceNode", Qt::QueuedConnection);
        m_pendingSounds.remove(source);
    }
#else
    Q_UNUSED(source);
#endif
}

void WebAudioEngine::start()
{
#ifdef __EMSCRIPTEN__
    if (m_audioContext.isUndefined())
        return;

    std::string state = m_audioContext["state"].as<std::string>();
    if (state == "suspended")
        m_audioContext.call<val>("resume");
#endif
}

#ifdef __EMSCRIPTEN__
val WebAudioEngine::getAudioBuffer(const QUrl &source)
{
    if (m_bufferCache.contains(source))
        return m_bufferCache[source];
    return val::undefined();
}

val WebAudioEngine::audioContext() const
{
    return m_audioContext;
}

val WebAudioEngine::masterGain() const
{
    return m_masterGain;
}
#endif
