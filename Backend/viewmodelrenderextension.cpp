#include "viewmodelrenderextension.h"

#include <rhi/qrhi.h>
#include <QtQuick3D/qquick3dobject.h>
#include <ssg/qquick3dextensionhelpers.h>
#include <ssg/qssgrenderhelpers.h>
#include <ssg/qssgrenderextensions.h>
#include <ssg/qssgrendercontextcore.h>

class ViewModelRenderer : public QSSGRenderExtension
{
public:
    ViewModelRenderer() = default;

    bool prepareData(QSSGFrameData &data) override;
    void prepareRender(QSSGFrameData &data) override;
    void render(QSSGFrameData &data) override;
    void resetForFrame() override;

    RenderMode mode() const override { return RenderMode::Main; }
    RenderStage stage() const override { return RenderStage::PostColor; }

    QPointer<QQuick3DObject> model;
    QSSGNodeId modelId { QSSGNodeId::Invalid };
    QSSGPrepContextId prepContext { QSSGPrepContextId::Invalid };
    QSSGPrepResultId prepResult { QSSGPrepResultId::Invalid };
    QSSGRenderablesId renderables { QSSGRenderablesId::Invalid };
    bool dataReady = false;
};

bool ViewModelRenderer::prepareData(QSSGFrameData &data)
{
    dataReady = false;
    
    if (!model)
        return false;

    modelId = QQuick3DExtensionHelpers::getNodeId(*model);
    if (modelId == QSSGNodeId::Invalid)
        return false;

    QSSGCameraId camera = data.activeCamera();
    if (camera == QSSGCameraId::Invalid)
        return false;

    prepContext = QSSGRenderHelpers::prepareForRender(data, *this, camera, 0);
    if (prepContext == QSSGPrepContextId::Invalid)
        return false;

    renderables = QSSGRenderHelpers::createRenderables(data, prepContext, { modelId });
    if (renderables == QSSGRenderablesId::Invalid)
        return false;

    prepResult = QSSGRenderHelpers::commit(data, prepContext, renderables);
    dataReady = (prepResult != QSSGPrepResultId::Invalid);
    return dataReady;
}

void ViewModelRenderer::prepareRender(QSSGFrameData &data)
{
    if (!dataReady)
        return;

    const auto &ctx = data.contextInterface();
    const auto &rhiCtx = ctx->rhiContext();

    if (!rhiCtx)
        return;

    QSSGRhiGraphicsPipelineState ps {};
    QRhiRenderPassDescriptor *rpDesc = rhiCtx->mainRenderPassDescriptor();

    ps.samples = rhiCtx->mainPassSampleCount();
    ps.viewCount = rhiCtx->mainPassViewCount();
    ps.colorAttachmentCount = 1;

    ps.flags.setFlag(QSSGRhiGraphicsPipelineState::Flag::DepthTestEnabled, true);
    ps.flags.setFlag(QSSGRhiGraphicsPipelineState::Flag::DepthWriteEnabled, true);
    ps.flags.setFlag(QSSGRhiGraphicsPipelineState::Flag::BlendEnabled, false);
    ps.cullMode = QRhiGraphicsPipeline::Back;
    ps.depthFunc = QRhiGraphicsPipeline::LessOrEqual;

    QRhiViewport vp = QRhiViewport(0, 0,
                                   rhiCtx->renderTarget()->pixelSize().width(),
                                   rhiCtx->renderTarget()->pixelSize().height());
    vp.setMinDepth(0.0f);
    vp.setMaxDepth(0.01f);
    ps.viewport = vp;

    QSSGRenderHelpers::prepareRenderables(data, prepResult, rpDesc, ps);
}

void ViewModelRenderer::render(QSSGFrameData &data)
{
    if (!dataReady)
        return;

    const auto &ctx = data.contextInterface();
    const auto &rhiCtx = ctx->rhiContext();

    if (!rhiCtx)
        return;

    QRhiCommandBuffer *cb = rhiCtx->commandBuffer();
    cb->debugMarkBegin(QByteArrayLiteral("Model overlay pass"));
    QSSGRenderHelpers::renderRenderables(data, prepResult);
    cb->debugMarkEnd();
}

void ViewModelRenderer::resetForFrame()
{
    prepContext = QSSGPrepContextId::Invalid;
    prepResult = QSSGPrepResultId::Invalid;
    renderables = QSSGRenderablesId::Invalid;
    dataReady = false;
}

ViewModelRenderExtension::~ViewModelRenderExtension() {}

QQuick3DObject *ViewModelRenderExtension::model() const
{
    return m_model;
}

void ViewModelRenderExtension::setModel(QQuick3DObject *newModel)
{
    if (m_model == newModel)
        return;
    m_model = newModel;
    markDirty();
    emit modelChanged();
}

QSSGRenderGraphObject *ViewModelRenderExtension::updateSpatialNode(QSSGRenderGraphObject *node)
{
    if (!node)
        node = new ViewModelRenderer;

    ViewModelRenderer *renderer = static_cast<ViewModelRenderer *>(node);
    renderer->model = m_model;

    m_dirty = false;
    return node;
}

void ViewModelRenderExtension::markDirty()
{
    m_dirty = true;
    update();
}
