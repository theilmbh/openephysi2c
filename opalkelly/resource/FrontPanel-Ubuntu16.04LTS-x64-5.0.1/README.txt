Linux Installation
------------------
These installation instructions are valid for Ubuntu 12.04LTS.  They may
work with or without slight modifications under other Linux distributions.

The Linux installation requires the addition of one file to the directory:

   60-opalkelly.rules ----->  /etc/udev/rules.d/

This file includes a generic udev rule to set the permissions on all
attached Opal Kelly USB devices to allow user access.  Once this file is
in place, you will need to reload the rules by either rebooting or using
the following commands:

   /sbin/udevadm control --reload-rules
   /sbin/udevadm trigger

With these files in place, the Linux device system should automatically
provide write permissions to Opal Kelly devices attached to the USB.



FrontPanel
----------
FrontPanel is started by running the "FrontPanel" script in the install
folder. This is just a short script that configures the environment and
then starts the FrontPanel binary.

To make use of sound and flashloader bitfile assets, they must be copied to
/usr/local/share/FrontPanel. This is handled automatically by the install
script. These assets are available in the share/FrontPanel folder.

Note: FrontPanel on Ubuntu 16.04 requires installation of the boost
libraries. This can be accomplished with the following command:

sudo apt install libboost-all-dev

**MY Note (zeke arneodo, july 2018). It requires libboost_1.58.0.!!!
------------------------------------------
If installed on newer (or different versions of ubuntu/debian), tweaking may be necessary
For installation on debian stretch, for instance, it was necessary to:

- Get the sources from ubuntu xenial in the sources.list (and comment out the sources from stretch)
- It complains about the keys when apt-get update; do sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys [keys it complaints about] to get the keys
- Then you can update.
- Then somehow, some of the boosts are libboost1.58-... and that gets the right version; some have to specify the version. Problem is that when there are dependencies it will go for the candidate (apt-cache policy pkg_name to see which is the candidate), and that is by default the newer version. So one has to go back and forth 'masking' the sources to get all the libboost in the 1.58.0 version and all the other dependencies (mpi, pydev, etc) from the stretch repos.
Reminder: you can select versions to install within the possibilities with apt-cache policy [pkg_name]
 - It is a fucking pain and I didn't understand how to do it right.

------------------------------------------

Note: The Firmware Update Wizard is not available in the Linux version of
FrontPanel.



Python API
----------
_ok.so
ok.py

By placing these files into a directory and starting Python from that
directory, you can "import ok" and have access to the Python API.  From 
there, you can run commands like:

   import ok
   xem = ok.FrontPanel()
   xem.OpenBySerial("")
   xem.LoadDefaultPLLConfiguration()
   xem.ConfigureFPGA('counters.bit')
   


Java API
--------
okjFrontPanel.dll   (Windows)
libokjFrontPanel.so (Linux)
okjFrontPanel.jar   (Common)

libokjFrontPanel.so needs to be copied to the java.library.path.  On SuSE 9.2,
	you can copy it to /usr/lib/jvm/jre/lib/i386
	
okjFrontPanel.jar should be added to your CLASSPATH.  It can either be 
	uncompressed or referred to directly on the javac/java command lines as below.
	
To build and run DESTester.java:
	javac -classpath okjFrontPanel.jar DESTester.java
	java -classpath .:okjFrontPanel.jar DESTester e inputfile outputfile
	
