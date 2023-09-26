#!/bin/bash
sudo apt update
sudo apt install default-jre -y
sudo apt install default-jdk -y
java -version
sudo update-alternatives --config java
ls -la /usr/lib/jvm
echo "You could set JAVA_HOME to the folder of Java which you want to use"


