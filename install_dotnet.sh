#!/bin/bash
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --version latest
./dotnet-install.sh --version latest --runtime aspnetcore
./dotnet-install.sh --channel 8.0
sudo snap install dotnet-sdk --classic
wget https://aka.ms/dotnet-core-applaunch?framework=Microsoft.NETCore.App&framework_version=5.0.0&arch=x64&rid=linux-x64&os=ubuntu.22.04
chmod +x dotnet-core-applaunch\?framework\=Microsoft.NETCore.App

