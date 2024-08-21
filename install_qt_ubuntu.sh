#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' #No color
clear
echo -e "${RED}I make no warranty of any kind for the use of this software.\nI am not responsible for any direct or collateral damage."
echo -e "@grafeno30"
echo -e "${NC}Do you agree?(y/n)"
read -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then

	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get -y install build-essential openssl libssl-dev libssl1.0 libgl1-mesa-dev libqt5x11extras5
	cd $HOME/Downloads/
	wget https://web.stanford.edu/dept/cs_edu/resources/qt/CS106.zip
	unzip -x CS106.zip
	wget https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.6.0-online.run
	chmod +x ./qt-unified*
	./qt-unified-linux*
fi
