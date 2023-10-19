QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
INCLUDEPATH += ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/
SOURCES += \
        main.cpp \
    canclient.cpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPProxy.cpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../build-commonapi/vsomeip/build/release/ -lvsomeip3
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../build-commonapi/vsomeip/build/debug/ -lvsomeip3
else:unix: LIBS += -L$$PWD/../../build-commonapi/vsomeip/build/ -lvsomeip3

INCLUDEPATH += $$PWD/../../build-commonapi/vsomeip/interface
DEPENDPATH += $$PWD/../../build-commonapi/vsomeip/interface

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../build-commonapi/capicxx-someip-runtime/build/release/ -lCommonAPI-SomeIP
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../build-commonapi/capicxx-someip-runtime/build/debug/ -lCommonAPI-SomeIP
else:unix: LIBS += -L$$PWD/../../build-commonapi/capicxx-someip-runtime/build/ -lCommonAPI-SomeIP

INCLUDEPATH += $$PWD/../../build-commonapi/capicxx-someip-runtime/include
DEPENDPATH += $$PWD/../../build-commonapi/capicxx-someip-runtime/include

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../build-commonapi/capicxx-core-runtime/build/release/ -lCommonAPI
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../build-commonapi/capicxx-core-runtime/build/debug/ -lCommonAPI
else:unix: LIBS += -L$$PWD/../../build-commonapi/capicxx-core-runtime/build/ -lCommonAPI

INCLUDEPATH += $$PWD/../../build-commonapi/capicxx-core-runtime/include
DEPENDPATH += $$PWD/../../build-commonapi/capicxx-core-runtime/include

HEADERS += \
    canclient.h \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANStubDefault.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANStub.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPStubAdapter.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPProxy.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANProxyBase.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CANProxy.hpp \
    ../../Embedded-Systems/DES_HU/someip/project-pyracer/src-gen/v1/commonapi/CAN.hpp
