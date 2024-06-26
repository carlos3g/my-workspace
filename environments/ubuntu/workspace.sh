#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script prepares my ubuntu based distro after installation. It includes:
# - Installs some utils
# - Installs Brave Browser
# - Installs Telegram
# - Installs VS Code
# - Installs NodeJS and Yarn
# - Installs Cargo and rust cml alternatives
# - Installs asdf

set -e

update_system() {
  sudo apt update -y && sudo apt upgrade -y
}

install_utils() {
  sudo apt install git curl wget xclip g++ unrar unzip dconf-cli util-linux python3 python3-pip python3-dev gpg apt-transport-https bat gpg -y

  sudo ln -s /usr/bin/batcat /usr/bin/bat
}

install_brave() {
  # See: https://brave.com/linux
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

  sudo apt update -y
  sudo apt install brave-browser -y
}

install_telegram() {
  # See: https://www.edivaldobrito.com.br/telegram-no-ubuntu-fedora/
  sudo add-apt-repository -y ppa:atareao/telegram

  sudo apt update -y
  sudo apt install telegram -y
}

install_vs_code() {
  # See: https://code.visualstudio.com/docs/setup/linux
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg

  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings

  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg

  sudo apt update -y
  sudo apt install code -y
}

install_nodejs() {
  # See: https://github.com/nvm-sh/nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

  source ~/.zshrc

  nvm install lts/iron
}

install_nodejs_related_programs() {
  npm install --global yarn react-devtools
  yarn config set -- --emoji true
}

install_android_studio() {
  # See: https://www.edivaldobrito.com.br/instalar-android-studio-no-ubuntu/
  sudo add-apt-repository -y ppa:maarten-fonville/android-studio
  sudo apt-get update -y
  sudo apt-get install -y android-studio
}

install_java() {
  # See: https://stackoverflow.com/questions/52504825/how-to-install-jdk-11-under-ubuntu
  sudo apt-get install -y openjdk-17-jdk
}

install_cargo_and_rust_alternatives() {
  # See: https://doc.rust-lang.org/cargo/getting-started/installation.html
  curl https://sh.rustup.rs -sSf | sh

  source $HOME/.cargo/env

  cargo install bottom bat eza fd-find procs sd du-dust bandwhich
}

install_asdf() {
  # See: https://asdf-vm.com/guide/getting-started.html
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
}

install_pnpm() {
  # See: https://pnpm.io/installation
  curl -fsSL https://get.pnpm.io/install.sh | sh -
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

update_system
install_utils
install_brave
install_telegram
install_vs_code
install_nodejs
install_nodejs_related_programs
install_android_studio
install_java
install_cargo_and_rust_alternatives
install_asdf
install_pnpm
install_homebrew
