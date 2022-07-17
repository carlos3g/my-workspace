#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script prepares my ubuntu based distro after installation. It includes:
# - Installs some utils
# - Installs Telegram
# - Installs NodeJS and Yarn
# - Installs expo-cli

set -e

sudo apt install git curl wget xclip g++ unrar unzip dconf-cli util-linux python3 python3-pip python3-dev -y

### programs
## repositories
sudo add-apt-repository ppa:atareao/telegram
## installations
sudo apt update -y
sudo apt install telegram -y

### nodejs related
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs -y
sudo npm install --global yarn
yarn config set -- --emoji true
## yarn global installations
sudo yarn global add expo-cli -y
