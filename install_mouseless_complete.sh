#!/bin/bash
git clone https://github.com/jbensmann/mouseless
cd mouseless
go build -ldflags="-s -w" .
sudo cp mouseless /usr/local/bin/
sudo chmod +x /usr/local/bin/mouseless
mkdir -p ~/.config/mouseless/
cp example_configs/config_example1.yaml ~/.config/mouseless/
cd ..
rm -rf mouseless
sudo tee /etc/udev/rules.d/99-$USER.rules <<EOF
KERNEL=="uinput", GROUP="$USER", MODE:="0660"
KERNEL=="event*", GROUP="$USER", NAME="input/%k", MODE="660"
EOF
echo "uinput" | sudo tee /etc/modules-load.d/uinput.conf

printf "Para ejecutar el comando puedes hacerlo de la siguiente manera:mouseless --config ~/.config/mouseless/config.yaml"
sudo mouseless --config ~/.config/mouseless/config.yaml
