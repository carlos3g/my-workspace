#!/bin/bash
# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------
# This script will:
# - Install the bellow Nerd fonts from ryanoasis/nerd-fonts
# - Fonts
#   - FiraCode
#   - JetBrainsMono
#   - Meslo

set -e

function get_repo_last_release_version() {
  basename $(curl -Ls -o /dev/null -w %{url_effective} https://github.com/ryanoasis/nerd-fonts/releases/latest)
}

declare -a fonts=(
  FiraCode
  JetBrainsMono
  Meslo
)

version=$(get_repo_last_release_version)
fonts_dir="${HOME}/.fonts"

if [[ ! -d "$fonts_dir" ]]; then
  mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
  zip_file="${font}.zip"
  download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/${zip_file}"

  echo "Downloading $download_url"

  wget -nv "$download_url"
  unzip -oq "$zip_file" -d "$fonts_dir"
  rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv
