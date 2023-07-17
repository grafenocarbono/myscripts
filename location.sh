#!/bin/bash

source ./utilities.sh

agree
answer=$?

if [[ $answer -eq 1 ]];then
	printf "Thanks to https://github.com/ipinfo/cli\n"
	
	#check if ipinfo is already installed
	ipinfo
	if [ $? -eq 0 ]; then
		printf "ipinfo is already installed\n"
	else
		printf "ipinfo isn´t installed\n"
		sudo add-apt-repository ppa:ipinfo/ppa
		sudo apt update
		sudo apt install ipinfo -y
	fi
	
	printf "$BACK_INTE_BLUE $BOLD_WHITE Getting information the internet\n $RESET"
	curl ifconfig.me > /dev/null
	server_ip=$0
	ipinfo myip -p $server_ip
	ip a | grep 192.168 | grep -aob '|'
	private_ip=$0
	printf "Private ip%s\n" $private_ip
fi
