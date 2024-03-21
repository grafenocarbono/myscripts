#/bin/bash
cd Downloads
cd Descargas
wget https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.xz
mkdir $HOME/bin
mv node-v20.11.1-linux-x64.tar.xz $HOME/bin/node.tar.xz
cd $HOME/bin
tar xvf node.tar.xz
echo "export PATH=$PATH:~/bin/node-v20.11.1-linux-x64/bin/" >> ~/.bashrc
npm install -g @angular/cli
