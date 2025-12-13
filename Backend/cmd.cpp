#include <QQmlContext>
#include <QQmlFile>
#include <QFile>
#include <QTextStream>
#include <QDebug>

#include "cmd.h"

Cmd::Cmd(QObject *parent)
    : QObject(parent)
{
}

QUrl Cmd::source() const
{
    return m_source;
}

void Cmd::setSource(const QUrl &source)
{
    if (m_source == source)
        return;

    m_source = source;
    Q_EMIT sourceChanged();
    loadFromSource();
}

QString Cmd::text() const
{
    return m_text;
}

void Cmd::loadFromSource()
{
    if (m_source.isEmpty())
        return;

    const QQmlContext *context = qmlContext(this);
    // Get path to file
    const auto &filePath = QQmlFile::urlToLocalFileOrQrc(context ? context->resolvedUrl(m_source) : m_source);

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly)) {
        // Invalid file
        qWarning() << QStringLiteral("Unable to open file: %1").arg(filePath);
        return;
    }

    QTextStream stream(&file);
    m_text = stream.readAll();

    Q_EMIT loaded();
}
