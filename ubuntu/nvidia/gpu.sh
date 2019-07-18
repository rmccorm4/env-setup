#!/bin/bash

# NVIDIA Drivers and nvidia-smi
# Ubuntu 18.04 - 07/17/2019
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y install nvidia-driver-418
