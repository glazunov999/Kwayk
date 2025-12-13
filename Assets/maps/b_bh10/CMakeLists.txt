qt6_add_library(kwayk_assets_maps_b_bh10 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_bh10
    URI "Assets.maps.b_bh10"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_bh10_map.qml
    RESOURCES
        maps/med3_0.png
        maps/med3_0_glow.png
        maps/med3_1.png
        maps/med3_1_glow.png
        maps/lightmap.png
        meshes/solid_0_mesh.mesh
)
