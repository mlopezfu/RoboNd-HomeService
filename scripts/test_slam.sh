#!/bin/sh

pip install rospkg
export TURTLEBOT_GAZEBO_WORLD_FILE=$(rospack find map)/mlopezfu.world
terminator -e "roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5
terminator -e "roslaunch turtlebot_gazebo gmapping_demo.launch" &
sleep 2
terminator -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
terminator -e "roslaunch turtlebot_teleop keyboard_teleop.launch"