qt6_add_library(kwayk_assets_maps_b_shell0 STATIC)

qt6_add_qml_module(kwayk_assets_maps_b_shell0
    URI "Assets.maps.b_shell0"
    VERSION 1.0
    RESOURCE_PREFIX "/"
    QML_FILES
        B_shell0_map.qml
    RESOURCES
        maps/lightmap.png
        maps/rockettop.png
        maps/shot0sid.png
        maps/shot0top.png
        meshes/solid_0_mesh.mesh
)
