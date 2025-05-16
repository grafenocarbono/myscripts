#!/bin/bash
sudo apt update -y && sudo apt upgrade
sudo apt install git neofetch vim tmux -y
git clone https://github.com/grafenocarbono/myscripts
cd myscripts/docker/
bash ./install_docker.sh 
cd mysql
bash ./install_mysql_diurno.sh
bash ./install_mysql_nocturno.sh
cp start_mysql_docker.sh $HOME
cd ..
cd mongo
bash ./install_mongo_diurno.sh
bash ./install_mongo_nocturno.sh
cp ./conecta_mongo.sh $HOME
cd
wget https://dlcdn.apache.org/netbeans/netbeans-installers/25/apache-netbeans_25-1_all.deb
sudo dpkg -i apache-netbeans_25-1_all.deb
rm -rf apache-netbeans_25-1_all.deb
wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/91fa95bccb027ece6a968589bb1d662fa9c8e170/code_1.100.1-1746807090_amd64.deb
sudo dpkg -i code_1.100.1-1746807090_amd64.deb
rm -rf code_1.100.1-1746807090_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 
rm -rf google-chrome-stable_current_amd64.deb 
mkdir -p $HOME/bin
cp studio-3t-linux-x64.tar.gz $HOME/bin
cd 
cd bin
tar xvf studio-3t-linux-x64.tar.gz 
bash ./studio-3t-linux-x64.sh 

