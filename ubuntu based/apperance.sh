#!/bin/bash
set -e

# ppas
sudo add-apt-repository -y ppa:ricotz/docky

sudo apt-get update

# plank
sudo apt-get install plank

# dracula-theme/gnome-terminal
sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal ~/Downloads/gnome-terminal
cd gnome-terminal && ./install.sh
rm -rf ~/Downloads/gnome-terminal

# dracula-theme/gedit
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula.xml
mv dracula.xml ~/.local/share/gedit/styles/

# change lockscreen theme. WARNING: this only works if you use gdm and a ubuntu 20.10(or longer) based ditribution
sudo apt install make gcc libgtk-3-dev libpolkit-gobject-1-dev
git clone https://github.com/thiggy01/gdm-background.git && cd gdm-background
make && sudo make install