#!/bin/bash

mj_simulator_path="src/mujoco_simulator/build"


# 根据传入的参数加载相应的 ROS 2 环境
if [ "$1" == "-c" ]; then
    if [ -e "$mj_simulator_path" ]; then
        rm -rf ./src/mujoco_simulator/build
    else
        echo "$mj_simulator_path not exist. "
    fi
    catkin clean -y
    rm -rf ./log .catkin_tools
    echo "clean success."
    exit 0
else
    echo "start build.sh"
fi


echo ">>> Start build mujoco_simulator..."
if [ -e "$mj_simulator_path" ]; then
        echo "$mj_simulator_path exist. "
    else
        
        cd src/mujoco_simulator
        mkdir build && cd build && cmake .. && make -j4
        cd ../../..
    fi


echo ">>> Start build rl_sar..."
catkin build 