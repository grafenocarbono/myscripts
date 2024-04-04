#!/bin/bash
sudo apt-get install festival -y
echo "echo 'hello' | festival --tts" > ~/instrucciones_speak.txt
echo "festival para modo interactivo" >> ~/instrucciones_speak.txt
echo "text2wave myfile.txt -o myfile.wav" >> ~/instrucciones_speak.txt
echo "(Parameter.set 'Audio_Method 'Audio_Command)" > ~/.festivalrc
echo "(Parameter.set 'Audio_Command 'aplay -Dplug:default -f S16_LE -r 15000 $FILE')" >> ~/.festivalrc
echo "El flag r del archivo ~/.festivalrc es para controlar la velocidad de lectura" >> ~/instrucciones_speak.txt
