FROM ros:melodic-ros-base

RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# add environment setup 
RUN bin/bash -c "echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> .bashrc"

# Install Ros Bridge Suite
# Install tf2 Web Republisher
RUN /bin/bash -c "apt-get update && \
    source /opt/ros/$ROS_DISTRO/setup.bash && \
    mkdir -p /catkin_ws/src && \
    cd /catkin_ws/src && \
    git clone https://github.com/RobotWebTools/rosbridge_suite.git && \
    git clone https://github.com/RobotWebTools/tf2_web_republisher.git && \
    catkin_init_workspace && \
    cd /catkin_ws/ && \
    apt-get update && \
    rosdep update && \
    rosdep install --from-paths src -i -y &&\
    catkin_make && \
    echo 'source /catkin_ws/devel/setup.bash' >> /.bashrc && \
    rm -rf /var/lib/apt/lists/"

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --include \
    --no-buffer \
    -I \
    --header "Connection: Close" \
    --header "Upgrade: websocket" \
    --header "Host: localhost:9090" \
    --header "Origin: http://localhost:9090" \
    --header "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" \
    --header "Sec-WebSocket-Version: 13" \
    http://localhost:9090

RUN mkdir -p /app
COPY ./app /app
WORKDIR /app
CMD ["roslaunch", "--wait", "ros.launch"]