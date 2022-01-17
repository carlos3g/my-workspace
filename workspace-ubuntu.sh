set -e

sudo apt install git curl wget xclip g++ unrar unzip dconf-cli util-linux python3 python3-pip python3-dev -y

### programs
## repositories
sudo add-apt-repository ppa:atareao/telegram
## installations
sudo apt update -y
sudo apt install telegram gnome-tweaks -y

### nodejs related
sudo apt install nodejs npm -y
sudo npm install --global yarn
yarn config set -- --emoji true
## yarn global installations
sudo yarn global add expo-cli -y
