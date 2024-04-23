# ------------------------------------------------------------------------------
# author: Carlos Mesquita
# website: https://carlos3g.github.io
# ------------------------------------------------------------------------------

function InstallPowerShell7 {
  msiexec.exe /package PowerShell-7.4.2-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
}

function CreatePowerShell7Profile {
  $PowerShell7Profile = "C:\Program Files\PowerShell\7\profile.ps1"

  if (!(Test-Path -Path $PowerShell7Profile)) {
    New-Item -ItemType File -Path $PowerShell7Profile -Force
  }
}

InstallPowerShell7
CreatePowerShell7Profile
