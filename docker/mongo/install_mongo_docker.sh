#!/bin/bash
docker run \
-d -t \
--name mongo_contenedor \
-p 6666:27017 \
-e MONGO_INITDB_ROOT_USERNAME=root \
-e MONGO_INITDB_ROOT_PASSWORD=123qweASD_ \
mongo

