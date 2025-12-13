qt6_add_library(kwayk_assets_maps_b_shell1 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_shell1
    URI "Assets.maps.b_shell1"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_shell1_map.qml
    RESOURCES
        maps/lightmap.png
        maps/rockettop.png
        maps/shot1sid.png
        maps/shot1sid_glow.png
        maps/shot1top.png
        maps/shot1top_glow.png
        meshes/solid_0_mesh.mesh
)
