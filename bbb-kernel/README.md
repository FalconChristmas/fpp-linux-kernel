# Build Instructions
There are two options for building the Linux kernel.   The fastest is by cross compiling
from a Debian Linux and copying the result over to the Beagle.  This is much faster
for testing, but cannot be used for creating the deb files needed for "release".  For 
release, the debs must be built on an armv7 device.  The fastest option is to use
a Beaglebone AI to build the deb, but it can be done on a Beaglebone Black, just much
slower.

# Required Kernel Changes
The first step is to checkout the latest Beaglebone kernel sources via:
git clone git://github.com/beagleboard/linux.git
This kernel repo is very large so it might be best to checkout on a desktop and
transfer the Beagle.

Then swith to the appropriate tag.  For example:
git checkout 4.19.94-ti-r50

Copy the current config from a beagle by grabbing the /proc/config.gz, uncompressing it, and 
sticking that as .config.   You should now be able to build a kernel identical to the 
official release.   For FPP, run "make menuconfig" as we need to change a few things:
* Disable SMP support - beaglebone blacks are single core
* Disable initrd support - we dont use it, slows boot down a bit
* Kernel Features -> Increase timer to 500hz
* CPU Power Management 
 * CPU Frequency scaling, turn on performance governor and turn off everything else.  Make
   sure the "TI CPUFreq" support is off and Generic DT based cpufreq driver.  We need
   to keep the cpu locked at 100%
 * CPU Idle PM support - turn completely off
* Power management options
 * turn off Susupend to RAM and standby
 * turn off hibernate
* Network support
 * turn off CAN bus subsystem 
 * turn off amateur radio support
* Device Drivers 
 * Turn OFF "Watchdog Timer Support"
* Device drivers -> Remoteproc drivers
 * Turn OFF AMx3xx Wakeup M3 remoteproc support
* Device Drivers -> Real Time Clock
 * Turn OFF the TI OMAP RTC
* Device Drivers -> Pulse  Width Modulation
 * Turn OFF the OMAP Dual Mode Timer PWM


# Building on Beaglebone
Building on the beaglebone is easy, just type:
make bindeb-pkg
That will take a long time and build the debs one level up.  If running on the AI, add 
a "-j 2" to use the two cores and speed up the build.

# Cross compiling:
You need to install a bunch of tools first. 

sudo apt-get install gcc-arm-linux-gnueabi flex bison libssl-dev

You should then be able to do the menuconfig via:
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- menuconfig

And then build the kernel via:
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LOADADDR=0x80000000 uImage dtbs modules -j 6

To prepare everything for transfer to the Beagle:
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=/tmp/rootfs modules_install
VERSION=4.19.106fpp+
mkdir /tmp/rootfs/boot
cp arch/arm/boot/zImage /tmp/rootfs/boot/vmlinuz-$VERSION
cp System.map /tmp/rootfs/boot/System.map-$VERSION
mkdir /tmp/rootfs/boot/dtbs
mkdir /tmp/rootfs/boot/dtbs/$VERSION
cp arch/arm/boot/dts/*.dtb /tmp/rootfs/boot/dtbs/$VERSION

then rsync the /tmp/rootfs over to the beagle.



