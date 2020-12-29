#!/bin/bash
set -e

# ppas
sudo add-apt-repository -y ppa:ricotz/docky

sudo apt-get update

# plank
sudo apt-get install plank

# gnome tweaks
sudo apt install gnome-tweaks