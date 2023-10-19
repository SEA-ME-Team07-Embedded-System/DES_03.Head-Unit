cmake_minimum_required(VERSION 3.15)

project(Team7 LANGUAGES CXX)

set(CMAKE_AUTOUIC OU)
set(CMAKE_AUTOMOC OU)
set(CMAKE_AUTORCC OU)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

add_subdirectory(project-pyracer)
add_subdirectory(dashboard)
add_subdirectory(head_unit)
