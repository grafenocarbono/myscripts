#!/bin/bash

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

  sudo add-apt-repository main
  sudo add-apt-repository universe
  sudo add-apt-repository restricted
  sudo add-apt-repository multiverse 
  sudo apt update
fi
