#!/bin/bash

# https://nvidia.github.io/nvidia-container-runtime/
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
sudo apt-get update

# https://github.com/NVIDIA/nvidia-container-runtime#installation
sudo apt-get install -y nvidia-container-runtime

sudo usermod -aG docker ${USER}
sudo pkill -SIGHUP dockerd

#sudo setfacl -m user:$USER:rw /var/run/docker.sock
#sudo systemctl daemon-reload
#sudo systemctl reload docker
