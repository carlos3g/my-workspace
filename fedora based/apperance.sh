#!/bin/bash
set -e

# - dracula-theme/gnome-terminal
git clone https://github.com/dracula/gnome-terminal ~/Downloads/gnome-terminal
cd ~/Downloads/gnome-terminal && ./install.sh
rm -rf ~/Downloads/gnome-terminal
