#!/bin/bash
set -e

# wget, curl e git
sudo apt-get install curl wget git g++ -y
sudo apt update && sudo apt upgrade -y

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

# - mostrar todos os aplicativos de inicialização
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
# - teclado abnt2
setxkbmap -model abnt2 -layout br

clear
echo -e '\033[01;33mQuase tudo ok. agora execute estes comandos:\033[0m'
echo '\n'
echo -e '\033[01;32m❯ \033[0m\033[01;36m~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y\033[0m'
echo -e '\033[01;32m❯ \033[0m\033[01;36msh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \033[0m'
echo -e '\033[01;32m❯ \033[0m\033[01;36msudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" \033[0m'
echo -e '\033[01;32m❯ \033[0m\033[01;36msudo ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme" \033[0m'
echo '\n\n\n'
