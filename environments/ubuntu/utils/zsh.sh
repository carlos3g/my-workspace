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

install_and_setup_zsh() {
  sudo apt-get install zsh -y
  chsh -s $(which zsh)
}

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_zinit() {
  sh -c "$(curl -fsSL https://git.io/zinit-install)"
}

install_and_setup_zsh
install_oh_my_zsh
install_zinit
