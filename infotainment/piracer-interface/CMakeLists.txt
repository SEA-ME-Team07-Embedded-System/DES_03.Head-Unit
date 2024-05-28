cmake_minimum_required(VERSION 2.8)
project(PiracerInterface)

# Find the Python3 libraries
find_package(Python3 COMPONENTS Development)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")
include_directories(
    src-gen
    ~/build-commonapi/capicxx-core-runtime/include
    ~/build-commonapi/capicxx-someip-runtime/include
    ~/vsomeip/interface
)
link_directories(
    ~/build-commonapi/capicxx-core-runtime/build
    ~/build-commonapi/capicxx-someip-runtime/build
    ~/vsomeip/build
)

add_executable(PiracerClient
    src/PiracerClient.cpp
    src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
)
target_link_libraries(PiracerClient CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(PiracerService_test
    src/PiracerService_test.cpp
    src/PiracerStubImpl.cpp
    src/PiracerClass.cpp
    src/GamePad.cpp
    src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
    src-gen/v1/commonapi/PiracerSomeIPStubAdapter.cpp
)
target_link_libraries(PiracerService_test Python3::Python pthread CommonAPI CommonAPI-SomeIP vsomeip3)

add_executable(PiracerInterface
    src/PiracerInterface.cpp
    src/PiracerClass.cpp
    src/GamePad.cpp
    src/PiracerStubImpl.cpp
    src-gen/v1/commonapi/PiracerSomeIPProxy.cpp
    src-gen/v1/commonapi/PiracerSomeIPDeployment.cpp
    src-gen/v1/commonapi/PiracerSomeIPStubAdapter.cpp
)
target_link_libraries(PiracerInterface Python3::Python pthread CommonAPI CommonAPI-SomeIP vsomeip3)
