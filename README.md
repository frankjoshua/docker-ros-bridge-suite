# docker-ros-bridge-suite
docker build . -t frankjoshua/ros-bridge-suite
docker run --network "host" -e ROS_IP=<ROS_IP> -e ROS_MASTER_URI=<ROS_MASTER_IP>:11311 frankjoshua/ros-bridge-suite
