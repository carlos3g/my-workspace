#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script makes some style changes in the system. Which includes:
# - Install fonts
# - Install themes

set -e

sudo dnf install fira-code-fonts -y

# - dracula-theme/gnome-terminal
git clone https://github.com/dracula/gnome-terminal ~/Downloads/gnome-terminal
cd ~/Downloads/gnome-terminal && ./install.sh
rm -rf ~/Downloads/gnome-terminal
