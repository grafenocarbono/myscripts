#!/bin/bash

set -e

echo "🚀 Installing Docker and Docker Compose on RHEL..."

# Verificar si se ejecuta con permisos de root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Please run as root or use sudo."
    exit 1
fi

# Instalar paquetes necesarios
echo "📦 Installing required packages..."
yum install -y yum-utils curl jq device-mapper-persistent-data lvm2

# Agregar repositorio de Docker
echo "🛠️ Adding Docker repository..."
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Instalar Docker
echo "🐳 Installing Docker..."
yum install -y docker-ce docker-ce-cli containerd.io

# Habilitar y arrancar Docker
echo "🔧 Enabling and starting Docker service..."
systemctl enable --now docker

# Verificar la instalación de Docker
echo "✅ Checking Docker version..."
docker --version

# Descargar la última versión de Docker Compose
echo "📥 Downloading Docker Compose..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
COMPOSE_URL="https://github.com/docker/compose/releases/download/${LATEST_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
curl -L "$COMPOSE_URL" -o /usr/local/bin/docker-compose

# Dar permisos de ejecución a Docker Compose
chmod +x /usr/local/bin/docker-compose

# Verificar la instalación de Docker Compose
echo "✅ Checking Docker Compose version..."
docker-compose --version

echo "🎉 Docker and Docker Compose installed successfully!"
