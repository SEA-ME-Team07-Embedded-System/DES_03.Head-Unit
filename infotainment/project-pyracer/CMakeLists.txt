cmake_minimum_required(VERSION 2.8)

project(CAN)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

include_directories(
    src-gen
    ~/build-commonapi/capicxx-core-runtime/include
    ~/build-commonapi/capicxx-someip-runtime/include
    ~/build-commonapi/vsomeip/interface
)
link_directories(
    ~/build-commonapi/capicxx-core-runtime/build
    ~/build-commonapi/capicxx-someip-runtime/build
    ~/build-commonapi/vsomeip/build
)
add_executable(CANClient
	src/CANClient.cpp
	src-gen/v1/commonapi/CANSomeIPProxy.cpp
	src-gen/v1/commonapi/CANSomeIPDeployment.cpp
)
target_link_libraries(CANClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(CANService
	src/CANService.cpp
	src/CANStubImpl.cpp
	src-gen/v1/commonapi/CANSomeIPStubAdapter.cpp
	src-gen/v1/commonapi/CANSomeIPDeployment.cpp
)
target_link_libraries(CANService CommonAPI CommonAPI-SomeIP vsomeip3)
