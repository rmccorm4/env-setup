#!/bin/bash

# Allow your desktop to be SSH'd into
sudo apt update
sudo apt install -y openssh-server
# Look for address next to 'inet' (ignore 127.x.x.x/localhost)
ip address
