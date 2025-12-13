qt6_add_library(kwayk_assets_maps_b_batt0 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_batt0
    URI "Assets.maps.b_batt0"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_batt0_map.qml
    RESOURCES
        maps/lightmap.png
        maps/batt0top.png
        maps/batt1sid.png
        maps/rockettop.png
        meshes/solid_0_mesh.mesh
)
