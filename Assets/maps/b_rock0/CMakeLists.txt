qt6_add_library(kwayk_assets_maps_b_rock0 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_rock0
    URI "Assets.maps.b_rock0"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_rock0_map.qml
    RESOURCES
        maps/lightmap.png
        maps/rock0sid.png
        maps/rockettop.png
        meshes/solid_0_mesh.mesh
)
