#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install qemu-system
sudo apt install qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo systemctl enable --now libvirtd
#sudo systemctl status libvirtd
sudo usermod -aG libvirt $(whoami)
virt-manager
