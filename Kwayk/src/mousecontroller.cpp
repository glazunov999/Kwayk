#include "mousecontroller.h"

#include <QCursor>
#include <QScreen>
#include <QGuiApplication>
#include <QMouseEvent>

static constexpr int K_MOUSE1 = 0x10000001;
static constexpr int K_MOUSE2 = 0x10000002;
static constexpr int K_MOUSE3 = 0x10000004;
static constexpr int K_MWHEELUP = 0x10000010;
static constexpr int K_MWHEELDOWN = 0x10000020;

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#include <emscripten/html5.h>

static MouseController *s_instance = nullptr;

static int emButtonToKeynum(int button)
{
    switch (button) {
    case 0: return K_MOUSE1;  // Left
    case 1: return K_MOUSE3;  // Middle
    case 2: return K_MOUSE2;  // Right
    default: return -1;
    }
}

static EM_BOOL onMouseMove(int eventType, const EmscriptenMouseEvent *mouseEvent, void *userData)
{
    Q_UNUSED(eventType);
    Q_UNUSED(userData);
    
    if (s_instance)
        s_instance->emitMouseMove(mouseEvent);

    return EM_FALSE;
}

static EM_BOOL onMouseDown(int eventType, const EmscriptenMouseEvent *mouseEvent, void *userData)
{
    Q_UNUSED(eventType);
    Q_UNUSED(userData);

    if (s_instance)
        s_instance->emitMouseButton(mouseEvent->button, true);

    return EM_FALSE;
}

static EM_BOOL onMouseUp(int eventType, const EmscriptenMouseEvent *mouseEvent, void *userData)
{
    Q_UNUSED(eventType);
    Q_UNUSED(userData);

    if (s_instance)
        s_instance->emitMouseButton(mouseEvent->button, false);

    return EM_FALSE;
}

static EM_BOOL onPointerLockChange(int eventType, const EmscriptenPointerlockChangeEvent *event, void *userData)
{
    Q_UNUSED(eventType);
    Q_UNUSED(userData);
    
    if (s_instance)
        s_instance->emitPointerLockChange(event->isActive);

    return EM_TRUE;
}

#else

static int qtButtonToKeynum(Qt::MouseButton button)
{
    switch (button) {
    case Qt::LeftButton: return K_MOUSE1;
    case Qt::RightButton: return K_MOUSE2;
    case Qt::MiddleButton: return K_MOUSE3;
    default: return -1;
    }
}

#endif

MouseController::MouseController(QObject *parent) : QObject(parent)
{
#ifdef __EMSCRIPTEN__
    s_instance = this;

    emscripten::val document = emscripten::val::global("document");
    m_screen = document.call<emscripten::val>("getElementById", std::string("screen"));

    emscripten_set_mousemove_callback(EMSCRIPTEN_EVENT_TARGET_DOCUMENT, nullptr, EM_TRUE, onMouseMove);
    emscripten_set_mousedown_callback(EMSCRIPTEN_EVENT_TARGET_DOCUMENT, nullptr, EM_TRUE, onMouseDown);
    emscripten_set_mouseup_callback(EMSCRIPTEN_EVENT_TARGET_DOCUMENT, nullptr, EM_TRUE, onMouseUp);
    emscripten_set_pointerlockchange_callback(EMSCRIPTEN_EVENT_TARGET_DOCUMENT, nullptr, EM_TRUE, onPointerLockChange);
#else
    m_lastMousePos = QCursor::pos();
#endif
}

void MouseController::setCursorVisible(bool cursorVisible)
{
    if (cursorVisible)
        QGuiApplication::setOverrideCursor(QCursor(Qt::ArrowCursor));
    else
        QGuiApplication::setOverrideCursor(QCursor(Qt::BlankCursor));
}

void MouseController::grabMouse(QQuickWindow *window)
{
#ifdef __EMSCRIPTEN__
    Q_UNUSED(window);

    if (!m_screen.isUndefined() && !m_screen.isNull())
        m_screen.call<emscripten::val>("requestPointerLock");

#else
    if (m_window != window) {
        if (m_window)
            m_window->removeEventFilter(this);
        m_window = window;
        if (m_window)
            m_window->installEventFilter(this);
    }
    window->setMouseGrabEnabled(true);
    setCursorVisible(false);
    m_lastMousePos = QCursor::pos();
    m_grabMousePos = m_lastMousePos;
    if (!m_grabbed) {
        m_grabbed = true;
        emit grabbedChanged();
    }
#endif
}

void MouseController::releaseMouse(QQuickWindow *window)
{
#ifdef __EMSCRIPTEN__
    Q_UNUSED(window);

    emscripten::val document = emscripten::val::global("document");
    document.call<void>("exitPointerLock");
#else
    window->setMouseGrabEnabled(false);
    setCursorVisible(true);
    QCursor::setPos(m_grabMousePos.toPoint());
    m_lastMousePos = m_grabMousePos;
    if (m_grabbed) {
        m_grabbed = false;
        emit grabbedChanged();
    }
#endif
}

void MouseController::update()
{
#ifdef __EMSCRIPTEN__
    m_delta = -m_accumulatedDelta;
    m_accumulatedDelta = QPointF(0, 0);
#else
    const auto pos = QCursor::pos();

    m_delta = m_lastMousePos - pos;
    m_lastMousePos = pos;

    if (m_delta.x() != 0 || m_delta.y() != 0)
        m_mouseMoved = true;

    if (!m_grabbed)
        return;

    const auto *screen = QGuiApplication::primaryScreen();
    const auto geometry = screen->availableGeometry();
    if (m_lastMousePos.x() <= geometry.left() || m_lastMousePos.x() >= geometry.right() - 1
            || m_lastMousePos.y() <= geometry.top() || m_lastMousePos.y() >= geometry.bottom() - 1) {
        m_lastMousePos = screen->availableGeometry().center();
        QCursor::setPos(m_lastMousePos.toPoint());
    }
#endif
}

#ifdef __EMSCRIPTEN__
void MouseController::emitMouseMove(const EmscriptenMouseEvent *mouseEvent)
{
    m_mouseMoved = true;
    
    if (!m_grabbed)
        return;
        
    m_accumulatedDelta += QPointF(mouseEvent->movementX, mouseEvent->movementY);
}

void MouseController::emitMouseButton(int button, bool down)
{
    if (!m_grabbed)
        return;

    int keyNum = emButtonToKeynum(button);
    if (keyNum == -1)
        return;

    if (down)
        emit mouseButtonPressed(keyNum);
    else
        emit mouseButtonReleased(keyNum);
}

void MouseController::emitPointerLockChange(bool locked)
{
    if (m_grabbed != locked) {
        m_grabbed = locked;
        emit grabbedChanged();
    }
    if (!locked)
        m_accumulatedDelta = QPointF(0, 0);
}

#else

bool MouseController::eventFilter(QObject *watched, QEvent *event)
{
    if (!m_grabbed)
        return QObject::eventFilter(watched, event);

    auto *me = static_cast<QMouseEvent *>(event);
    int keyNum = qtButtonToKeynum(me->button());

    if (keyNum != -1) {
        switch (event->type()) {
        case QEvent::MouseButtonPress:
            emit mouseButtonPressed(keyNum);
            break;
        case QEvent::MouseButtonRelease:
            emit mouseButtonReleased(keyNum);
            break;
        }
    }

    return QObject::eventFilter(watched, event);
}

#endif

QPointF MouseController::delta() const
{
    return m_delta;
}

bool MouseController::grabbed() const
{
    return m_grabbed;
}

bool MouseController::consumeMouseMoved()
{
    bool moved = m_mouseMoved;
    m_mouseMoved = false;
    return moved;
}
