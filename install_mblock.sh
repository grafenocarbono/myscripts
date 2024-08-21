#!/bin/bash
wget -O mblock.tar.gz https://github.com/Makeblock-official/mBlock/releases/download/V4.0.0-Linux/mBlock-4.0.0-linux-4.0.0.tar.gz
tar zxvf mblock.tar.gz
rm mblock.tar.gz
mv mBlock $HOME
cd $HOME
cd mBlock
./mblock
