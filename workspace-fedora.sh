#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script prepares my fedora based distro after installation. It includes:
# - Installs some utils
# - Installs Brave Browser
# - Installs Telegram
# - Installs VS Code
# - Installs NodeJS and Yarn
# - Installs expo-cli

set -e

sudo dnf check-update -y && sudo dnf upgrade -y

sudo dnf install git curl wget xclip g++ unzip dconf util-linux-user python3 python3-pip dnf-plugins-core -y

# brave install
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# telegram install
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install telegram -y

# vs code install
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update -y
sudo dnf install code -y

# nodejs install
curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
sudo dnf install nodejs -y

# nodejs related installations
sudo npm install --global yarn
yarn config set -- --emoji true
sudo yarn global add expo-cli -y
