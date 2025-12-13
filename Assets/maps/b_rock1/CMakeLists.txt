qt6_add_library(kwayk_assets_maps_b_rock1 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_rock1
    URI "Assets.maps.b_rock1"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_rock1_map.qml
    RESOURCES
        maps/lightmap.png
        maps/rock1sid.png
        maps/rockettop.png
        meshes/solid_0_mesh.mesh
)
