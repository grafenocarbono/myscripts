#!/bin/bash

# Verificar si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root o con sudo."
    exit 1
fi

echo "Actualizando el sistema..."
dnf update -y

# Instalar paquetes requeridos
echo "Instalando dependencias necesarias..."
dnf install -y libaio unzip

# Definir versión de Oracle Instant Client
ORACLE_VERSION="21.9"
ORACLE_URL="https://download.oracle.com/otn_software/linux/instantclient"

# Crear directorio de instalación
INSTALL_DIR="/opt/oracle"
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

# Descargar Oracle Instant Client y SQL*Plus
echo "Descargando Oracle Instant Client y SQL*Plus..."
curl -O ${ORACLE_URL}/instantclient-basic-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip
curl -O ${ORACLE_URL}/instantclient-sqlplus-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip

# Descomprimir archivos
echo "Descomprimiendo archivos..."
unzip -o instantclient-basic-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip
unzip -o instantclient-sqlplus-linux.x64-${ORACLE_VERSION}.0.0.0dbru.zip

# Renombrar el directorio para facilitar su uso
mv instantclient_* instantclient

# Configurar variables de entorno
echo "Configurando variables de entorno..."
echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/instantclient" >> /etc/profile.d/oracle.sh
echo "export PATH=\$PATH:${INSTALL_DIR}/instantclient" >> /etc/profile.d/oracle.sh
echo "export SQLPATH=${INSTALL_DIR}/instantclient" >> /etc/profile.d/oracle.sh
chmod +x /etc/profile.d/oracle.sh
source /etc/profile.d/oracle.sh

# Verificar la instalación
echo "Verificando la instalación..."
sqlplus -v

if [ $? -eq 0 ]; then
    echo "SQL*Plus instalado correctamente."
else
    echo "Hubo un error en la instalación de SQL*Plus."
fi

echo "Para inicializar personaliza el siguiente comando sqlplus sys@localhost:1521/FREE as sysdba"
