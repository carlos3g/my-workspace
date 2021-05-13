#!/bin/bash
set -e

# ----- PPAS -----
sudo add-apt-repository ppa:atareao/telegram -y # Telegram
sudo add-apt-repository ppa:nilarimogard/webupd8 -y # woeusb
# - Insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
# - VSCode
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg


sudo apt-get update


# - Insomnia
sudo apt-get install insomnia -y

# - Telegram
sudo apt-get install telegram -y

# - BalenaEtcher
wget -c -P ~/Downloads/programs https://github.com/balena-io/etcher/releases/download/v1.5.100/balenaEtcher-1.5.100-x64.AppImage

# - Stacer
wget -c -P ~/Downloads/programs https://github.com/oguzhaninan/Stacer/releases/download/v1.1.0/Stacer-1.1.0-x64.AppImage

# - Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# - discord
wget -c -O ~/Downloads/programs/discord.deb https://discord.com/api/download?platform=linux&format=deb
sudo dpkg -i ~/Downloads/programs/discord.deb

# - VS Code
sudo apt-get install code -y

# - Gnome tweaks
sudo apt install gnome-tweaks -y
