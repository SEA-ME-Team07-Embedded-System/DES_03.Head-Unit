cmake_minimum_required(VERSION 2.8)
project(Piracer_Middleware)

find_package(PythonLibs REQUIRED)
find_package(Python3 COMPONENTS Development)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

include_directories(
    piracerfeeder/src-gen
    canfeeder/src-gen
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)
link_directories(
    ${CMAKE_LIBRARY_PATH}
)

add_executable(PiracerClient
    piracerfeeder/src/PiracerClient.cpp
    piracerfeeder/src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    piracerfeeder/src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
)
target_link_libraries(PiracerClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(PiracerService
    piracerfeeder/src/PiracerInterface.cpp
    piracerfeeder/src/PiracerClass.cpp
    piracerfeeder/src/GamePad.cpp
    piracerfeeder/src/PiracerStubImpl.cpp
    piracerfeeder/src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    piracerfeeder/src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
    piracerfeeder/src-gen/v1/commonapi/PiracerSomeIPStubAdapter.cpp
)
target_link_libraries(PiracerService Python3::Python pthread CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(CANClient
    canfeeder/src/CANClient.cpp
    canfeeder/src-gen/v1/commonapi/CANSomeIPProxy.cpp
    canfeeder/src-gen/v1/commonapi/CANSomeIPDeployment.cpp
)
target_link_libraries(CANClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(CANService
    canfeeder/src/CANService.cpp
    canfeeder/src/CANStubImpl.cpp
    canfeeder/src-gen/v1/commonapi/CANSomeIPProxy.cpp
    canfeeder/src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp
    canfeeder/src-gen/v1/commonapi/CANSomeIPDeployment.cpp
)
target_link_libraries(CANService CommonAPI CommonAPI-SomeIP vsomeip3)

install(TARGETS PiracerClient DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS PiracerService DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS CANClient DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS CANService DESTINATION /usr/bin/example/vsomeip-example)

install(FILES canfeeder/src/commonapi.ini DESTINATION /usr/bin/example/vsomeip-example)
