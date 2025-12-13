qt6_add_library(kwayk_assets STATIC)

qt6_add_qml_module(kwayk_assets
    URI "Assets"
    VERSION 1.0
    RESOURCES
        default.cfg
        quake.rc
    RESOURCE_PREFIX "/"
)

add_subdirectory(decals)
add_subdirectory(images)
add_subdirectory(maps)
add_subdirectory(progs)
add_subdirectory(sounds)
