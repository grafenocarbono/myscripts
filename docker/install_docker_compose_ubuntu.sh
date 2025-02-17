#!/bin/bash

set -e

echo "🚀 Installing Docker and Docker Compose on Ubuntu..."

# Verificar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then
    echo "❌ Please run as root or use sudo."
    exit 1
fi

# Actualizar paquetes
echo "📦 Updating package list..."
apt update -y
apt upgrade -y

# Instalar dependencias necesarias
echo "🔧 Installing required dependencies..."
apt install -y apt-transport-https ca-certificates curl software-properties-common jq

# Agregar la clave GPG de Docker
echo "🔑 Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio de Docker
echo "🛠️ Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar lista de paquetes después de agregar el repo de Docker
apt update -y

# Instalar Docker
echo "🐳 Installing Docker..."
apt install -y docker-ce docker-ce-cli containerd.io

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
