FROM ros:noetic-ros-base

RUN apt-get update &&\
    apt-get install -y ros-$ROS_DISTRO-rosbridge-suite &&\
    apt-get -y clean &&\
    apt-get -y purge &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

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

CMD ["roslaunch", "--wait", "rosbridge_server", "rosbridge_websocket.launch"]
