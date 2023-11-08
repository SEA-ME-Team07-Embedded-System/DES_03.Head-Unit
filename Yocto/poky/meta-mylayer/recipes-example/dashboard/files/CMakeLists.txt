#cmake_minimum_required(VERSION 3.15)
cmake_minimum_required(VERSION 2.8)
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

find_package(Qt5 COMPONENTS Core Quick Gui DBus Location Positioning REQUIRED)

add_executable(Dashboard
        src/main.cpp
        src/dbusmanager.cpp
        src/someipmanager.cpp
        src/dashboard.qrc
        src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp
        src-gen/v1/commonapi/CANSomeIPDeployment.cpp
        src-gen/v1/commonapi/CANSomeIPProxy.cpp
        src-gen/v1/commonapi/CANSomeIPDeployment.cpp
        )
target_link_libraries(Dashboard CommonAPI CommonAPI-SomeIP vsomeip3)

target_compile_definitions(Dashboard
PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(Dashboard
PRIVATE 
    Qt5::Core 
    Qt5::Quick 
    Qt5::Gui 
    Qt5::DBus 
    Qt5::Location 
    Qt5::Positioning 
    CommonAPI 
    CommonAPI-SomeIP 
    vsomeip3
)

install(TARGETS Dashboard DESTINATION /usr/bin/example/vsomeip-example)
