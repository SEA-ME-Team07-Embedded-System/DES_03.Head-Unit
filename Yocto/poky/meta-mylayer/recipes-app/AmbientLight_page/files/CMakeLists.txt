cmake_minimum_required(VERSION 3.15)
project(AmbientLightPage)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

find_package(Qt5 COMPONENTS Core Quick Gui REQUIRED)

add_executable(AmbientLightPage
        src/main.cpp
        src/qml.qrc
        )

target_compile_definitions(AmbientLightPage
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(AmbientLightPage
PRIVATE 
    Qt5::Core 
    Qt5::Quick 
    Qt5::Gui 
)

install(TARGETS AmbientLightPage DESTINATION /usr/bin/application)
