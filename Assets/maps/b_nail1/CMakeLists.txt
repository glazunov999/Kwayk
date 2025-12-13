qt6_add_library(kwayk_assets_maps_b_nail1 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_nail1
    URI "Assets.maps.b_nail1"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_nail1_map.qml
    RESOURCES
        maps/lightmap.png
        maps/nail1sid_glow.png
        maps/nail1sid.png
        maps/nail1top_glow.png
        maps/nail1top.png
        maps/rockettop.png
        meshes/solid_0_mesh.mesh
)
