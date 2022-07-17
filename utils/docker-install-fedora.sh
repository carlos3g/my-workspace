#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita 
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script installs docker and docker-compose in ubuntu based distros
# See:
# https://docs.docker.com/engine/install/fedora
# https://docs.docker.com/engine/install/linux-postinstall
# https://stackoverflow.com/q/41133455

set -e

sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine -y

sudo dnf install dnf-plugins-core -y

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
