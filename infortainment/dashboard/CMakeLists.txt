cmake_minimum_required(VERSION 3.15)
project(Dashboard)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_PREFIX_PATH "/home/Qt/5.15.2/gcc_64")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

include_directories(
    ../project-pyracer/src-gen
    ~/build-commonapi/capicxx-core-runtime/include
    ~/build-commonapi/capicxx-someip-runtime/include
    ~/build-commonapi/vsomeip/interface
)
link_directories(
    ~/build-commonapi/capicxx-core-runtime/build
    ~/build-commonapi/capicxx-someip-runtime/build
    ~/build-commonapi/vsomeip/build
)

find_package(Qt5 COMPONENTS Core Quick Gui DBus Location Positioning REQUIRED)

add_executable(Dashboard
        src/main.cpp
        src/dbusmanager.cpp
        src/someipmanager.cpp
        src/dashboard.qrc
        ../project-pyracer/src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp
        ../project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.cpp
        ../project-pyracer/src-gen/v1/commonapi/CANSomeIPProxy.cpp
        ../project-pyracer/src-gen/v1/commonapi/CANSomeIPDeployment.cpp
        )

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
