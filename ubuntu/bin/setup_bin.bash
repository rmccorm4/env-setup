#!/bin/bash
BIN=${HOME}/bin
mkdir -p ${BIN}

# Bat - https://github.com/sharkdp/bat
BAT_DEB=bat_0.11.0_amd64.deb
wget -P ${BIN} https://github.com/sharkdp/bat/releases/download/v0.11.0/${BAT_DEB} 
sudo dpkg -i ${BIN}/${BAT_DEB}
