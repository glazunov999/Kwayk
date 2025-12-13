qt6_add_library(kwayk_backend STATIC)

qt6_add_qml_module(kwayk_backend
    URI "Backend"
    VERSION 1.0
    SOURCES
        charactercontactlistener.h charactercontactlistener.cpp
        cmd.h cmd.cpp
        contactlistener.h contactlistener.cpp
        decalgeometry.h decalgeometry.cpp
        lightstyletexture.h lightstyletexture.cpp
        mdl.h mdl.cpp
        mdlcache.h mdlcache.cpp
        mdlgeometry.h mdlgeometry.cpp
        physicslayers.h physicslayers.cpp
        viewmodelrenderextension.h viewmodelrenderextension.cpp
        webspatialaudio/webaudioengine.h webspatialaudio/webaudioengine.cpp
        webspatialaudio/webaudiolistener.h webspatialaudio/webaudiolistener.cpp
        webspatialaudio/webspatialsound.h webspatialaudio/webspatialsound.cpp
        webspatialaudio/webambientsound.h webspatialaudio/webambientsound.cpp
    RESOURCE_PREFIX "/"
)

target_link_libraries(kwayk_backend PUBLIC Qt6::Quick3D Qt6::Quick3DPrivate Qt6::Quick3DJoltPhysics)

target_include_directories(kwayk_backend PUBLIC webspatialaudio)
