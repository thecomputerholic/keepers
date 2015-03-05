# !/bin/bash
#
pacman -Syy

tempfile=/tmp/dialog_$$
fm=/tmp/fm_$$
ib=/tmp/ib_$$
off=/tmp/off_$$
misc=/tmp/misc_$$
yao=/tmp/yao_$$
ttt=/tmp/ttt_$$
aurpkg=/tmp/aurpkg_$$
trap "rm -f $tempfile $fm $ib $off $misc $yao" 0 1 2 5 15
clear

dialog --title 'Message' --msgbox 'This script should be run as root and you should have an internet connection.'  0 0

until [ "$choice" = "6" ]; do          
dialog --title "Post-install Options" --menu "" 11 0 0 \
	1 "File Manager" \
	2 "Internet Browser" \
	3 "Office" \
	4 "Misc" \
	5 "Yaourt" \
	6 "Quit" 2> $tempfile
retv=$?

choice=$(cat $tempfile)
clear
	case $choice in
		1)dialog  --title " File Manager " --menu "" 0 0 0 \
			1 "PCManFM" \
			2 "SpaceFM" \
			3 "MidnightCommander" \
			4 "Thunar" 2>$fm

 	
			case $(cat $fm) in
				1) pacman -S --noconfirm pcmanfm
					dialog --infobox "PCManFM has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				2) pacman -S --noconfirm spacefm
					dialog --infobox "SpaceFM has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				3) pacman -S --noconfirm mc
					dialog --infobox "MidnightCommander has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				4) pacman -S --noconfirm thunar
					dialog --infobox "Thunar has been installed" 0 0
					read -p "[Enter] to continue"
					;;
			esac
					;;
		2)dialog --title " Internet Browser " --menu "" 0 0 0 \
			1 "Chromium" \
			2 "FireFox" \
			3 "Midori" \
			4 "Netsurf" \
			5 "Opera" \
			6 "ELinks" 2>$ib
	
			case $(cat $ib) in
				1) pacman -S --noconfirm chromium
					dialog --infobox "Chromium has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				2) pacman -S --noconfirm firefox
					dialog --infobox "Firefox has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				3) pacman -S --noconfirm midori
					dialog --infobox "Midori has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				4) pacman -S --noconfirm netsurf
					dialog --infobox "Netsurf has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				5) pacman -S --noconfirm opera
					dialog --infobox "Opera has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				6) pacman -S --noconfirm elinks
					dialog --infobox "ELinks has been installed." 0 0
					read -p "[Enter] to continue"
					;;
			esac
					;;
		3) dialog --title " Office " --menu "" 0 0 0 \
			1 "Abiword" \
			2 "Gnumeric" \
			3 "LibreOffice" 2>$off
	
			case $(cat $off) in
				1) pacman -S --noconfirm abiword
					dialog --infobox "Abiword has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				2) pacman -S --noconfirm gnumeric
					dialog --infobox "Gnumeric has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				3) pacman -S --noconfirm libreoffice-fresh
					dialog --infobox "LibreOffice has been installed." 0 0
					read -p "[Enter] to continue"
					;;
			esac
					;;
		4) dialog --title " Miscellaneous " --menu "" 0 0 0 \
			1 "FileRoller" \
			2 "Freerdp" \
			3 "Remmina" \
			4 "Aisleriot" \
			5 "xscreensaver" \
			6 "electricsheep" 2>$misc
	
			case $(cat $misc) in
				1) pacman -S --noconfirm file-roller
					dialog --infobox "File-Roller has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				2) pacman -S --noconfirm freerdp
					dialog --infobox "Freerdp has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				3) pacman -S --noconfirm remmina
					dialog --infobox "Remmina has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				4) pacman -S --noconfirm aisleriot
					dialog --infobox "Aisleriot has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				5) pacman -S --noconfirm xscreensaver
					dialog --infobox "XScreensaver has been installed." 0 0
					read -p "[Enter] to continue"
					;;
				5) pacman -S --noconfirm electricsheep
					dialog --infobox "electricsheep has been installed." 0 0
					read -p "[Enter] to continue"
					;;
			esac
					;;
		5) dialog --title " Yaourt " --menu "" 0 0 0 \
			
			dialog --title 'Message' --msgbox 'This script will modify your pacman.conf and install yaourt.  For other AUR packages it is recommended that you run the instaur.sh script.'  0 0
	
					echo "[archlinuxfr]" >> /etc/pacman.conf
					echo " SigLevel = Never" >> /etc/pacman.conf
					echo ' Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
					pacman -Sy --noconfirm yaourt
					dialog --infobox "Yaourt has been installed." 0 0
					read -p "[Enter] to continue"
					;;		
		6) exit;;

	esac  
done