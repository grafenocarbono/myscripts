#!/bin/bash
reset=`tput sgr0` 
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
White='\033[0;37m'        # White
On_Black='\033[40m'       # Black
On_Yellow='\033[43m'      # Yellow
On_White='\033[47m'       # White

echo -e "${On_Black}${White}Welcome MARIADB SCRIPT installer <grafeno30>${reset}" 
sudo apt update && sudo apt upgrade
sudo apt -y install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64] http://mariadb.mirror.globo.tech/repo/10.5/ubuntu focal main'
sudo apt update
sudo apt install mariadb-server mariadb-client -y
sudo mysql_secure_installation 
#systemctl status mysql
echo -e "${On_Yellow}${Black}Happy hacking! (grafeno30)${reset}"
#mysql -u root -p
# Install our GPG key
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
# add our repo to your apt lists directory
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list
sudo apt update
sudo apt install beekeeper-studio -y
