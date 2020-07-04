#!/bin/bash
set -e

# wget, curl e git
sudo apt-get install curl -y
sudo apt-get install wget -y
sudo apt-get install git -y
sudo apt update
sudo apt upgrade -y

# python
sudo apt install python3 python3-pip python3-dev python3-venv idle3 -y

clear
echo "---- FOLDERS ----"

# estrutura de pastas
mkdir -p ~/Downloads/ISOs
mkdir -p ~/Downloads/programs
mkdir -p ~/Documents/programming/js
mkdir -p ~/Documents/programming/python
mkdir -p ~/Documents/programming/arduino
mkdir -p ~/Documents/programming/open-source
mkdir -p ~/Documents/programming/projetos
mkdir -p ~/Android/Sdk

# programas
clear
echo "---- PROGRAMS.sh ----"
./programs.sh

# react e react-native
clear
echo "---- REACT-NATIVE.sh ----"
./react-native.sh

# zsh
clear
echo "---- ZSH.sh ----"
./zsh.sh

clear
echo "---- CONFIGS ----"

# -- configs
# - zshrc
mv ../.zshrc ~
# - VS Code
mv ../settings.json ~/.config/Code/User
