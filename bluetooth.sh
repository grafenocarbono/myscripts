#!/bin/bash
sudo apt install blueman

sudo add-apt-repository ppa:blaze/rtbth-dkms
sudo apt-get update
sudo apt-get install rtbth-dkms

read -p "In the following file... Comment all and add this line: rtbth" 
sudo vim /etc/modules


sudo rmmod btusb
sleep 1
sudo modprobe btusb


sudo blueman-manager
update /etc/default/grub with this value

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pci=nommconf pcie_aspm=off"

update grub

sudo update-grub

then reboot and enjoy your music.




