#!/bin/sh
export TURTLEBOT_GAZEBO_WORLD_FILE=$(rospack find map)/mlopezfu.world
export TURTLEBOT_GAZEBO_MAP_FILE=$(rospack find map)/mlopezfu_map.yaml
pip install rospkg
terminator -e "roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5
terminator -e "roslaunch turtlebot_gazebo amcl_demo.launch" &
sleep 5
terminator -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 10
terminator -e "rosrun add_markers add_markers"