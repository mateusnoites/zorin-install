#!/bin/bash

sudo dnf update -y

sudo dnf install gnome-tweaks -y

if ! command -v flatpak &>/dev/null; then
    sudo dnf install flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

flatpak install flathub com.visualstudio.code -y
flatpak install flathub com.jetbrains.PyCharm-Community -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo dnf install gnome-software-plugin-flatpak -y

mkdir -p ~/TEMP

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

wget -O ~/Downloads/wps-office.rpm https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office-11.1.0.10702-1.x86_64.rpm
sudo dnf install ~/Downloads/wps-office.rpm -y

flatpak install flathub org.gimp.GIMP -y

wget -O ~/Downloads/google-chrome.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install ~/Downloads/google-chrome.rpm -y

sudo dnf install chrome-gnome-shell -y

mkdir -p ~/.local/share/fonts
wget -O ~/Downloads/Inter.zip https://fonts.google.com/download?family=Inter
unzip ~/Downloads/Inter.zip -d ~/.local/share/fonts
fc-cache -f -v

gsettings set org.gnome.desktop.interface font-name "Inter 11"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Inter Bold 11"

rm -f ~/Downloads/*.rpm ~/Downloads/*.tar.xz ~/Downloads/*.zip

sudo dnf autoremove -y
sudo dnf clean all

echo "Instalação concluída!"
