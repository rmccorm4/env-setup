#!/bin/bash

# https://github.com/NVIDIA/nvidia-docker#ubuntu-140416041804-debian-jessiestretch
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
# In case of incompatible docker version error:
#   sudo apt install -y --allow-downgrades docker-ce=5:18.09.7~3-0~ubuntu-bionic
sudo apt-get install -y nvidia-docker2

sudo usermod -aG docker ${USER}
sudo pkill -SIGHUP dockerd

#sudo setfacl -m user:$USER:rw /var/run/docker.sock
#sudo systemctl daemon-reload
#sudo systemctl reload docker
