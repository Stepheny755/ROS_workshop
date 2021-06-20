# Docker ROS VNC

docker-ros-vnc is a Docker image based on [fcwu/docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop) which adds a ROS2 environment on top of the existing VNC development. The docker-ubuntu-vnc image is running Ubuntu 20.04 focal.

## Quick Start (Docker Image)

Docker image to come!

## Building from Dockerfile

1. Download the dockerfile from this repository

```shell
git clone https://github.com/Stepheny755/docker-ros-vnc
```

2. Run the command below to download and build the docker container. 

```shell
docker build -t docker-ros-vnc .
```

3. Run the command below to start the docker container. Note that VNC viewer access is provided over port `6080`
```shell
docker run -it -p 6080:80 docker-ros-vnc
```

4. The VNC instance can be accessed at http://127.0.0.1:6080/ in any web browser
