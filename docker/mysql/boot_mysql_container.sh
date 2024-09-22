#!/bin/bash
docker start mysql
export IP_MYSQL=`sudo docker inspect mysql --format '{{ .NetworkSettings.IPAddress }}'`
echo $IP_MYSQL > ip_actual_mysql.txt
mysql -h $IP_MYSQL -u root -p
