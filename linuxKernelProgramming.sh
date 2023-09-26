#!/bin/bash
git clone https://github.com/PacktPublishing/Linux-Kernel-Programming.git
sudo apt update
sudo apt upgrade
sudo apt install build-essential dkms linux-headers-$(uname -r)
sudo /usr/bin/update-manager
sudo apt updatesudo apt install gcc make perl
sudo apt install git fakeroot build-essential tar ncurses-dev tar xz-utils libssl-dev bc stress python3-distutils libelf-dev linux-headers-$(uname -r) bison flex libncurses5-dev util-linux net-tools linux-tools-$(uname -r) exuberant-ctags cscope sysfsutils gnome-system-monitor curl perf-tools-unstable gnuplot rt-tests indent tree pstree smem libnuma-dev numactl hwloc bpfcc-tools sparse flawfinder cppcheck tuna hexdump openjdk-14-jre trace-cmd virt-what
wget --https-only -O ~/Downloads/linux-5.4.0.tar.xz https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.0.tar.xz
git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
tar xf ~/Downloads/linux-5.4.tar.xz
mkdir -p ~/kernelstar xf ~/Downloads/linux-5.4.tar.xz --directory=${HOME}/kernels/
export LLKD_KSRC=${HOME}/kernels/linux-5.4
