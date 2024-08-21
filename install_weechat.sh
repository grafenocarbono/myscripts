#!/bin/bash
sudo apt-get install ca-certificates dirmngr gpg-agent apt-transport-https
sudo mkdir /root/.gnupg
sudo chmod 700 /root/.gnupg
sudo mkdir -p /usr/share/keyrings
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/weechat-archive-keyring.gpg --keyserver hkps://keys.openpgp.org --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
sudo apt-get update
sudo apt-get install weechat-curses weechat-plugins weechat-python weechat-perl
weechat

