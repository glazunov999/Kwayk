qt6_add_library(kwayk_assets_maps_b_batt1 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_batt1
    URI "Assets.maps.b_batt1"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_batt1_map.qml
    RESOURCES
        maps/lightmap.png
        maps/batt0sid.png
        maps/batt1top.png
        meshes/solid_0_mesh.mesh
)
