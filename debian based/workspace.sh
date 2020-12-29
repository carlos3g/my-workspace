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
case $1 in
"pt_br") mkdir -p ~/Documentos/programming/{js,python,arduino,open-source,projetos}
;;
"en") mkdir -p ~/Documents/programming/{js,python,arduino,open-source,projetos}
;;
*) echo "invalid language"
;;
esac
mkdir -p ~/Downloads/ISOs
mkdir -p ~/Downloads/programs
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


# ----- comandos que necessitam ficar no final do arquivo -----
# react-native android sdk
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
