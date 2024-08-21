cd ~
mkdir -p ~/bin/
cd ~/bin/
git clone https://github.com/davenisc/thief_raccoon.git
cd thief_raccoon
sudo apt install python3.11-venv
python3 -m venv raccoon_venv
source raccoon_venv/bin/activate
pip install -r requirements.txt
python3 app.py
