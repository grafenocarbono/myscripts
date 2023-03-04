#!/bin/bash
sudo apt-get install vim libncurses5-dev gcc make git exuberant-ctags libssl-dev bison flex libelf-dev bc -y
mkdir -p $HOME/git/kernels; cd $HOME/git/kernels
git clone -b staging-testing git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
cd staging
sudo cp /boot/config-`uname -r`* .config 
sudo make olddefconfig
sudo make menuconfig
sudo make
sudo make modules_install install 
echo "change the lines GRUB_HIDDEN_TIMEOUT=10, delete GRUB_HIDDEN_TIMEOUT_QUIET=true, check GRUB_TIMEOUT_STYLE=menu"
read -n 1 -s -r -p "Press any key to continue"
sudo vim /etc/default/grub 
sudo update-grub2 
sudo apt-get install esmtp -y
sudo apt-get install mutt -y 
sudo apt-get install git-email -y
cd $HOME/git/kernels/staging/
make tags
