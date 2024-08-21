#!/bin/bash
cd $HOME/Downloads
cd $HOME/Descargas
sudo printf "load-module module-null-sink sink_name=audiorelay-virtual-mic-sink sink_properties=device.description=Virtual-Mic-Sink" | sudo tee -a /etc/pulse/default.pa > /dev/null
# Creates a device usable by communications apps (e.g: skype)
sudo printf "load-module module-remap-source master=audiorelay-virtual-mic-sink.monitor source_name=audiorelay-virtual-mic-sink source_properties=device.description=Virtual-Mic" | sudo tee -a  /etc/pulse/default.pa
sudo pulseaudio -k
sudo apt install pavucontrol -y
printf "What the result should look like in Volume control / pavucontrol\n"
printf "Start AudioRelay on your phone\nGo to the server tab\nClick on the microphone source"
printf "Start AudioRelay on your PC\nGo to the player tab\nSelect Virtual-Mic-Sink as the audio device\nClick on your phone in the server list"
wget https://dl.audiorelay.net/setups/linux/audiorelay-0.27.5.deb
sudo dpkg -i audiorelay*
rm -rf audiorelay-0.*.deb
printf "tutorial:\nhttps://docs.audiorelay.net/instructions/linux/use-your-phone-as-a-mic-for-a-linux-pc"
pavucontrol &
