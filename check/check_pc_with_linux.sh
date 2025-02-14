#!/bin/bash
mkdir chequeo
cd chequeo
sudo journalctl --since "2 days ago" > logs_reboot.txt
sudo dmesg > logs_dmesg.txt
sudo apt install s-tui stress      # Ubuntu
sudo apt install nvme-cli         # Ubuntu
sudo nvme smart-log /dev/nvme0
printf "Ejecuta el siguiente comando sudo s-tui"
printf "Ejecuta el comando nvme-cku" 
