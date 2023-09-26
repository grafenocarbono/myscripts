#!/bin/bash
sudo apt update
sudo apt -y upgrade
python3 -V
sudo apt install -y python3-pip
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
sudo apt install -y python3-venv
mkdir $HOME/environments
cd $HOME/environments
python3 -m venv my_env
ls my_env
source my_env/bin/activate
echo "print('Hello, World!')" > hello.py
python hello.py
echo "To leave the environment, type the command deactivate and you will return to your original directory."
wget https://download.jetbrains.com/python/pycharm-community-2021.3.2.tar.gz && \
tar xvf pycharm-community-2021.3.2.tar.gz
mv pycharm-community-2021.3.2 $HOME
sudo ln -s $HOME/pycharm-community-2021.3.2/bin/pycharm.sh /usr/local/bin/pycharm
echo "to install a package: pip3 install package_name" > instructions.txt
echo "source my_env/bin/activate to activate environment" >> instructions.txt
echo "To leave the environment, type the command deactivate and you will return to your original directory." >> instructions.txt
pycharm






