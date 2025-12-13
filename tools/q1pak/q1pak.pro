QT += core gui

CONFIG += c++17 cmdline

SOURCES += \
        geometryhelpers.cpp \
        lmpfile.cpp \
        main.cpp \
        modfile.cpp \
        pakfile.cpp \
        palettefile.cpp \
        wadfile.cpp

HEADERS += \
        geometryhelpers.h \
        lmpfile.h \
        modfile.h \
        pakfile.h \
        palettefile.h \
        wadfile.h

LIBS += -lassimp -lgmp -lmpfr

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
