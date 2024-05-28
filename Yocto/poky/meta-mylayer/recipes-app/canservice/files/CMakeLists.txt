cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

include_directories(
    src-gen
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)
link_directories(
    ${CMAKE_LIBRARY_PATH}
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

install(TARGETS CANClient DESTINATION /usr/bin/vsomeip)
install(TARGETS CANService DESTINATION /usr/bin/vsomeip)
