qt6_add_library(kwayk_assets_maps_b_bh25 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_bh25
    URI "Assets.maps.b_bh25"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_bh25_map.qml
    RESOURCES
        maps/+0_med25.png
        maps/+0_med25_glow.png
        maps/+0_med25s.png
        maps/+0_med25s_glow.png
        maps/+1_med25.png
        maps/+1_med25_glow.png
        maps/+1_med25s.png
        maps/+1_med25s_glow.png
        maps/+2_med25.png
        maps/+2_med25_glow.png
        maps/+3_med25.png
        maps/+3_med25_glow.png
        maps/lightmap.png
        meshes/solid_0_mesh.mesh
)
