# ROS Bridge Suite in Docker [![](https://img.shields.io/docker/pulls/frankjoshua/ros-bridge-suite)](https://hub.docker.com/r/frankjoshua/ros-bridge-suite) [![Build Status](https://travis-ci.org/frankjoshua/docker-ros-bridge-suite.svg?branch=master)](https://travis-ci.org/frankjoshua/docker-ros-bridge-suite)

docker build . -t frankjoshua/ros-bridge-suite

docker run --network "host" -e ROS_IP=$ROS_IP -e ROS_MASTER_URI=$ROS_MASTER_URI frankjoshua/ros-bridge-suite
