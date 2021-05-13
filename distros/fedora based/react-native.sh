#!/bin/bash
set -e

# - Nodejs
sudo dnf module install nodejs:12 -y

# - Yarn
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install yarn -y
yarn config set -- --emoji true

# - react, react-native-cli e expo-cli
sudo yarn global add react-native-cli expo-cli -y
