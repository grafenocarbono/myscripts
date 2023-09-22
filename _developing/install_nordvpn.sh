#!/bin/bash
sudo apt update
sudo apt install curl -y
sudo usermod -aG nordvpn $USER
sudo sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
nordvpn login
