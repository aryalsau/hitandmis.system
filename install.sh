#!/bin/bash
sudo apt-get install sudo curl dkms openssh-server build-essential ntp rsync beep libusb-dev libraw1394-dev linux-headers-$(uname -r)

cd ~
mkdir dependencies


cd ~/dependencies
wget -P dependencies/ http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3380.tar.gz
tar xvf cfitsio*
cd cfitsio*
./configure --prefix=/usr/local
make
sudo make install



cd ~/dependencies
wget ftp://ftp.piacton.com/Public/Software/Official/Linux/pvcam-pilk-usb-dkms_1.0.3-1ubuntu1_all.deb
dpkg --install pvcam-pilk-usb-dkms_1.0.3-1ubuntu1_all.deb



cd ~/dependencies
wget ftp://ftp.piacton.com/Public/Software/Official/Linux/libpvcam.so.2.7.4.2.bin
mv libpvcam.so.2.7.4.2.bin /usr/lib/libpvcam.so.2.7.4.2



cd ~/dependencies
wget ftp://ftp.piacton.com/Public/Software/Official/Linux/pi_pvcam_sdk_installer-2.7.1.7.tar.gz
tar zxvf pi_pvcam_sdk_installer*
cd pvcam*
sudo ./install_sdk.sh



cd ~/dependencies
wget http://www.phidgets.com/downloads/libraries/libphidget.tar.gz
tar xvf libphidget*.tar.gz
cd libphidget*
./configure
make
sudo make install



cd ~/dependencies
wget  --no-check-certificate  https://github.com/kuravih/hitandmis.system/raw/master/dependencies/andor-2.98.30010.0.tar.gz
tar zxvf andor*
cd andor
sudo ./install_andor


cd ~/dependencies
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs


rm -rf ~/dependencies
