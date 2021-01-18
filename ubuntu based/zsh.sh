#!/bin/bash
set -e

# - instalando zsh
sudo apt install zsh -y
chsh -s $(which zsh)

# - fira code font
sudo add-apt-repository universe -y
sudo apt-get update
sudo apt install fonts-firacode -y

# - oh-my-zsh
# o oh-my-zsh deve ser executado manualmente, pois esse comando interrompe o script

# - spaceship
# o spaceship deve ser executado manualmente, pois esse comando interrompe o script

# - plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
