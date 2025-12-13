#ifndef MOUSECONTROLLER_H
#define MOUSECONTROLLER_H

#include <QPointF>
#include <QObject>
#include <QQuickWindow>

#ifdef __EMSCRIPTEN__
#include <emscripten/val.h>
struct EmscriptenMouseEvent;
struct EmscriptenPointerlockChangeEvent;
struct EmscriptenWheelEvent;
#endif

class MouseController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QPointF delta READ delta CONSTANT)
    Q_PROPERTY(bool grabbed READ grabbed NOTIFY grabbedChanged)

public:
    MouseController(QObject *parent = nullptr);

    Q_INVOKABLE void setCursorVisible(bool cursorVisible);
    Q_INVOKABLE void grabMouse(QQuickWindow *window);
    Q_INVOKABLE void releaseMouse(QQuickWindow *window);
    Q_INVOKABLE void update();
    Q_INVOKABLE bool consumeMouseMoved();

    QPointF delta() const;
    bool grabbed() const;

#ifdef __EMSCRIPTEN__
    void emitMouseMove(const EmscriptenMouseEvent *mouseEvent);
    void emitMouseButton(int button, bool down);
    void emitPointerLockChange(bool locked);
#else
    bool eventFilter(QObject *watched, QEvent *event) override;
#endif

Q_SIGNALS:
    void grabbedChanged();
    void mouseButtonPressed(int button);   // button: 0x10000001=MOUSE1, etc.
    void mouseButtonReleased(int button);

private:
    QPointF m_lastMousePos;
    QPointF m_grabMousePos;
    QPointF m_delta;
    bool m_grabbed = false;
    bool m_mouseMoved = false;
    QQuickWindow *m_window = nullptr;

#ifdef __EMSCRIPTEN__
    QPointF m_accumulatedDelta;
    emscripten::val m_screen = emscripten::val::undefined();
#endif
};

#endif // MOUSECONTROLLER_H
