#!/bin/bash

docker run --name mysql_diurno -e MYSQL_ROOT_PASSWORD="123qweASD_" -d mysql

echo "Password:123qweASD_"

docker run mysql_diurno

docker inspect mysql_diurno | grep IP

echo "mysql -h IP_address -u root -p"


