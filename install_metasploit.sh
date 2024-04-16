#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install postgresql postgresql-contrib -y
sudo systemctl enable --now postgresql
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod +x msfinstall
sudo ./msfinstall
