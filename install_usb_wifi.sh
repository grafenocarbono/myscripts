#!/bin/bash
sudo apt-get install build-essential git dkms linux-headers-$(uname -r)
git clone https://github.com/corneal64/Realtek-USB-Wireless-Adapter-Drivers.git
cd Realtek-USB-Wireless-Adapter-Drivers
sudo dkms add ./rtl8188fu
sudo dkms build rtl8188fu/1.0
sudo dkms install rtl8188fu/1.0
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/

echo -n "Do you want to disable power management (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
	sudo mkdir -p /etc/modprobe.d/
	sudo touch /etc/modprobe.d/rtl8188fu.conf
	echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf
fi

