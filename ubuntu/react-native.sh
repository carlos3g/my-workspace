#!/bin/bash
set -e

# nodejs
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install --no-install-recommends yarn -y
yarn config set -- --emoji true

#libs gráficas
sudo apt-get install build-essential libssl-dev -y
sudo apt-get install gcc-multilib lib32z1 lib32stdc++6 -y

# jdk8
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
sudo update-alternatives --config java

# react, react-native-cli e expo-cli
yarn global add create-react-app -y
yarn global add react-native-cli -y
yarn global add expo-cli -y

# configurando android jdk
wget -P ~/Android/Sdk https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip -O commandlinetools-linux.zip
unzip ~/Android/Sdk/commandlinetools-linux.zip
~/Android/Sdk/tools/bin/sdkmanager "platform-tools" "platforms;android-27" "build-tools;27.0.3" -y
