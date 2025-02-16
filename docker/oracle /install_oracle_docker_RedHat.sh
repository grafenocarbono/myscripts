#!/bin/bash

# Verificar si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root o con sudo."
    exit 1
fi

echo "Actualizando el sistema..."
dnf update -y

# Instalar paquetes requeridos
echo "Instalando paquetes necesarios..."
dnf install -y yum-utils device-mapper-persistent-data lvm2

# Agregar el repositorio oficial de Docker
echo "Agregando el repositorio oficial de Docker..."
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Instalar Docker
echo "Instalando Docker..."
dnf install -y docker-ce docker-ce-cli containerd.io

# Habilitar e iniciar Docker
echo "Habilitando e iniciando el servicio Docker..."
systemctl enable --now docker

# Verificar el estado de Docker
systemctl status docker --no-pager

# Agregar el usuario actual al grupo docker (opcional, requiere cerrar sesión para aplicar cambios)
echo "¿Deseas agregar tu usuario al grupo Docker? (s/n)"
read -r ADD_USER
if [ "$ADD_USER" = "s" ]; then
    USERNAME=$(whoami)
    usermod -aG docker "$USERNAME"
    echo "Usuario $USERNAME agregado al grupo docker. Cierra sesión y vuelve a entrar para aplicar los cambios."
fi

# Verificar instalación
echo "Verificando instalación de Docker..."
docker --version

# Mensaje final
echo "Instalación de Docker completada."
