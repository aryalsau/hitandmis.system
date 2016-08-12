## Serial-to-USB
The following commands are on the "Host," computer. i.e. Not the camera computer.
Check to make sure the serial to usb controller is plugged in

	ls /dev/tty*
	
You should see `/dev/ttyUSB0` or 1, or 2, or serial, etc. If not, troubleshoot.

Next, use the `screen` command to talk to the camera's computer. (see [here](https://wiki.archlinux.org/index.php/working_with_the_serial_console#Screen))

	sudo screen /dev/ttyUSB0 115200
	
Now you shouid be in the Camera's computer.

To obtain the IP adress for ssh, do the following (Using the camera computer's command line)

	sudo ifconfig

If you do not get an IP adress, then go to Network for troubleshooting.

##Network
For some reason the  `/etc/network/interfaces` will look like this

	# The loopback network interface
	auto lo
	iface lo inet loopback

	auto eth0
	niface eth0 inet dhcp

but it needs to be

	# The loopback network interface
	auto lo
	iface lo inet loopback

	# The eth1 interface
	auto eth1
	iface eth1 inet dhcp

and bring *eth1* online by

	$ ifup eth1



####apt-get

Put the following lines in `/etc/apt/sources.list`

	deb http://archive.debian.org/debian/ lenny contrib main non-free
	deb http://archive.debian.org/debian-security lenny/updates main

and then update apt by

	$ apt-get update

and update key-ring by

	$ apt-get install debian-archive-keyring

Reference [unix.stackexchange.com](http://unix.stackexchange.com/questions/66830/are-there-any-source-apt-repositories-for-debian-lenny). There will be a [GPG error... NO_PUBKEY...](http://askubuntu.com/questions/13065/how-do-i-fix-the-gpg-error-no-pubkey) issue that can be fixed by

	$ apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8BAF9A6F



