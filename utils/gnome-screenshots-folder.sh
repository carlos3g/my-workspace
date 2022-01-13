## This changes the screenshots folder to ~/Images/screenshots. Only works in gnome.
set -e

mkdir ~/screenshots
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Images/screenshots"

# Now, You need to change some shortcuts. See https://askubuntu.com/a/961149
