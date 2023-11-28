#!/bin/bash
sudo apt install curl -y
sudo curl -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt-linux -o /usr/local/bin/tt && sudo chmod +x /usr/local/bin/tt
sudo curl -o /usr/share/man/man1/tt.1.gz -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt.1.gz
curl http://api.quotable.io/random|jq '[.text=.content|.attribution=.author]' | tt -quotes -
echo "tt -n 10 -g 5"
printf "Ctrl + C,exit the test. Escape,\n Restart the test. \nLeft Arrow, move to the previous test.\n Right Arrow, 
Move to the next test, tt -quotes en"
printf "-n GROUPSZ Sets the number of words which constitute a group.\n"
printf "-g NGROUPS Sets the number of groups which constitute a test\n"
