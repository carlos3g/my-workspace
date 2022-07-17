#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script:
# - Installs ZSH
# - Makes ZSH the default shell
# - Installs Oh-my-ZSH
# - Installs and applies spaceship theme
# - Installs zinit
# - Downloads my custom .zshrc

set -e

### install zsh, make it default and downloads my ~/.zshrc
sudo dnf install zsh -y
chsh -s $(which zsh)
curl -Lo ~/.zshrc https://raw.githubusercontent.com/carlos3g/my-linux-workspace/master/dotfiles/.zshrc

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

### zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"
