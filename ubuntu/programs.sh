#!/bin/bash

# -- baixando programas
# - Telegram
wget -P ~/Downloads/programs https://telegram.org/dl/desktop/linux
# - Arduino IDE
wget -P ~/Downloads/programs https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz
# - WPS Office
wget -P ~/Downloads/programs http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9126/wps-office_11.1.0.9126.XA_amd64.deb
# - Chrome
wget -P ~/Downloads/programs https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# - VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get -y install apt-transport-https
apt-get -y update
apt-get -y install code
