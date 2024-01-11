cmake_minimum_required(VERSION 3.15)
project(ivi_compositor)

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

find_package(Qt5 COMPONENTS Core Quick Gui Multimedia WaylandCompositor REQUIRED)

add_executable(ivi_compositor
        src/main.cpp
        src/ivi-compositor.qrc
        src/piracersomeipmanager.cpp
        src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
        src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
)

target_compile_definitions(ivi_compositor
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(ivi_compositor
PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Gui
        Qt5::Multimedia
        Qt5::WaylandCompositor
        CommonAPI 
        CommonAPI-SomeIP 
        vsomeip3
)
install(TARGETS ivi_compositor DESTINATION /usr/bin/application)
