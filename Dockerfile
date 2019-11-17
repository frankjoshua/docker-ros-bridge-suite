FROM ros:lunar-ros-base

RUN apt-get update &&\
    apt-get install -y ros-$ROS_DISTRO-rosbridge-suite &&\
    apt-get -y clean &&\
    apt-get -y purge &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["roslaunch", "--wait", "rosbridge_server", "rosbridge_websocket.launch"]