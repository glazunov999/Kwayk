qt6_add_library(kwayk_assets_maps_b_exbox2 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_exbox2
    URI "Assets.maps.b_exbox2"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_exbox2_map.qml
    RESOURCES
        maps/+0_box_top.png
        maps/+0_box_top_glow.png
        maps/+1_box_top.png
        maps/+1_box_top_glow.png
        maps/lightmap.png
        meshes/solid_0_mesh.mesh
)
