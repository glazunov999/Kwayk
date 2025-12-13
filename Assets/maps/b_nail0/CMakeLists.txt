qt6_add_library(kwayk_assets_maps_b_nail0 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_nail0
    URI "Assets.maps.b_nail0"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_nail0_map.qml
    RESOURCES
        maps/lightmap.png
        maps/nail0sid.png
        maps/nail0top.png
        maps/rockettop.png
        meshes/solid_0_mesh.mesh
)
