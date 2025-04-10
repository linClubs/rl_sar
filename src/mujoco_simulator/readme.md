~~~python
# 1 build
cd rl_sar
./build.sh

# 2 start mujoco simulator
./mj_simulator.sh

# 3 run rl_sar
source devel/setup.bash
rosrun rl_sar rl_mj_go2
~~~