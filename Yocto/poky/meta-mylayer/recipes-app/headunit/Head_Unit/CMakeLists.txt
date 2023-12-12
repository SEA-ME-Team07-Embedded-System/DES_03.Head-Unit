cmake_minimum_required(VERSION 3.15)
project(Head_Unit)

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

find_package(Qt5 COMPONENTS Core Quick Gui Multimedia VirtualKeyboard Location Positioning WebEngine REQUIRED)
        
add_executable(Head_Unit
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

target_compile_definitions(Head_Unit
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(Head_Unit
PRIVATE 
    Qt5::Core 
    Qt5::Quick 
    Qt5::Gui 
    Qt5::Multimedia 
    Qt5::Location 
    Qt5::Positioning 
    Qt5::WebEngine
    Qt5::VirtualKeyboard
    CommonAPI 
    CommonAPI-SomeIP 
    vsomeip3
)
install(TARGETS Head_Unit DESTINATION /usr/bin/example/vsomeip-example)
