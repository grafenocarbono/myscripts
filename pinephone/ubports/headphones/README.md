First put the script in ~/.local/bin/switch-audio:

#!/bin/bash

case "$1" in
    -h|--headphones|headphones|aux)
        echo "Disabling Speakers..."
        amixer -c 0 set 'Line Out'  mute
        echo "Enabling Headphones..."
        amixer -c 0 set 'Headphone' unmute
        echo "Done."
        ;;
    -s|--speakers|speakers)
        echo "Disabling Headphones..."
        amixer -c 0 set 'Headphone' mute
        echo "Enabling Speakers..."
        amixer -c 0 set 'Line Out'  unmute
        echo "Done."
        ;;
    -?|*)
        echo "Usage:"
        echo "Headphones: -h | --headphones | headphones | aux"
        echo "Speakers: -s | --speakers | speakers"
        echo "Help: -? | *"
        ;;
esac
Make it executable with chmod +x ~/.local/bin/switch-audio.
Then create ~/.local/share/applications/audio-via-headphones.desktop:

[Desktop Entry]
Name=Audio via headphones
Exec=/home/phablet/.local/bin/switch-audio -h
Icon=/usr/share/icons/Adwaita/256x256/devices/audio-headphones.png
Terminal=true
Type=Application
X-Ubuntu-Touch=true
And create ~/.local/share/applications/audio-via-speakers.desktop:

[Desktop Entry]
Name=Audio via speakers
Exec=/home/phablet/.local/bin/switch-audio -s
Icon=/usr/share/icons/Adwaita/256x256/devices/audio-speakers.png
Terminal=true
Type=Application
X-Ubuntu-Touch=true
