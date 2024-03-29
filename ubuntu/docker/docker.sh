#!/bin/bash

# https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

sudo usermod -aG docker ${USER}
sudo pkill -SIGHUP dockerd

#sudo setfacl -m user:${USER}:rw /var/run/docker.sock
#sudo systemctl daemon-reload
#sudo systemctl reload docker
