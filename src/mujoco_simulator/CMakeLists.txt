cmake_minimum_required(VERSION 3.16)
project(unitree_mujoco)

enable_language(C)
enable_language(CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_PREFIX_PATH "/opt/unitree_robotics/lib/cmake")

set(mujoco_DIR ${CMAKE_SOURCE_DIR}/3rd_party/mujoco-3.2.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/3rd_party/camke_modules)
find_package(mujoco REQUIRED)
include_directories(${CMAKE_SOURCE_DIR}/3rd_party/mujoco-3.2.0/include)
link_directories(${mujoco_LIBRARIES})

# FILE (GLOB SIM_SRC src/mujoco/*.cc)

set(unitree_sdk2_DIR ${CMAKE_SOURCE_DIR}/3rd_party/unitree_sdk2/lib/cmake/unitree_sdk2)
find_package(unitree_sdk2 REQUIRED)


FILE (GLOB SIM_SRC
        src/joystick/joystick.cc
        src/mujoco/*.cc
        src/unitree_sdk2_bridge/*.cc)

set(SIM_DEPENDENCIES 
    pthread
    ${mujoco_LIBRARIES}
    glfw
    yaml-cpp
    unitree_sdk2)


add_executable(unitree_mujoco ${SIM_SRC} src/main.cc)
target_link_libraries(unitree_mujoco  ${SIM_DEPENDENCIES})

add_executable(test test/test_unitree_sdk2.cpp)
target_link_libraries(test unitree_sdk2)

add_executable(jstest src/joystick/jstest.cc src/joystick/joystick.cc)

SET(CMAKE_BUILD_TYPE Release)