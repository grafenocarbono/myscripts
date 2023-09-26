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

	echo "Installing packages..."
	sudo apt-get install \
	    ca-certificates \
	    curl \
	    gnupg \
	    lsb-release
	echo "Download gpg file..."
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "Add repository..."
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	echo "update..."
	sudo apt-get update
	echo "Install docker-ce"
	sudo apt-get install docker-ce docker-ce-cli containerd.io
	echo "Create docker group"
	sudo groupadd docker
	echo "Insert user docker group"
	sudo usermod -aG docker $USER
	newgrp docker
	echo "Hello world..."
	docker run hello-world
fi;
