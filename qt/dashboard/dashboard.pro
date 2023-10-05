TEMPLATE = app
TARGET = dashboard_new
INCLUDEPATH += .
QT += quick dbus

INCLUDEPATH += ../../someip/project-pyracer/src-gen/
SOURCES += \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.cpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPProxy.cpp \
    ../../someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp \
    dbusmanager.cpp \
    main.cpp \
    someipmanager.cpp

RESOURCES += \
    dashboard.qrc

OTHER_FILES += \
    qml/dashboard.qml \
    qml/DashboardGaugeStyle.qml \
    qml/IconGaugeStyle.qml \
    qml/TachometerStyle.qml \
    qml/TurnIndicator.qml \
    qml/ValueSource.qml

target.path = $$[QT_INSTALL_EXAMPLES]/quickcontrols/extras/dashboard_new
INSTALLS += target

DISTFILES += \
    qml/nightmode.qml

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

unix:!macx: LIBS += -L$$PWD/../../../../build-commonapi/capicxx-core-runtime/build/ -lCommonAPI

INCLUDEPATH += $$PWD/../../../../build-commonapi/capicxx-core-runtime/include
DEPENDPATH += $$PWD/../../../../build-commonapi/capicxx-core-runtime/include

unix:!macx: LIBS += -L$$PWD/../../../../build-commonapi/capicxx-someip-runtime/build/ -lCommonAPI-SomeIP

INCLUDEPATH += $$PWD/../../../../build-commonapi/capicxx-someip-runtime/include
DEPENDPATH += $$PWD/../../../../build-commonapi/capicxx-someip-runtime/include

unix:!macx: LIBS += -L$$PWD/../../../../build-commonapi/vsomeip/build/ -lvsomeip3

INCLUDEPATH += $$PWD/../../../../build-commonapi/vsomeip/interface
DEPENDPATH += $$PWD/../../../../build-commonapi/vsomeip/interface
