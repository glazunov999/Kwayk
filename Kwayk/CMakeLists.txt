qt6_add_library(kwayk STATIC)

qt6_add_qml_module(kwayk
    URI "Kwayk"
    VERSION 1.0
    QML_FILES
        App.qml
        js/clipper.js
        js/easing.js
        js/keys.js
        js/math.js
        js/vec.js
    RESOURCE_PREFIX "/"
)

add_subdirectory(Core)
add_subdirectory(Game)
add_subdirectory(Ui)
