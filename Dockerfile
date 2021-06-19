FROM dorowu/ubuntu-desktop-lxde-vnc:focal

RUN apt update && apt install -y \
curl \
gnupg2 \
lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update && apt install -y \
ros-foxy-desktop \
python3-argcomplete

RUN echo "source /opt/ros/foxy/setup.bash" >> .bashrc
EXPOSE 5900
