#!/bin/bash

#SOLUCIONAR BLOQUEO

sudo fuser -vki /var/lib/dpkg/lock-frontend
sudo rm -f /var/lib/dpkg/lock-frontend
sudo dpkg --configure -a
sudo apt autoremove

echo "Author: Gelo Coline, Yohanna"
