#ifndef WEBSPATIALSOUND_H
#define WEBSPATIALSOUND_H

#include <QObject>
#include <QQmlEngine>
#include <QUrl>
#include <private/qquick3dnode_p.h>

#ifdef __EMSCRIPTEN__
#include <emscripten/val.h>
#endif

class WebAudioEngine;

class WebSpatialSound : public QQuick3DNode
{
    Q_OBJECT
    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(float volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(int loops READ loops WRITE setLoops NOTIFY loopsChanged)
    Q_PROPERTY(bool autoPlay READ autoPlay WRITE setAutoPlay NOTIFY autoPlayChanged)
    Q_PROPERTY(float directivity READ directivity WRITE setDirectivity NOTIFY directivityChanged)
    Q_PROPERTY(float directivityOrder READ directivityOrder WRITE setDirectivityOrder NOTIFY directivityOrderChanged)
    Q_PROPERTY(DistanceModel distanceModel READ distanceModel WRITE setDistanceModel NOTIFY distanceModelChanged)
    Q_PROPERTY(float distanceCutoff READ distanceCutoff WRITE setDistanceCutoff NOTIFY distanceCutoffChanged)
    Q_PROPERTY(float manualAttenuation READ manualAttenuation WRITE setManualAttenuation NOTIFY manualAttenuationChanged)
    Q_PROPERTY(float size READ size WRITE setSize NOTIFY sizeChanged)
    QML_ELEMENT

public:
    explicit WebSpatialSound(QQuick3DNode *parent = nullptr);
    ~WebSpatialSound() override;

    enum Loops {
        Infinite = -1,
        Once = 1
    };
    Q_ENUM(Loops)

    enum DistanceModel {
        Logarithmic,
        Linear,
        ManualAttenuation
    };
    Q_ENUM(DistanceModel)

    QUrl source() const;
    void setSource(const QUrl &source);

    float volume() const;
    void setVolume(float volume);

    int loops() const;
    void setLoops(int loops);

    bool autoPlay() const;
    void setAutoPlay(bool autoPlay);

    float directivity() const;
    void setDirectivity(float directivity);

    float directivityOrder() const;
    void setDirectivityOrder(float order);

    DistanceModel distanceModel() const;
    void setDistanceModel(DistanceModel model);

    float distanceCutoff() const;
    void setDistanceCutoff(float cutoff);

    float manualAttenuation() const;
    void setManualAttenuation(float attenuation);

    float size() const;
    void setSize(float size);

public Q_SLOTS:
    void play();
    void pause();
    void stop();

Q_SIGNALS:
    void sourceChanged();
    void volumeChanged();
    void loopsChanged();
    void autoPlayChanged();
    void directivityChanged();
    void directivityOrderChanged();
    void distanceModelChanged();
    void distanceCutoffChanged();
    void manualAttenuationChanged();
    void sizeChanged();

protected:
    void componentComplete() override;
    QSSGRenderGraphObject *updateSpatialNode(QSSGRenderGraphObject *) override { return nullptr; }

private Q_SLOTS:
    void updatePosition();
    void createSourceNode();

private:
    void updatePannerNode();
    void updateGain();
    
    WebAudioEngine *m_engine = nullptr;
    
    QUrl m_source;
    float m_volume = 1.0f;
    int m_loops = Loops::Once;
    bool m_autoPlay = false;
    float m_directivity = 0.0f;
    float m_directivityOrder = 1.0f;
    DistanceModel m_distanceModel = Logarithmic;
    float m_distanceCutoff = 50.0f;
    float m_manualAttenuation = 1.0f;
    float m_size = 0.1f;
    
#ifdef __EMSCRIPTEN__
    emscripten::val m_sourceNode = emscripten::val::undefined();
    emscripten::val m_gainNode = emscripten::val::undefined();
    emscripten::val m_pannerNode = emscripten::val::undefined();
#endif
};

#endif // WEBSPATIALSOUND_H
