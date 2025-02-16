#!/bin/bash

# Configuración
CONTAINER_NAME="oracle_free"
IMAGE_NAME="container-registry.oracle.com/database/free"
ORACLE_PASSWORD="1234qweASD_"

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado. Instálalo y vuelve a intentarlo."
    exit 1
fi

# Verificar si la imagen ya está descargada
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    echo "🔄 Iniciando sesión en Oracle Container Registry..."
    docker login container-registry.oracle.com

    echo "📥 Descargando la imagen de Oracle Database Free..."
    docker pull $IMAGE_NAME

    if [ $? -ne 0 ]; then
        echo "❌ Error al descargar la imagen de Oracle Database Free."
        exit 1
    fi
else
    echo "✅ Imagen de Oracle Database Free ya descargada."
fi

# Verificar si el contenedor ya existe
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "⚠️ El contenedor '$CONTAINER_NAME' ya existe. Eliminándolo..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Crear y ejecutar el contenedor
echo "🚀 Creando el contenedor con Oracle Database Free..."
docker run -d --name $CONTAINER_NAME \
    -p 1521:1521 -p 5500:5500 \
    -e ORACLE_PWD=$ORACLE_PASSWORD \
    $IMAGE_NAME

# Esperar a que el contenedor esté listo
echo "⌛ Esperando a que la base de datos se inicie..."
sleep 30  # Ajusta el tiempo si es necesario

# Mostrar detalles de conexión
echo "✅ Contenedor '$CONTAINER_NAME' creado exitosamente."
echo "🔗 Conéctate con los siguientes datos:"
echo "--------------------------------------"
echo " Host: localhost"
echo " Puerto: 1521"
echo " Servicio: FREEPDB1"
echo " Usuario: system"
echo " Contraseña: $ORACLE_PASSWORD"
echo "--------------------------------------"
echo "📌 Para acceder al contenedor:"
echo "  docker exec -it $CONTAINER_NAME sqlplus system/$ORACLE_PASSWORD@localhost:1521/FREEPDB1"
