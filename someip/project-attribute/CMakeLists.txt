cmake_minimum_required(VERSION 2.8)

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
add_executable(E02AttributesClient
        src/E02AttributesClient.cpp
        src-gen/v1/commonapi/examples/E02AttributesSomeIPProxy.cpp
        src-gen/v1/commonapi/examples/E02AttributesSomeIPDeployment.cpp
)
target_link_libraries(E02AttributesClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(E02AttributesService
        src/E02AttributesService.cpp
        src/E02AttributesStubImpl.cpp
        src-gen/v1/commonapi/examples/E02AttributesSomeIPStubAdapter.cpp
        src-gen/v1/commonapi/examples/E02AttributesSomeIPDeployment.cpp
)
target_link_libraries(E02AttributesService CommonAPI CommonAPI-SomeIP vsomeip3)
