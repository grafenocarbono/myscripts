#!/bin/bash
export IP_MYSQL=`sudo docker inspect mysql --format '{{ .NetworkSettings.IPAddress }}'`
echo $IP_MYSQL > mi_ip.txt
docker start mysql
mysql -h $IP_MYSQL -u root -p
