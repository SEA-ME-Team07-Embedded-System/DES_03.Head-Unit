cmake_minimum_required(VERSION 3.15)
project(MediaPage)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")


find_package(Qt5 COMPONENTS Core Quick Gui Multimedia VirtualKeyboard WebEngine REQUIRED)

add_executable(MediaPage
        src/main.cpp
        src/qml.qrc
        )

target_compile_definitions(MediaPage
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(MediaPage
PRIVATE 
    Qt5::Core 
    Qt5::Quick 
    Qt5::Gui 
    Qt5::Multimedia 
    Qt5::WebEngine
    Qt5::VirtualKeyboard
)

install(TARGETS MediaPage DESTINATION /usr/bin/application)
