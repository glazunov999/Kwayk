#ifndef WEBAUDIOENGINE_H
#define WEBAUDIOENGINE_H

#include <QObject>
#include <QQmlEngine>
#include <QHash>
#include <QByteArray>
#include <QUrl>

#ifdef __EMSCRIPTEN__
#include <emscripten/val.h>
#endif

class WebAudioListener;
class WebAmbientSound;
class WebSpatialSound;

class WebAudioEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float masterVolume READ masterVolume WRITE setMasterVolume NOTIFY masterVolumeChanged)
    QML_ELEMENT

public:
    explicit WebAudioEngine(QObject *parent = nullptr);
    ~WebAudioEngine() override;

    void setMasterVolume(float volume);
    float masterVolume() const;

Q_SIGNALS:
    void masterVolumeChanged();

private:
    static WebAudioEngine *getEngine();

    void addSpatialSound(WebSpatialSound *sound);
    void removeSpatialSound(WebSpatialSound *sound);

    void addAmbientSound(WebAmbientSound *sound);
    void removeAmbientSound(WebAmbientSound *sound);

    void initAudioContext();
    void load(const QUrl &source, QObject *sound);
    void start();
    
public:
    void onBufferDecoded(const QUrl &source);

#ifdef __EMSCRIPTEN__
    emscripten::val audioContext() const;
    emscripten::val masterGain() const;
    emscripten::val getAudioBuffer(const QUrl &source);
#endif

    WebAudioListener *m_listener = nullptr;
    QList<WebSpatialSound *> m_spatialSounds;
    QList<WebAmbientSound *> m_ambientSounds;
    QHash<QUrl, QObject *> m_pendingSounds;
    QHash<QUrl, QByteArray> m_dataCache;

    float m_masterVolume = 1.0f;

#ifdef __EMSCRIPTEN__
    emscripten::val m_audioContext = emscripten::val::undefined();
    emscripten::val m_masterGain = emscripten::val::undefined();
    QHash<QUrl, emscripten::val> m_bufferCache;
#endif

    friend class WebAudioListener;
    friend class WebSpatialSound;
    friend class WebAmbientSound;
};

#endif // WEBAUDIOENGINE_H
