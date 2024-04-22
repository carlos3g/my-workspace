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

# See: https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0?permalink_comment_id=4005789#gistcomment-4005789

set -e

function get_repo_last_release_version() {
  # See: https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8?permalink_comment_id=4843419#gistcomment-4843419
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
