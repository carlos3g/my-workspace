#!/bin/bash
set -e

# - wget, curl, g++, unzip e git
sudo dnf install git-all curl wget git g++ unzip -y

# - python
sudo dnf install python3 python3-pip idle3 -y

clear && echo "---- ESTRUTURA DE PASTAS ----"

# - estrutura de pastas
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

# - permissões
chmod +x ./programs.sh
chmod +x ./react-native.sh
chmod +x ./zsh.sh

clear && echo "---- PROGRAMS.sh ----"
./programs.sh

clear && echo "---- REACT-NATIVE.sh ----"
./react-native.sh

clear && echo "---- ZSH.sh ----"
./zsh.sh

clear && echo "---- CONFIGS ----"

# - git configs
# https://gist.github.com/carlos3g/7a676386eb6bdfe983e0982310f7f5b3

clear
echo -e '\033[01;33mQuase tudo ok. agora execute estes comandos:\033[0m'
echo '\n'
echo -e '\033[01;32m❯ \033[0m\033[01;36msh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \033[0m'
echo -e '\033[01;32m❯ \033[0m\033[01;36msudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" \033[0m'
echo -e '\033[01;32m❯ \033[0m\033[01;36msudo ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme" \033[0m'
echo '\n\n\n'
