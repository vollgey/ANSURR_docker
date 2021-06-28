FROM ubuntu:latest

RUN apt-get update && apt-get install -y sudo
RUN apt-get update
RUN apt-get -y install git

ARG USERNAME=protein
ARG GROUPNAME=protein
ARG UID=1000
ARG GID=1000
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/

RUN git clone https://github.com/nickjf/ANSURR.git