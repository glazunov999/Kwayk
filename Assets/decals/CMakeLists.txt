qt6_add_library(kwayk_assets_decals STATIC)

qt6_add_qml_module(kwayk_assets_decals
    URI "Assets.decals"
    VERSION 1.0
    RESOURCES
        blood_0.png
        blood_1.png
        blood_2.png
        blood_3.png
        blood_4.png
        blood_5.png
        blood_6.png
        blood_7.png
        bullet_0.png
        bullet_1.png
        bullet_2.png
        bullet_3.png
        bullet_4.png
        bullet_5.png
        bullet_6.png
        bullet_7.png
    RESOURCE_PREFIX "/"
)
