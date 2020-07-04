#!/bin/bash
set -e

# -- zsh
sudo apt install zsh -y
chsh -s $(which zsh)
# - oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# - fira code font
add-apt-repository universe
sudo apt-get update
sudo apt install fonts-firacode -y
# - spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"
# - plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
