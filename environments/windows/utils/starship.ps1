# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------

function InstallStarship {
  winget install --id Starship.Starship
}

function CreateStarshipConfigFile {
  mkdir -p $HOME\.config
  New-Item -ItemType File -Path $HOME\.config\starship.toml
}

InstallStarship
CreateStarshipConfigFile
