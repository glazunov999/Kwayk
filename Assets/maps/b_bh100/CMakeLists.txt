qt6_add_library(kwayk_assets_maps_b_bh100 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_bh100
    URI "Assets.maps.b_bh100"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_bh100_map.qml
    RESOURCES
        maps/+0_med100.png
        maps/+0_med100_glow.png
        maps/+1_med100.png
        maps/+1_med100_glow.png
        maps/+2_med100.png
        maps/+2_med100_glow.png
        maps/+3_med100.png
        maps/+3_med100_glow.png
        maps/lightmap.png
        maps/med100.png
        meshes/solid_0_mesh.mesh
)
