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
echo "---- ESTRUTURA DE PASTAS ----"

# estrutura de pastas
mkdir -p ~/Downloads/ISOs
mkdir -p ~/Downloads/programs
mkdir -p ~/Documents/programming/js
mkdir -p ~/Documents/programming/python
mkdir -p ~/Documents/programming/arduino
mkdir -p ~/Documents/programming/open-source
mkdir -p ~/Documents/programming/projetos
mkdir -p ~/Android/Sdk
mkdir -p ~/.config/Code/User

# permissões
chmod +x ./programs.sh
chmod +x ./react-native.sh
chmod +x ./zsh.sh

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

# - zshrc
mv ../.zshrc ~
# - VS Code
mv ../settings.json ~/.config/Code/User
# - mostrar todos os aplicativos de inicialização
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
# - teclado abnt2
setxkbmap -model abnt2 -layout br


# ----- comandos que necessitam ficar no final do arquivo -----
# react-native android sdk
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
