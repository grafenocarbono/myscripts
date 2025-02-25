#!/bin/bash

# Variables
ORACLE_VERSION="21.11"
ORACLE_BASE_URL="https://download.oracle.com/otn_software/linux/instantclient/${ORACLE_VERSION}"
PACKAGES=("instantclient-basic-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip" "instantclient-sqlplus-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip")

# Dependencias necesarias
echo "Installing required dependencies..."
sudo apt update
sudo apt install -y libaio1 unzip wget

# Crear directorio para Oracle
ORACLE_DIR="/opt/oracle"
mkdir -p $ORACLE_DIR
cd $ORACLE_DIR

# Descargar e instalar Oracle Instant Client
echo "Downloading Oracle Instant Client packages..."
for package in "${PACKAGES[@]}"; do
    wget --no-check-certificate "${ORACLE_BASE_URL}/${package}"
done

echo "Unzipping packages..."
unzip "instantclient-basic-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip"
unzip "instantclient-sqlplus-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip"

# Renombrar el directorio
mv instantclient_* instantclient

# Configurar variables de entorno
echo "Configuring environment variables..."
echo "export LD_LIBRARY_PATH=${ORACLE_DIR}/instantclient:\$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export PATH=${ORACLE_DIR}/instantclient:\$PATH" >> ~/.bashrc
echo "export SQLPATH=${ORACLE_DIR}/instantclient" >> ~/.bashrc
echo "export TNS_ADMIN=${ORACLE_DIR}/instantclient" >> ~/.bashrc
source ~/.bashrc

# Verificar instalación
echo "Verifying SQL*Plus installation..."
if command -v sqlplus &> /dev/null; then
    echo "SQL*Plus installed successfully!"
    sqlplus -v
else
    echo "SQL*Plus installation failed."
fi
