cmake_minimum_required(VERSION 3.15)
project(Dashboard)

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

find_package(Qt5 COMPONENTS Core Quick Gui Location Positioning REQUIRED)

add_executable(Dashboard
        src/main.cpp
        src/someipmanager.cpp
        src/dashboard.qrc
        src/piracersomeipmanager.cpp
        src/methodcallsomeipmanager.cpp
        src-gen/v1/commonapi/CANSomeIPDeployment.cpp
        src-gen/v1/commonapi/CANSomeIPProxy.cpp
        src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
        src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
        )

target_compile_definitions(Dashboard
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(Dashboard
PRIVATE 
    Qt5::Core 
    Qt5::Quick 
    Qt5::Gui 
    Qt5::Location 
    Qt5::Positioning 
    CommonAPI 
    CommonAPI-SomeIP 
    vsomeip3
)
install(TARGETS Dashboard DESTINATION /usr/bin/example/vsomeip-example)


