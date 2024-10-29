#!/usr/bin/env bash

# gns3
sudo apt update
sudo apt install python3-pip python3-pyqt5 python3-pyqt5.qtsvg python3-pyqt5.qtwebsockets qemu qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst wireshark xtightvncviewer apt-transport-https ca-certificates curl gnupg2 software-properties-common telnet -y
sudo pip3 install gns3-server gns3-gui

# dynamips
cd /tmp
sudo apt install git cmake libelf-dev -y
git clone https://github.com/GNS3/dynamips.git && cd dynamips
mkdir build && cd build
cmake .. && sudo make install

# ubridge
cd /tmp
sudo apt install libpcap-dev -y
git clone https://github.com/GNS3/ubridge.git && cd ubridge
make && sudo make install

# vpcs
cd /tmp
wget https://static.lacapsule.academy/programs/devops-full-time/dependencies/vpcs_0.8-1_amd64.deb && sudo dpkg -i vpcs_0.8-1_amd64.deb

# libvirt
wget https://static.lacapsule.academy/programs/devops-full-time/dependencies/virsh.xml && virsh net-define /tmp/virsh.xml
sudo virsh net-start default
sudo virsh net-autostart default

# dumpcap
sudo chmod +x /usr/bin/dumpcap

# cleanup
sudo apt autoremove && sudo apt autoclean
rm -rf dynamips_0.2.14-1_amd64.deb ubridge vpcs_0.8-1_amd64.deb virsh.xml dynamips
