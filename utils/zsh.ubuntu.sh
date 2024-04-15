#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script:
# - Installs ZSH
# - Makes ZSH the default shell
# - Installs Oh-my-ZSH
# - Installs zinit
# - Downloads my custom .zshrc

set -e

### install zsh & make it default
sudo apt-get install zsh -y
chsh -s $(which zsh)

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

### download my custom .zshrc
curl -Lo ~/.zshrc https://raw.githubusercontent.com/carlos3g/my-workspace/master/dotfiles/.zshrc
