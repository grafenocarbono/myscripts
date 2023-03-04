#!/bin/bash
echo "Cleaning..."
sudo rm -rf /usr/local/bin/npm /usr/local/share/man/man1/node* ~/.npm
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/bin/node*
sudo rm -rf /usr/local/include/node*
sudo apt-get purge nodejs npm -y
sudo apt autoremove -y
sudo apt-get purge nodejs --auto-remove -y
sudo apt-get purge npm --auto-remove -y
echo "For some npm packages you need build-essential"
sudo apt install build-essential -y
echo "Installing nodejs and npm..."
sudo apt install nodejs	-y
sudo apt-get install -y npm
echo "Retrieving the latest npm version..."
sudo npm install -g npm@latest
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
echo "Installing npm package *Create React App*, configure your development environment..."
sudo npm install -g create-react-app
echo "Checking installed versions"
echo "npm -v"
npm -v
echo "node -v"
node -v
echo "create-react-app --version"
create-react-app --version
read -rsn1 -p"Press any key to continue";echo
echo "An example project will be created"
echo "Example to create an example project: "
echo "1) create-react-app my-app"
echo "2) cd my-app"
echo "3) npm start"
