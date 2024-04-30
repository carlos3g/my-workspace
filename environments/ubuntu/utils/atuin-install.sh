#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------

set -e

# See: https://github.com/atuinsh/atuin

install_atuin() {
  bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
}

setup_atuin() {
  atuin login -u $1
  atuin import auto
  atuin sync
}

install_atuin
setup_atuin
