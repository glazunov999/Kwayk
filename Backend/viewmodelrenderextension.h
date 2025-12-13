#ifndef VIEWMODELRENDEREXTENSION_H
#define VIEWMODELRENDEREXTENSION_H

#include <QtQuick3D/qquick3drenderextensions.h>
#include <QtQmlIntegration>

class ViewModelRenderExtension : public QQuick3DRenderExtension
{
    Q_OBJECT
    Q_PROPERTY(QQuick3DObject *model READ model WRITE setModel NOTIFY modelChanged)
    QML_ELEMENT

public:
    ViewModelRenderExtension() = default;
    ~ViewModelRenderExtension() override;

    QQuick3DObject *model() const;
    void setModel(QQuick3DObject *newModel);

signals:
    void modelChanged();

protected:
    QSSGRenderGraphObject *updateSpatialNode(QSSGRenderGraphObject *node) override;

private:
    void markDirty();
    QPointer<QQuick3DObject> m_model;
    bool m_dirty = false;
};

#endif // VIEWMODELRENDEREXTENSION_H
