#!/bin/bash
set -e

# ppas
sudo add-apt-repository -y ppa:ricotz/docky

sudo apt-get update

# plank
sudo apt-get install plank

# gnome tweaks
sudo apt install gnome-tweaks

# gnome-terminal
sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal ~/Downloads/gnome-terminal
cd gnome-terminal && ./install.sh
rm -rf ~/Downloads/gnome-terminal