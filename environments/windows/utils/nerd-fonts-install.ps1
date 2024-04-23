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

$ErrorActionPreference = "Stop"

function Get-RepoLastReleaseVersion {
  $response = Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest" -DisableKeepAlive
  return $response.BaseResponse.RequestMessage.RequestUri.AbsoluteUri.Split('/')[-1]
}

$fonts = @(
  "FiraCode",
  "JetBrainsMono",
  "Meslo"
)

$version = Get-RepoLastReleaseVersion
$fontsDir = "$env:USERPROFILE\.fonts"
$systemFontsDir = "$env:SystemRoot\Fonts"

if (-not (Test-Path $fontsDir -PathType Container)) {
  New-Item -ItemType Directory -Path $fontsDir | Out-Null
}

foreach ($font in $fonts) {
  $zipFile = "$font.zip"
  $downloadUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/$version/$zipFile"

  Write-Host "Downloading $downloadUrl"

  Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile
  Expand-Archive -Path $zipFile -DestinationPath $fontsDir -Force
  Remove-Item $zipFile
}

$fontFiles = Get-ChildItem -Path $fontsDir -Filter "$font*.ttf" -Recurse
foreach ($file in $fontFiles) {
  # See: https://www.jordanmalcolm.com/deploying-windows-10-fonts-at-scale/
  Copy-Item -Path $file.FullName -Destination $systemFontsDir -Force
  New-ItemProperty -Name $file.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $file.name
}

Remove-Item -Path $fontsDir -Recurse -Force

Write-Host "Fonts installed successfully."
