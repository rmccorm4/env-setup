#!/bin/bash
APT_PACKAGE_FILE="apt-packages.txt"
sudo apt-get update
# Install list of packages from a file
sudo apt-get install -y $(awk '{print $1'} ${APT_PACKAGE_FILE})

