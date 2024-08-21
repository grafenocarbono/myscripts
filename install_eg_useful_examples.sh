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
  echo -e "Creating the 'bin' folder in case they don´t exist...\n"
  if [ ! -d $HOME/bin ]
  then
	    mkdir $HOME/bin
  fi
  
  echo -e "Cloning repository...\n"
  if [ ! -d $HOME/bin/eg ]
  then
	  cd $HOME/bin
	  git clone https://github.com/srsudar/eg.git
  fi

  eg="/usr/local/bin/eg"
  echo -e "Creating link to eg_exec.py...."
  if [ ! -L "${eg}" ]; then
   sudo ln -s $HOME/bin/eg/eg_exec.py /usr/local/bin/eg
  fi

  echo -e "If there is already a link, we will unlink it...\n"
  sudo unlink /usr/bin/python > /dev/null

  echo -e "Creating symbolink link to the third version of python..\n"  
  sudo ln -fs /usr/bin/python3 /usr/bin/python

  cd $HOME

fi   



