#!/bin/bash
wget git.io/trans
sudo chmod +x ./trans
sudo mv ./trans /usr/local/bin
sudo apt install gawk -y
echo "Ejemplos de uso:\n" > traducir_instrucciones.txt
echo "Modo interactivo: trans -shell -brief" >> traducir_instrucciones.txt
echo "Traducir a español: trans :es 'Hello Everyone'" >> traducir_instrucciones.txt
echo "Traducir a inglés: trans 'Hola amiguitos'" >> traducir_instrucciones.txt
echo "trans -brief 'Cómo estáis?'" >> traducir_instrucciones.txt
