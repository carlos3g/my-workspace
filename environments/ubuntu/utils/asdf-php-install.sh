#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------

set -e

install_dependencies() {
  # See: https://github.com/asdf-community/asdf-php/blob/master/.github/workflows/workflow.yml
  sudo apt-get install -y autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev
}

install_asdf_php() {
  asdf plugin-add php https://github.com/asdf-community/asdf-php.git
}

install_php_latest() {
  # See: https://github.com/asdf-vm/asdf/issues/557
  asdf install php latest
  asdf global php latest
}

install_dependencies
install_asdf_php
install_php_latest
