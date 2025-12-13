qt6_add_library(kwayk_assets_maps_b_explob STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_explob
    URI "Assets.maps.b_explob"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_explob_map.qml
    RESOURCES
        maps/+0_box_side.png
        maps/+0_box_side_glow.png
        maps/+0_box_top.png
        maps/+0_box_top_glow.png
        maps/+1_box_side.png
        maps/+1_box_side_glow.png
        maps/+1_box_top.png
        maps/+1_box_top_glow.png
        maps/lightmap.png
        meshes/solid_0_mesh.mesh
)
