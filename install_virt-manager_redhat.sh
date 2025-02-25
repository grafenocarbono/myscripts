#!/bin/bash

# Verifica si el usuario es root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root o con sudo." 
   exit 1
fi

echo "Actualizando paquetes y repositorios..."
sudo dnf update -y

echo "Instalando paquetes necesarios para la virtualización..."
sudo dnf install -y \
    qemu \
    qemu-system \
    qemu-kvm \
    libvirt \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager

echo "Habilitando y arrancando el servicio de libvirt..."
sudo systemctl enable --now libvirtd

echo "Agregando el usuario actual al grupo de libvirt y kvm..."
sudo usermod -aG libvirt $(whoami)
sudo usermod -aG kvm $(whoami)

echo "Verificando instalación de KVM..."
if lsmod | grep -i kvm; then
    echo "✅ KVM está habilitado correctamente."
else
    echo "⚠️ KVM no se detectó. Revisa si tu CPU soporta virtualización y si está activada en la BIOS."
fi

echo "Configurando Network Bridge..."
sudo systemctl restart libvirtd
sudo virsh net-autostart default
sudo virsh net-start default

echo "✅ Instalación completa. Reinicia el sistema para aplicar los cambios correctamente."
