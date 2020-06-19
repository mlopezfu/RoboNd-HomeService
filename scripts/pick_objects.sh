#!/bin/sh

export TURTLEBOT_GAZEBO_WORLD_FILE=$(rospack find map)/mlopezfu.world
export TURTLEBOT_GAZEBO_MAP_FILE=$(rospack find map)/mlopezfu_map.yaml
pip install rospkg
terminator -e "roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5
terminator -e "roslaunch turtlebot_gazebo amcl_demo.launch" &
sleep 5
terminator -e "roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5
terminator -e "rosrun pick_objects pick_objects" &
sleep 5
#test that pick objects works by publishing markers
terminator -e "echo 'Testing pick objects with 2 markers'; rostopic pub -1 /visualization_marker visualization_msgs/Marker -f /home/workspace/catkin_ws/src/pick_objects/src/test_marker1.yaml; sleep 5; rostopic pub -1 /visualization_marker visualization_msgs/Marker -f /home/workspace/catkin_ws/src/pick_objects/src/test_marker2.yaml"
