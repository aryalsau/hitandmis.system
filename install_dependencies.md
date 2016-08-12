## Dependancies available in apt

#### sudo
	$ apt-get install sudo



#### ssh
	$ apt-get install openssh-server



#### build-essential
	$ apt-get install build-essential



#### beep
Required for virtual

		$ apt-get install beep



#### libusb-dev
Required for ikon

	$ apt-get install libusb-dev



#### libraw1394-dev
Required for pixis

	$ apt-get install libraw1394-dev



## Dependancies not available in apt

Most of these packages are obsolete so a copy of the required dependencies will be held here.



#### libncurses5

get it from debian-archive

	$ wget ftp://ftp.gnome.org/mirror/debian-archive/pool/main/n/ncurses/libncurses5_5.7+20100313-5_i386.deb

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/libncurses5_5.7%2B20100313-5_i386.deb

and install by

	$ dpkg --install libncurses5_5.7+20100313-5_i386.deb



#### coreutils

get it from debian-archive

	$ wget ftp://ftp.gnome.org/mirror/debian-archive/pool/main/c/coreutils/coreutils_8.5-1_i386.deb

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/coreutils_8.5-1_i386.deb

and install

	$ dpkg --install coreutils_8.5-1_i386.deb



#### Kernel Headers

These headers are provided by the vendor and available on this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/linux-headers-2.6.34.10-vortex86-sg_1.2_i386.deb

and install

	$ dpkg --install linux-headers-2.6.34.10-vortex86-sg_1.2_i386.deb

Needs the headers to be linked as described [here](http://askubuntu.com/questions/260176/lib-modules-2-6-38-8-generic-build-no-such-file-or-directory)

	$ ln -s /usr/src/linux-headers-2.6.34.10-vortex86-sg/ /lib/modules/2.6.34.10-vortex86-sg/build



#### Kernel Image

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/linux-image-2.6.34.10-vortex86-sg_1.2_i386.deb

and install

	$ dpkg --install linux-image-2.6.34.10-vortex86-sg_1.3_i386.deb



#### cfitsio

get it from nasa

	$ wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3380.tar.gz

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/cfitsio3380.tar.gz

and install by

	$ tar xvf cfitsio3380.tar.gz
	$ cd cfitsio
	$ ./configure --prefix=/usr/local
	$ make
	$ sudo make install



#### Phidgets Spatial 1056 3/3/3 driver and the library (libphidget)

get it from Phidgets

	$ wget http://www.phidgets.com/downloads/libraries/libphidget.tar.gz

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/libphidget_2.1.8.20151217.tar.gz

and install by

	$ tar xvf libphidget_2.1.8.20151217.tar.gz
	$ ./configure
	$ make
	$ sudo make install



## node.js setup[TODO]



## Princeton Instruments Pixis 1024

#### dkms

get it from debian-archive

	$ wget ftp://ftp.gnome.org/mirror/ubuntu/pool/main/d/dkms/dkms_2.1.1.2-2ubuntu1_all.deb

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/dkms_2.1.1.2-5_all.deb

and install

	$ dpkg --install dkms_2.1.1.2-5_all.deb



#### pixis camera driver

get it from Princeton Instruments ftp

	$ wget ftp://ftp.piacton.com/Public/Software/Official/Linux/pvcam-pilk-usb-dkms_1.0.3-1ubuntu1_all.deb

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/pvcam-pilk-usb-dkms_1.0.3-1ubuntu1_all.deb

and install

	$ dpkg --install pvcam-pilk-usb-dkms_1.0.3-1ubuntu1_all.deb

change udev rule at `/lib/udev/rules.d/10-pi.rules` such that the owner is the user

	SUBSYSTEMS=="usb", ATTRS{idProduct}=="a010", ATTRS{idVendor}=="0bd7", GROUP="video", MODE="0660" SUBSYSTEMS=="usb", ATTRS{idProduct}=="a026", ATTRS{idVendor}=="0bd7", GROUP="video", MODE="0660", OWNER="ikon"



#### libpvcam

get it from Princeton Instruments ftp

	$ wget ftp://ftp.piacton.com/Public/Software/Official/Linux/libpvcam.so.2.7.4.2.bin

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/libpvcam.so.2.7.4.2.bin

and set it up with

	$ mv libpvcam.so.2.7.4.2.bin /usr/lib/libpvcam.so.2.7.4.2



#### pvcam sdk

get it from Princeton Instruments ftp

	$ wget ftp://ftp.piacton.com/Public/Software/Official/Linux/pi_pvcam_sdk_installer-2.7.1.7.tar.gz

or get it from the this repository

	$ wget --no-check-certificate https://github.com/kuravih/hitandmis.system/raw/master/dependencies/pi_pvcam_sdk_installer-2.7.1.7.tar.gz

and install

	$ tar zxvf pi_pvcam_sdk_installer-2.7.1.7.tar.gz
	$ cd pvcam2.7.1.7
	$ ./install_sdk.sh

this library installs an examples folder to `/usr/local/pvcam/examples` which needs to be usable by the user of the camdaemon, there user on computers are `pixis` or `ikon`

	$ chown -R 'user' /usr/local/pvcam/examples



## Andor iKon-M 934

#### iKon camera drivers and the sdk

get it from [Andor.com](http://my.andor.com/user/) by making an account and (needs the cameras serial number), or get it from the this repository

	$ wget --no-check-certificate  https://github.com/kuravih/hitandmis.system/raw/master/dependencies/andor-2.98.30010.0.tar.gz

and install

	$ tar zxvf andor-2.98.30010.0.tar.gz
	$ cd andor
	$ sudo ./install_andor
