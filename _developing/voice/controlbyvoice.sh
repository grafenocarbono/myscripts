#!/bin/bash
sudo apt-get install bash python python-gi python-simplejson libsox-fmt-mp3 sox libnotify-dev acpi xdotool
sudo add-apt-repository ppa:benoitfra/google2ubuntu
sudo apt-get update
sudo apt-get install google2ubuntu
/usr/share/google2ubuntu/google2ubuntu.py
/usr/share/google2ubuntu/google2ubuntu-manager.py
printf "##First launch ###Main programs Once you have installed google2ubuntu, you can attribute a shortcut to those 2 Python scripts:\n/usr/share/google2ubuntu/google2ubuntu.py\n/usr/share/google2ubuntu/google2ubuntu-manager.py"

printf "https://github.com/benoitfragit/google2ubuntu\n"


