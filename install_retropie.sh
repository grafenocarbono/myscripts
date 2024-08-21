cd /tmp
sudo apt update && sudo apt upgrade
sudo apt install -y git dialog unzip xmlstarlet
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
sudo ./retropie_setup.sh
cd
echo "emulationstation to execute emulator..."
