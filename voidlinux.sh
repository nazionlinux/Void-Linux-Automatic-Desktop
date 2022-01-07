#!/bin/bash
## Void Linux Automatic Desktop
## Author: Nazion Linux
## Site: https://www.nazionlinux.com/
## Source: https://github.com/nazionlinux/Void-Linux-Automatic-Desktop
## License: GNU General Public License v3.0

bypass() {
	sudo -v
	while true;
	do
		sudo -n true
		sleep 45
		kill -0 "$$" || exit
	done 2>/dev/null &
}

echo "Avvio script configurazione Void Linux..."
sleep 3s
	bypass

clear

echo "Aggiornamento XBPS..."
sleep 3s
	sudo xbps-install -u xbps

clear

echo "Aggiornamento VOID LINUX..."
sleep 3s
	sudo xbps-install -Syu

clear

echo "Configurazione VOID LINUX..."
sleep 10s
	sudo chsh -s /usr/bin/bash
	sudo loadkeys it

clear

echo "Installazione XORG & NETWORK MANAGER..."
sleep 3s
	sudo xbps-install -Sy nano xorg-minimal xterm xcalc fonts-roboto-ttf ipafont-fonts-otf xf86-input-synaptics NetworkManager network-manager-applet dnsmasq
	sudo sed '/*.nanorc/s/^#//' -i /etc/nanorc
	cp /etc/nanorc ~/.nanorc
	sed '/*.nanorc/s/^#//' -i ~/.nanorc
	sudo echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolvdnsmasq.conf

clear

echo "Installazione PIPEWIRE & ALSA..."
sleep 3s
	sudo xbps-install -Sy pipewire alsa-pipewire alsa-utils rtkit

clear

echo "Installazione LIGHTDM & XFCE..."
sleep 3s
	sudo xbps-install -Sy lightdm lightdm-gtk3-greeter elogind sakura xfce4-panel xfce4-settings xfce4-session xfwm4 xfdesktop xfce4-alsa-plugin breeze-icons

clear

echo "Installazione programmi navigare..."
sleep 3s
	sudo xbps-install -Sy firefox firefox-i18n-it

clear

echo "Installazione programmi grafica..."
sleep 3s
	sudo xbps-install -Sy gimp feh gcolor2 lximage-qt

clear

echo "Installazione programmi utilità..."
sleep 3s
	sudo xbps-install -Sy atom aria2 wget file-roller p7zip ldm whois testdisk filezilla leafpad gparted

clear

echo "Installazione programmi non free (UNRAR)..."
sleep 3s
	sudo xbps-install -Sy void-repo-nonfree
	sudo xbps-install -Syuv
	sudo xbps-install -Sy unrar

clear

echo "Configurazione servizi..."
sleep 10s
	sudo ln -s /etc/sv/dbus /var/service/
	sudo ln -s /etc/sv/elogind /var/service/
	sudo ln -s /etc/sv/NetworkManager /var/service/
	sudo ln -s /etc/sv/pipewire /var/service/
	sudo ln -s /etc/sv/lightdm /var/service/

clear

read -p "Fine! Premi INVIO e riavvia!"
	sudo shutdown -r now
