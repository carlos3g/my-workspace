# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------

function InstallPowerShell7 {
  winget install --id Microsoft.Powershell --source winget
}

function CreatePowerShell7Profile {
  $PowerShell7Profile = "C:\Program Files\PowerShell\7\profile.ps1"

  if (!(Test-Path -Path $PowerShell7Profile)) {
    New-Item -ItemType File -Path $PowerShell7Profile -Force
  }
}

InstallPowerShell7
CreatePowerShell7Profile
