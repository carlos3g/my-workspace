#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script prepares my fedora based distro after installation. It includes:
# - Installs some utils
# - Installs VS Code
# - Installs NodeJS and Yarn
# - Installs expo-cli

set -e

sudo dnf install git curl wget xclip g++ unzip dconf util-linux-user python3 python3-pip -y

### programs
## repositories
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
## installations
dnf check-update
sudo dnf install code gnome-tweaks -y

### nodejs related
sudo dnf install nodejs -y
sudo npm install --global yarn
yarn config set -- --emoji true
## yarn global installations
sudo yarn global add expo-cli -y
