#!/bin/bash
wget git.io/trans
sudo chmod +x ./trans
sudo mv ./trans /usr/local/bin
sudo apt install gawk -y
sudo apt install snapd -y
sudo snap install lngcnv
echo "Ejemplos de uso:\n" > ~/traducir_instrucciones.txt
echo "Modo interactivo: trans -shell -brief" >> ~/traducir_instrucciones.txt
echo "Traducir a español: trans :es -brief 'Damn world'" >> ~/traducir_instrucciones.txt
echo "Traducir a inglés: trans :en -brief 'Maldito mundo'" >> ~/traducir_instrucciones.txt
echo "trans -brief 'Cómo estáis?'" >> ~/traducir_instrucciones.txt
echo "lngcnv --ipa --eng "wears"" >> ~/traducir_instrucciones.txt
