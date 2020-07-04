#!/bin/bash
set -e

# wget, curl e git
sudo apt-get install curl -y
sudo apt-get install wget -y
sudo apt-get install git -y
sudo apt update
sudo apt upgrade -y

# python
sudo apt install python3 python3-pip python3-env idle3 -y

# estrutura de pastas
mkdir -p ~/Downloads/ISOs
mkdir -p ~/Downloads/programs
mkdir -p ~/Documents/programming/js
mkdir -p ~/Documents/programming/python
mkdir -p ~/Documents/programming/arduino
mkdir -p ~/Documents/programming/open-source
mkdir -p ~/Documents/programming/projetos
mkdir -P ~/Android/Sdk

# programas
./programs.sh

# react e react-native
./react-native.sh

# zsh
./zsh.sh

# -- configs
# - zshrc
mv ../.zshrc ~
# - VS Code
mv ../settings.json ~/.config/Code/User
