#!/bin/bash
docker run -it -p 8888:8888 -v $(pwd):/usr/share/notebooks gopherdata/gophernotes:latest-ds
