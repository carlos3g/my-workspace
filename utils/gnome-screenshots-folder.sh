#!/bin/bash
set -e

# this file will change the printscreens default folder to
# /home/$USER/Images/screenshots

mkdir ~/screenshots
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Images/screenshots"

# After this, you'll need to change some shortcuts.
# See https://askubuntu.com/questions/114429/how-can-i-specify-the-default-save-directory-for-gnome-screenshot
