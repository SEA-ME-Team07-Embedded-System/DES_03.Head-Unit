cmake_minimum_required(VERSION 3.15)
project(SettingPage)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

include_directories(
    src-gen
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)
link_directories(
    ${CMAKE_LIBRARY_PATH}
)

find_package(Qt5 COMPONENTS Core Quick Gui REQUIRED)

add_executable(SettingPage
        src/main.cpp
        src/someipmanager.cpp
        src/methodcallsomeipmanager.cpp
        src/piracersomeipmanager.cpp
        src/qml.qrc
        src-gen/v1/commonapi/CANSomeIPDeployment.cpp
        src-gen/v1/commonapi/CANSomeIPProxy.cpp
        src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
        src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp

        )

target_compile_definitions(SettingPage
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(SettingPage
PRIVATE 
    Qt5::Core 
    Qt5::Quick 
    Qt5::Gui 
    CommonAPI 
    CommonAPI-SomeIP 
    vsomeip3
)
install(TARGETS SettingPage DESTINATION /usr/bin/application)
