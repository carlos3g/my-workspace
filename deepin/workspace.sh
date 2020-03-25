#!/bin/bash

apt -y update
apt -y upgrade
apt-get -y install wget
apt-get -y install git-all

# estrutura de pastas
mkdir -p ~/Downloads/{ISOs, programs}
mkdir -p ~/Documentos/programming/{js,python,arduino,open-source,projetos}
mkdir -P ~/Android/Sdk

# curl
apt-get -y install curl

# python
apt -y install python3 python3-pip

# nvm, nodejs, npm e yarn
apt-get -y install build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get -y update && apt-get -y install yarn
yarn config set -- --emoji true

# react, react-native-cli e expo-cli
yarn global add create-react-app
yarn global add react-native-cli
yarn global add expo-cli
apt-get -y install gcc-multilib lib32z1 lib32stdc++6

# jdk8
add-apt-repository ppa:openjdk-r/ppa
apt-get -y update
apt-get -y install openjdk-8-jdk

# configurando android jdk
wget -P ~/Android/Sdk https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip -O commandlinetools-linux.zip
unzip commandlinetools-linux.zip
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3"

# -- zsh
apt -y install zsh
chsh -s $(which zsh)
# - oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# - fira code font
add-apt-repository universe
apt-get -y update
apt -y install fonts-firacode
# - spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"
# - plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"


# -- instalando alguns programas
# - Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get -y install apt-transport-https
apt-get -y update
apt-get -y install code

# -- baixando programas
# - Telegram
wget -P ~/Downloads/programs https://telegram.org/dl/desktop/linux
# - Arduino IDE
wget -P ~/Downloads/programs https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz
# - Natron
wget -P ~/Downloads/programs https://github.com/NatronGitHub/Natron/releases/download/v2.3.14/Natron-2.3.14-Linux-x86_64bit.tgz
# - WPS Office
wget -P ~/Downloads/programs http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9126/wps-office_11.1.0.9126.XA_amd64.deb
# - Chrome
wget -P ~/Downloads/programs https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# -- configs
# - zshrc
cp .zshrc ~
# - VS Code
cp settings.json ~/.config/Code/User
