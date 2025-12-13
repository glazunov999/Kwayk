#include "keycontroller.h"

#include <QKeyEvent>
#include <QDebug>

using namespace Qt::Literals::StringLiterals;

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <emscripten/html5.h>
#include <emscripten/val.h>

static KeyController *s_instance = nullptr;

static EM_BOOL onKeyDown(int eventType, const EmscriptenKeyboardEvent *keyEvent, void *userData)
{
    Q_UNUSED(eventType);
    Q_UNUSED(userData);

    if (s_instance)
        s_instance->emitKeyDown(keyEvent);

    return EM_FALSE;
}

static EM_BOOL onKeyUp(int eventType, const EmscriptenKeyboardEvent *keyEvent, void *userData)
{
    Q_UNUSED(eventType);
    Q_UNUSED(userData);

    if (s_instance)
        s_instance->emitKeyUp(keyEvent);

    return EM_FALSE;
}
#endif

KeyController::KeyController(QObject *parent) : QObject(parent)
{
#ifdef __EMSCRIPTEN__
    s_instance = this;
    emscripten_set_keydown_callback(EMSCRIPTEN_EVENT_TARGET_DOCUMENT, nullptr, EM_TRUE, onKeyDown);
    emscripten_set_keyup_callback(EMSCRIPTEN_EVENT_TARGET_DOCUMENT, nullptr, EM_TRUE, onKeyUp);
#endif
}

void KeyController::install(QGuiApplication *app)
{
#ifndef __EMSCRIPTEN__
    app->installEventFilter(this);
#else
    Q_UNUSED(app);
#endif
}

#ifdef __EMSCRIPTEN__
void KeyController::emitKeyDown(const EmscriptenKeyboardEvent *keyEvent)
{
    QString key = QString::fromUtf8(keyEvent->key);
    bool repeat = keyEvent->repeat;
    int qtKey = stringToQtKey(key);
    
    emit keyPressed(key, qtKey, repeat);
}

void KeyController::emitKeyUp(const EmscriptenKeyboardEvent *keyEvent)
{
    QString key = QString::fromUtf8(keyEvent->key);
    int qtKey = stringToQtKey(key);
    
    emit keyReleased(key, qtKey);
}

int KeyController::stringToQtKey(const QString &key)
{
    if (key == u"`"_s) return Qt::Key_QuoteLeft;
    if (key == u"~"_s) return Qt::Key_AsciiTilde;
    if (key == u"Escape"_s) return Qt::Key_Escape;
    if (key == u"Enter"_s) return Qt::Key_Return;
    if (key == u"Tab"_s) return Qt::Key_Tab;
    if (key == u"Backspace"_s) return Qt::Key_Backspace;
    if (key == u" "_s) return Qt::Key_Space;
    if (key == u"ArrowUp"_s) return Qt::Key_Up;
    if (key == u"ArrowDown"_s) return Qt::Key_Down;
    if (key == u"ArrowLeft"_s) return Qt::Key_Left;
    if (key == u"ArrowRight"_s) return Qt::Key_Right;
    if (key == u"Shift"_s) return Qt::Key_Shift;
    if (key == u"Control"_s) return Qt::Key_Control;
    if (key == u"Alt"_s) return Qt::Key_Alt;
    if (key == u"Delete"_s) return Qt::Key_Delete;
    if (key == u"Insert"_s) return Qt::Key_Insert;
    if (key == u"Home"_s) return Qt::Key_Home;
    if (key == u"End"_s) return Qt::Key_End;
    if (key == u"PageUp"_s) return Qt::Key_PageUp;
    if (key == u"PageDown"_s) return Qt::Key_PageDown;
    if (key == u"Pause"_s) return Qt::Key_Pause;

    if (key.startsWith(u'F') && key.length() <= 3) {
        bool ok;
        int num = key.mid(1).toInt(&ok);
        if (ok && num >= 1 && num <= 12)
            return Qt::Key_F1 + num - 1;
    }

    if (key.length() == 1) {
        QChar c = key[0];
        if (c >= u'a' && c <= u'z')
            return Qt::Key_A + (c.unicode() - u'a');
        if (c >= u'A' && c <= u'Z')
            return Qt::Key_A + (c.unicode() - u'A');
        if (c >= u'0' && c <= u'9')
            return Qt::Key_0 + (c.unicode() - u'0');
        if (c == u',') return Qt::Key_Comma;
        if (c == u'.') return Qt::Key_Period;
        if (c == u'/') return Qt::Key_Slash;
        if (c == u';') return Qt::Key_Semicolon;
        if (c == u'\'') return Qt::Key_Apostrophe;
        if (c == u'[') return Qt::Key_BracketLeft;
        if (c == u']') return Qt::Key_BracketRight;
        if (c == u'\\') return Qt::Key_Backslash;
        if (c == u'-') return Qt::Key_Minus;
        if (c == u'=') return Qt::Key_Equal;
    }

    return 0;
}
#else
bool KeyController::eventFilter(QObject *watched, QEvent *event)
{
    if (!watched->isWindowType())
        return QObject::eventFilter(watched, event);

    if (event->type() == QEvent::KeyPress) {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
        const auto key = keyToString(keyEvent->key());
        const auto keyCode = keyEvent->key();
        emit keyPressed(key, keyCode, keyEvent->isAutoRepeat());
    } else if (event->type() == QEvent::KeyRelease) {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
        const auto key = keyToString(keyEvent->key());
        const auto keyCode = keyEvent->key();
        if (!keyEvent->isAutoRepeat())
            emit keyReleased(key, keyCode);
    }
    return QObject::eventFilter(watched, event);
}
#endif

QString KeyController::keyToString(int key)
{
    switch (key) {
    case Qt::Key_QuoteLeft: return u"`"_s;
    case Qt::Key_AsciiTilde: return u"~"_s;
    case Qt::Key_Escape: return u"Escape"_s;
    case Qt::Key_Return:
    case Qt::Key_Enter: return u"Enter"_s;
    case Qt::Key_Tab: return u"Tab"_s;
    case Qt::Key_Backspace: return u"Backspace"_s;
    case Qt::Key_Space: return u" "_s;
    case Qt::Key_Up: return u"ArrowUp"_s;
    case Qt::Key_Down: return u"ArrowDown"_s;
    case Qt::Key_Left: return u"ArrowLeft"_s;
    case Qt::Key_Right: return u"ArrowRight"_s;
    default:
        if (key >= Qt::Key_A && key <= Qt::Key_Z)
            return QString(QChar(key)).toLower();
        if (key >= Qt::Key_0 && key <= Qt::Key_9)
            return QString::number(key - Qt::Key_0);
        if (key >= Qt::Key_F1 && key <= Qt::Key_F12)
            return u"F%1"_s.arg(key - Qt::Key_F1 + 1);
        return QString();
    }
}
