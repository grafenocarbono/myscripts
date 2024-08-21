#!/bin/bash
CK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m" 
CYAN="\e[0;36m" 	
WHITE="\e[0;37m" 	

BACK_BLACK="\e[40m"
BACK_RED="\e[41m"
BACK_GREEN="\e[42m"
BACK_YELLOW="\e[43m"
BACK_BLUE="\e[44m"
BACK_PURPLE="\e[45m"
BACK_CYAN="\e[46m" 
BACK_WHITE="\e[47m"


BOLD_BLACK="\e[1;90m"
BOLD_RED="\e[1;91m"
BOLD_GREEN="\e[1;92m"
BOLD_YELLOW="\e[1;93m"
BOLD_BLUE="\e[1;94m"
BOLD_PURPLE="\e[1;95m"
BOLD_CYAN="\e[1;96m"
BOLD_WHITE="\e[1;97m"


BACK_INTE_BLACK="\e[0;100m"
BACK_INTE_RED="\e[0;101m" 	
BACK_INTE_GREEN="\e[0;102m" 
BACK_INTE_YELLOW="\e[0;103m"
BACK_INTE_BLUE="\e[0;104m" 	
BACK_INTE_PURPLE="\e[0;105m"
BACK_INTE_CYAN="\e[0;106m" 	
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

function install(){

clear
sudo apt-get purge nodejs --auto-remove
sudo apt-get purge npm --auto-remove
sudo apt autoremove
sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/bin/node*
sudo rm -rf /usr/local/include/node*
sudo apt update -y && sudo apt upgrade -y
sudo apt --fix-broken install
sudo apt install npm -y
cd Downloads
cd Descargas
wget https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.xz
mkdir $HOME/bin
mv node-v20.11.1-linux-x64.tar.xz $HOME/bin/node.tar.xz
cd $HOME/bin
tar xvf node.tar.xz
echo "export PATH=$PATH:~/bin/node-v20.11.1-linux-x64/bin/" >> ~/.bashrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc

npm install -g nodemon
source ~/.bashrc
sudo npm install -g @angular/cli
sudo mv /usr/bin/node /usr/bin/node_old
sudo cp ~/bin/node-v20.11.1-linux-x64/bin/* /usr/bin/
cd Downloads
cd Descargas
ng new prueba
cd prueba
code .

}


agree
answer=$?

if [[ $answer -eq 1 ]]
then
	install	
	
fi








