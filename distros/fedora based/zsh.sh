#!/bin/bash
set -e

# - instalando zsh
sudo dnf install zsh -y
chsh -s $(which zsh)

# - fira code font
sudo dnf install fira-code-fonts -y

# - oh-my-zsh
# o oh-my-zsh deve ser executado manualmente, pois esse comando interrompe o script

# - spaceship
# o spaceship deve ser executado manualmente, pois esse comando interrompe o script

# - plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
