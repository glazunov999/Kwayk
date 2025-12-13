#ifndef CMD_H
#define CMD_H

#include <QObject>
#include <QUrl>
#include <QQmlEngine>

class Cmd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)
    Q_PROPERTY(QString text READ text CONSTANT)
    QML_ELEMENT

public:
    explicit Cmd(QObject *parent = nullptr);
    ~Cmd() override = default;

    QUrl source() const;
    void setSource(const QUrl &source);

    QString text() const;

Q_SIGNALS:
    void sourceChanged();
    void loaded();

private:
    void loadFromSource();

    QUrl m_source;
    QString m_text;
};

#endif // CMD_H
