#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script will:
# - Stop all docker containers
# - Delete all stopped docker containers
# - Delete all docker images
# - Delete all docker volumes

docker container stop $(docker ps -aq)

docker container rm $(docker ps -aq)

docker rmi $(docker images -q)

docker volume rm $(docker volume ls -q)
