# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------

function InstallBraveBrowser {
  winget install --id=Brave.Brave  -e
}

function InstallTelegram {
  winget install --id=Telegram.TelegramDesktop  -e
}

function InstallVSCodeInsiders {
  winget install --id=Microsoft.VisualStudioCode.Insiders  -e
}

function InstallTerminal {
  winget install --id=Microsoft.WindowsTerminal  -e
}

function InstallPowerToysPreview {
  winget install --id=Microsoft.PowerToys  -e
}

function InstallDiscord {
  winget install --id=Discord.Discord  -e
}

function InstallNotion {
  winget install --id=Notion.Notion  -e
}

function InstallSteam {
  winget install --id=Valve.Steam  -e
}

function InstallBitWarden {
  winget install --id=Bitwarden.Bitwarden  -e
}

function InstallSpotify {
  winget install --id=Spotify.Spotify  -e
}

function InstallDbeaver {
  winget install --id=dbeaver.dbeaver  -e
}

function InstallDockerDesktop {
  winget install --id=Docker.DockerDesktop  -e
}

function InstallPostman {
  winget install --id=Postman.Postman  -e
}

function InstallAutoDarkMode {
  winget install --id=Armin2208.WindowsAutoNightMode  -e
}

function ActivateHyperV {
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

function ActivateWindowsSandBox {
  Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online
}

InstallBraveBrowser
InstallTelegram
InstallVSCodeInsiders
InstallTerminal
InstallPowerToysPreview
InstallDiscord
InstallNotion
InstallSteam
InstallBitWarden
InstallSpotify
InstallDbeaver
InstallDockerDesktop
InstallPostman
InstallAutoDarkMode
ActivateHyperV
ActivateWindowsSandBox
