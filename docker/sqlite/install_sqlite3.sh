#!/bin/bash

# Nombre del contenedor e imagen\NCONTAINER_NAME="sqlite_container"
IMAGE_NAME="sqlite_image"
CONTAINER_NAME="sqlite3"

# Crea el directorio para los datos
mkdir -p data

# Crea el Dockerfile
echo "FROM alpine:latest
RUN apk add --no-cache sqlite
WORKDIR /data
CMD [\"sqlite3\", \"/data/database.db\"]" > Dockerfile

# Crea el archivo docker-compose.yml
echo "version: '3.8'

services:
  sqlite:
    build: .
    container_name: ${CONTAINER_NAME}
    volumes:
      - ./data:/data
    stdin_open: true
    tty: true" > docker-compose.yml

# Construir la imagen
echo "Construyendo la imagen de Docker..."
docker-compose build

# Iniciar el contenedor
echo "Iniciando el contenedor..."
docker-compose up -d

# Acceder a la base de datos
echo "Accediendo a SQLite dentro del contenedor..."
docker exec -it ${CONTAINER_NAME} sqlite3 /data/database.db
