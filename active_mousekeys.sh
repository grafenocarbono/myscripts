#!/bin/bash
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
WHITE="\e[0;37m" 	

BACK_INTE_BLACK="\e[0;100m"
BACK_INTE_RED="\e[0;101m" 	
BACK_INTE_GREEN="\e[0;102m" 
BACK_INTE_YELLOW="\e[0;103m"
BACK_INTE_BLUE="\e[0;104m" 	
BACK_INTE_WHITE="\e[0;107m"

RESET="\e[0m"

function agree(){

	clear
	printf "$BACK_INTE_RED $BOLD_WHITE I make no warranty of any kind for the use of this software. I am not responsible for any direct or collateral damage. $RESET \n"
	printf "$BOLD_BLACK put your alias here $RESET \n"
	printf "$BOLD_BLACK Do you agree?(y/n) $RESET"
	read -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
	    return 1
	else
	    return 0
	fi
}

function active_mousekeys(){

printf "Firstly, You have to active Accessibility > Mouse Keys (gnome-control-center)\n"
sudo apt-get install xkbset
sudo apt install gconf2

gconftool-2 --toggle /desktop/gnome/peripherals/mouse/touchpad_enabled
Accessibility > Mouse Keys (gnome-control-center)
sudo cat << FIN >> /etc/systemd/system/mousekeys.service
[Unit]
Description=Set speed Mouse Keys

[Service]
ExecStart=xkbset -ma 1 1 1000 9999 1000
Type=simple
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
FIN
sudo systemctl daemon-reload
sudo systemctl start mousekeys


}


agree
answer=$?

if [[ $answer -eq 1 ]]
then
	printf "\nyou have answered yes\n"
else
	printf "\nyou have answered no\n"
fi


