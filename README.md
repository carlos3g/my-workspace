> [!WARNING]
> These scripts are made for my use. Read the files and change what you need if you want to use too

## Usage

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/carlos3g/my-workspace/main/environments/ubuntu/workspace.sh)"
```

```ps1
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/carlos3g/my-workspace/main/environments/windows/workspace.ps1'))
```

### Useful links

- Linux

  - [specify the default save directory for gnome-screenshot](https://askubuntu.com/a/961149)
  - [Question: How to install Flipper in Ubuntu?](https://github.com/facebook/flipper/issues/1058)
  - [Configure VM acceleration on Linux](https://developer.android.com/studio/run/emulator-acceleration#vm-linux)
  - [System audio problems while Android emulator is running](https://askubuntu.com/questions/1045052/system-audio-problems-while-android-emulator-is-running)
  - [Rewritten in Rust: Modern Alternatives of Command-Line Tools](https://zaiste.net/posts/shell-commands-rust/)

- Windows

  - [Gist Comment about expo in wsl](https://gist.github.com/bergmannjg/461958db03c6ae41a66d264ae6504ade?permalink_comment_id=4152627#gistcomment-4152627)
  - [Location services turned off ("some of these settings are managed by your organization")](https://github.com/LeDragoX/Win-Debloat-Tools/issues/133)
  - [Windows stopped sharing clipboard history across devices](https://github.com/LeDragoX/Win-Debloat-Tools/issues/67)
  - [about_Profiles - PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4)

- Android

  - [Xiaomi Bloatware List | Remove Bloatware on MIUI 14/13](https://technastic.com/xiaomi-bloatware-list-miui/#Android_Bloatware_on_Xiaomi_Phones)

### Run react native in WSL2

> See: https://gist.github.com/bergmannjg/461958db03c6ae41a66d264ae6504ade

```sh
wsl-adb-server
wsl-port-forward 5037
wsl-port-forward 8081
wsl-relays
```
