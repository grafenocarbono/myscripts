#!/bin/bash
docker run --name mariadbtest -e MYSQL_ROOT_PASSWORD=mypass -p 3306:3306 -d docker.io/library/mariadb:10.3
sudo apt install mysql-client-core-8.0
mysql -h 172.17.0.2 -u root -p
