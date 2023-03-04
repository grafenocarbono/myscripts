#!/bin/bash
sudo curl -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt-linux -o /usr/local/bin/tt && sudo chmod +x /usr/local/bin/tt
sudo curl -o /usr/share/man/man1/tt.1.gz -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt.1.gz
curl http://api.quotable.io/random|jq '[.text=.content|.attribution=.author]' | tt -quotes -
echo "tt -n 10 -g 5"
tt -quotes en
