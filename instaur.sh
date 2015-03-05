# !/bin/bash
#
aurpkg=/tmp/aurpkg_$$
ns=/tmp/ns_$$
ns2=/tmp/ns2_$$

dialog --title 'Message' --msgbox 'This script should be run as a normal user and you 
should have an internet connection. It will download the AUR package and install it, asking for 
your user password.'  0 0


dialog --inputbox "Enter your desired package: " 0 0 2>$ns
	cut -c1-2 $ns >$ns2
	wget https://aur.archlinux.org/packages/$(cat $ns2)/$(cat $ns)/$(cat $ns).tar.gz
	tar xvf $(cat $ns).tar.gz
	cd $(cat $ns)
	makepkg -si
	