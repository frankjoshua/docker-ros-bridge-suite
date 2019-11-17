# docker-ros-bridge-suite
docker build . -t frankjoshua/ros-bridge-suite

docker run --network "host" -e ROS_IP=$ROS_IP -e ROS_MASTER_URI=$ROS_MASTER_URI frankjoshua/ros-bridge-suite
