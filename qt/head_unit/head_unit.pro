QT += quick dbus

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += ../../someip/project-pyracer/src-gen/
SOURCES += \
        ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.cpp \
        ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPProxy.cpp \
        ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp \
        dbusmanager.cpp \
        main.cpp \
        someipmanager.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    image/car_icon.png \
    image/light_icon.png \
    image/music_icon.png \
    image/navigate_icon.png \
    image/playing_icon.png \
    image/setting_icon.png \
    image/video_icon.png

HEADERS += \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CAN.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANProxy.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANProxyBase.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPProxy.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPStubAdapter.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANStub.hpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANStubDefault.hpp \
    dbusmanager.h \
    someipmanager.h

unix:!macx: LIBS += -L$$PWD/../../../../build-commonapi/capicxx-someip-runtime/build/ -lCommonAPI-SomeIP

INCLUDEPATH += $$PWD/../../../../build-commonapi/capicxx-someip-runtime/include
DEPENDPATH += $$PWD/../../../../build-commonapi/capicxx-someip-runtime/include

unix:!macx: LIBS += -L$$PWD/../../../../build-commonapi/capicxx-core-runtime/build/ -lCommonAPI

INCLUDEPATH += $$PWD/../../../../build-commonapi/capicxx-core-runtime/include
DEPENDPATH += $$PWD/../../../../build-commonapi/capicxx-core-runtime/include

unix:!macx: LIBS += -L$$PWD/../../../../build-commonapi/vsomeip/build/ -lvsomeip3

INCLUDEPATH += $$PWD/../../../../build-commonapi/vsomeip/interface
DEPENDPATH += $$PWD/../../../../build-commonapi/vsomeip/interface
