#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install gnome-tweaks -y

if ! command -v flatpak &>/dev/null; then
    sudo apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

flatpak install flathub com.visualstudio.code -y

flatpak install flathub com.jetbrains.PyCharm-Community -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install gnome-software-plugin-flatpak -y

mkdir -p ~/TEMP

gsettings set org.gnome.desktop.interface gtk-theme "ZorinDark"

wget -O ~/Downloads/wps-office.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb

sudo dpkg -i ~/Downloads/wps-office.deb
sudo apt install -f -y

wget -O ~/Downloads/UOS-icons.tar.xz https://dl.opendesktop.org/api/files/download/id/1583525228/s/153aa4a2340c6078913ac25d51d6765a/t/1614243817/u//UOS-icons.tar.xz
tar -xf ~/Downloads/UOS-icons.tar.xz -C ~/.icons

flatpak install flathub org.gimp.GIMP -y

wget -O ~/Downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome.deb
sudo apt install -f -y

rm -rf ~/Downloads/.deb ~/Downloads/.tar.xz

sudo apt autoremove -y
sudo apt clean

echo "Instalação concluída!"
