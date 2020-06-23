#!/bin/bash
set -e

# - Telegram
wget -c -P ~/Downloads/programs https://telegram.org/dl/desktop/linux
# - Arduino IDE
wget -c -P ~/Downloads/programs https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz
# - WPS Office
wget -c -P ~/Downloads/programs http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9126/wps-office_11.1.0.9126.XA_amd64.deb
# - Chrome
wget -c -P ~/Downloads/programs https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# - VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get -y install apt-transport-https
sudo apt-get -y update
sudo apt-get -y install code
