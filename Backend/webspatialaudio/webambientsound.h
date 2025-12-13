#ifndef WEBAMBIENTSOUND_H
#define WEBAMBIENTSOUND_H

#include <QObject>
#include <QQmlEngine>
#include <QQmlParserStatus>
#include <QUrl>

#ifdef __EMSCRIPTEN__
#include <emscripten/val.h>
#endif

class WebAudioEngine;

class WebAmbientSound : public QObject, public QQmlParserStatus
{
    Q_OBJECT
    Q_INTERFACES(QQmlParserStatus)
    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(float volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(int loops READ loops WRITE setLoops NOTIFY loopsChanged)
    Q_PROPERTY(bool autoPlay READ autoPlay WRITE setAutoPlay NOTIFY autoPlayChanged)
    QML_ELEMENT

public:
    explicit WebAmbientSound(QObject *parent = nullptr);
    ~WebAmbientSound();
    
    void classBegin() override {}
    void componentComplete() override;

    QUrl source() const;
    void setSource(const QUrl &source);

    float volume() const;
    void setVolume(float volume);

    enum Loops {
        Infinite = -1,
        Once = 1
    };
    Q_ENUM(Loops)

    int loops() const;
    void setLoops(int loops);

    bool autoPlay() const;
    void setAutoPlay(bool autoPlay);

public Q_SLOTS:
    void play();
    void pause();
    void stop();

Q_SIGNALS:
    void sourceChanged();
    void volumeChanged();
    void loopsChanged();
    void autoPlayChanged();

private Q_SLOTS:
    void createSourceNode();

private:
    WebAudioEngine *m_engine = nullptr;
    
    QUrl m_source;
    float m_volume = 1.0f;
    int m_loops = Once;
    bool m_autoPlay = false;
    
#ifdef __EMSCRIPTEN__
    emscripten::val m_sourceNode = emscripten::val::undefined();
    emscripten::val m_gainNode = emscripten::val::undefined();
#endif
};

#endif // WEBAMBIENTSOUND_H
