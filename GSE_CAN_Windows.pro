QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h

FORMS += \
    mainwindow.ui


INCLUDEPATH += $$PWD/third_party/njlike/include
LIBS += -L$$PWD/third_party/njlike/lib -lCanCmd

win32 {
    NJLIKE_DLL = $$PWD/third_party/njlike/bin/CanCmd.dll
    NJLIKE_DEST = $$OUT_PWD
    exists($$OUT_PWD/debug) {
        NJLIKE_DEST = $$OUT_PWD/debug
    }
    exists($$OUT_PWD/release) {
        NJLIKE_DEST = $$OUT_PWD/release
    }
    QMAKE_POST_LINK += $$quote(cmd /c if exist "$$NJLIKE_DLL" copy /y "$$NJLIKE_DLL" "$$NJLIKE_DEST")
}

VERSION     = 1.0.0
TARGET      = GSE_CAN_V1.0.0a_260204
TEMPLATE    = app
MOC_DIR     = temp/moc
RCC_DIR     = temp/rcc
UI_DIR      = temp/ui
OBJECTS_DIR = temp/obj
DESTDIR     = $$PWD/bin
CONFIG      += resources_big

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
