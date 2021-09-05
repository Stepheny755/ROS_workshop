# Docker ROS VNC

docker-ros-vnc is a Docker image based on [fcwu/docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop) which adds a ROS2 environment on top of the existing VNC development. The docker-ubuntu-vnc image is running Ubuntu 20.04 focal.

## Docker Setup

If you don't have Docker installed, please follow one of the setup links below.

### Windows Setup

Please follow [this link for Docker Desktop windows setup](https://docs.docker.com/docker-for-windows/install/).

### Mac Setup

Please follow [this link for Docker Desktop Mac setup](https://docs.docker.com/docker-for-mac/install/).

### Linux Setup

Please follow [this link for Docker Linux setup](https://docs.docker.com/engine/install/). Note that there are different installation requirements depending on the distro you are installing on.

## Container Setup

Setting up the actual docker-ros-vnc container. There are two ways to setup the docker container:

* Installing from Docker Image (quick option)
* Installing from dockerfile

### Building from Image

1. Pull the image from dockerhub.
```
docker pull stepheny755/docker-ros-vns:latest
```

2. Run the command below to start the docker container. Note that VNC viewer access is provided over port `6080`
```shell
docker run --mount source=ros_workshop,target=/root -it -p 6080:80 stepheny755/docker-ros-vnc
```

3. The VNC instance can be accessed at http://127.0.0.1:6080/ in any web browser


### Building from Dockerfile

1. Download the dockerfile from this repository

```shell
git clone https://github.com/Stepheny755/docker-ros-vnc
cd docker-ros-vnc
```

2. Run the command below to download and build the docker container. 

```shell
docker build -t docker-ros-vnc .
```

3. Run the command below to start the docker container. Note that VNC viewer access is provided over port `6080`
```shell
docker run --mount source=ros_workshop,target=/root -it -p 6080:80 docker-ros-vnc
```

4. The VNC instance can be accessed at http://127.0.0.1:6080/ in any web browser

## Persistent Storage

Docker Volumes are created for the /root folder (~/) folder by default. Files stored in the ~/ directory will be saved accross each launch of the container. You can change the directory to bind to the volume by editing the path in the `target` parameter of the `--mount` flag in the `docker run` command.
