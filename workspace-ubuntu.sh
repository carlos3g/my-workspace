#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script prepares my ubuntu based distro after installation. It includes:
# - Installs some utils
# - Installs Brave Browser
# - Installs Telegram
# - Installs VS Code
# - Installs NodeJS and Yarn
# - Installs expo-cli

set -e

sudo apt update -y && sudo apt upgrade -y

sudo apt install git curl wget xclip g++ unrar unzip dconf-cli util-linux python3 python3-pip python3-dev gpg apt-transport-https -y

# brave install
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y

# telegram install
sudo add-apt-repository ppa:atareao/telegram
sudo apt update -y
sudo apt install telegram -y

# vs code install
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update -y
sudo apt install code -y

# nodejs install
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs -y

# nodejs related installations
sudo npm install --global yarn
yarn config set -- --emoji true
sudo yarn global add expo-cli -y
