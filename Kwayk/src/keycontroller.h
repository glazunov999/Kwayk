#ifndef KEYCONTROLLER_H
#define KEYCONTROLLER_H

#include <QObject>
#include <QString>
#include <QGuiApplication>

#ifdef __EMSCRIPTEN__
struct EmscriptenKeyboardEvent;
#endif

class KeyController : public QObject
{
    Q_OBJECT

public:
    KeyController(QObject *parent = nullptr);

    void install(QGuiApplication *app);

#ifdef __EMSCRIPTEN__
    void emitKeyDown(const EmscriptenKeyboardEvent *keyEvent);
    void emitKeyUp(const EmscriptenKeyboardEvent *keyEvent);
#else
    bool eventFilter(QObject *watched, QEvent *event) override;
#endif

signals:
    void keyPressed(const QString &key, int keyCode, bool repeat);
    void keyReleased(const QString &key, int keyCode);

private:
    QString keyToString(int key);
#ifdef __EMSCRIPTEN__
    int stringToQtKey(const QString &key);
#endif
};

#endif // KEYCONTROLLER_H
