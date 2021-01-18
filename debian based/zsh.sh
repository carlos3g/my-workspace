#!/bin/bash
set -e

# - zsh
sudo apt install zsh -y
chsh -s $(which zsh)

# - fira code font
sudo add-apt-repository universe -y
sudo apt-get update
sudo apt install fonts-firacode -y

# - spaceship
# this command needs to be run manually

# - plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
