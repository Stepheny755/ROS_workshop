FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
 xfce4 \
 xfce4-goodies \
 tightvncserver \
 locales

WORKDIR /root/

RUN mkdir -p /root/.vnc
COPY xstartup /root/.vnc/
RUN chmod a+x /root/.vnc/xstartup
RUN touch /root/.vnc/passwd
RUN /bin/bash -c "echo -e 'password\npassword\nn' | vncpasswd" > /root/.vnc/passwd
RUN chmod 400 /root/.vnc/passwd
RUN chmod go-rwx /root/.vnc
RUN touch /root/.Xauthority

COPY start-vncserver.sh /root/
RUN chmod a+x /root/start-vncserver.sh

RUN echo "mycontainer" > /etc/hostname
RUN echo "127.0.0.1	localhost" >> /etc/hosts
RUN echo "127.0.0.1	mycontainer" >> /etc/hosts

EXPOSE 5901
ENV USER root
CMD [ "/root/start-vncserver.sh" ]
