cmake_minimum_required(VERSION 3.16)

project(Kwayk VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Quick3D Quick3DPrivate Quick3DJoltPhysics SpatialAudio)

qt_standard_project_setup()

qt_add_executable(appKwayk 
    Kwayk/src/main.cpp 
    Kwayk/src/mousecontroller.h 
    Kwayk/src/mousecontroller.cpp
    Kwayk/src/keycontroller.h
    Kwayk/src/keycontroller.cpp
)

if(EMSCRIPTEN)
    set_target_properties(appKwayk PROPERTIES 
        QT_WASM_INITIAL_MEMORY "150MB"
    )
    target_link_options(appKwayk PRIVATE 
        "SHELL:-s INITIAL_MEMORY=157286400"  # 150MB в байтах (кратно 64KB)
        "SHELL:-s MAXIMUM_MEMORY=2GB"
        "SHELL:-s ALLOW_MEMORY_GROWTH=1"
        "SHELL:-s EXPORTED_FUNCTIONS=['_main','_webAudioBufferDecoded']"
        "SHELL:-s EXPORTED_RUNTIME_METHODS=['stringToNewUTF8']"
    )
endif()

add_subdirectory(Assets)
add_subdirectory(Backend)
add_subdirectory(Kwayk)

target_link_libraries(appKwayk PRIVATE
    kwayk_assets_decalsplugin
    kwayk_assets_imagesplugin
    kwayk_assets_maps_b_batt0plugin
    kwayk_assets_maps_b_batt1plugin
    kwayk_assets_maps_b_bh100plugin
    kwayk_assets_maps_b_bh10plugin
    kwayk_assets_maps_b_bh25plugin
    kwayk_assets_maps_b_exbox2plugin
    kwayk_assets_maps_b_explobplugin
    kwayk_assets_maps_b_nail0plugin
    kwayk_assets_maps_b_nail1plugin
    kwayk_assets_maps_b_rock0plugin
    kwayk_assets_maps_b_rock1plugin
    kwayk_assets_maps_b_shell0plugin
    kwayk_assets_maps_b_shell1plugin
    kwayk_assets_maps_e1m1plugin
    kwayk_assets_maps_e1m2plugin
    kwayk_assets_maps_e1m7plugin
    kwayk_assets_maps_startplugin
    kwayk_assets_progsplugin
    kwayk_assets_soundsplugin
    kwayk_assetsplugin
    kwayk_backendplugin
    kwayk_coreplugin
    kwayk_gameplugin
    kwayk_uiplugin
    kwaykplugin
)

target_link_libraries(appKwayk PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::Quick3D
    Qt6::Quick3DPrivate
    Qt6::Quick3DJoltPhysics
    Qt6::SpatialAudio
)

install(TARGETS appKwayk
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
