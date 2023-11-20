cmake_minimum_required(VERSION 2.8)
project(Piracer_Middleware)

# Find the Python3 libraries
find_package(Python3 COMPONENTS Development)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")
include_directories(
    piracer-interface/src-gen
    can-interface/src-gen
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)
link_directories(
    ${CMAKE_LIBRARY_PATH}
)

add_executable(PiracerClient
    piracer-interface/src/PiracerClient.cpp
    piracer-interface/src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    piracer-interface/src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
)
target_link_libraries(PiracerClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(PiracerService
    piracer-interface/src/PiracerInterface.cpp
    piracer-interface/src/PiracerClass.cpp
    piracer-interface/src/GamePad.cpp
    piracer-interface/src/PiracerStubImpl.cpp
    piracer-interface/src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    piracer-interface/src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
    piracer-interface/src-gen/v1/commonapi/PiracerSomeIPStubAdapter.cpp
)
target_link_libraries(PiracerService Python3::Python pthread CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(CANClient
    can-interface/src/CANClient.cpp
    can-interface/src-gen/v1/commonapi/CANSomeIPProxy.cpp
    can-interface/src-gen/v1/commonapi/CANSomeIPDeployment.cpp
)
target_link_libraries(CANClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(CANService
    can-interface/src/CANService.cpp
    can-interface/src/CANStubImpl.cpp
    can-interface/src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp
    can-interface/src-gen/v1/commonapi/CANSomeIPDeployment.cpp
)
target_link_libraries(CANService CommonAPI CommonAPI-SomeIP vsomeip3)

install(TARGETS PiracerClient DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS PiracerService DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS CANClient DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS CANService DESTINATION /usr/bin/example/vsomeip-example)

