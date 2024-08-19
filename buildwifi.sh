#!/bin/bash

export BASEVER=6.6.44-fpp16
export KVER="${BASEVER}_1"
export CROSS_COMPILE=/home/dkulp/working/bb-kernel/dl/gcc-13.2.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-
export ARCH=arm
export KSRC="/home/dkulp/working/bb-kernel/KERNEL/debian/linux-headers/usr/src/linux-headers-${BASEVER}"


mkdir -p wireless

git clone https://github.com/morrownr/88x2bu-20210702 88x2bu
cd 88x2bu
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
make -j 8
cp -f 88x2bu.ko ../wireless
cd ..
rm -rf 88x2bu


git clone https://github.com/Mange/rtl8192eu-linux-driver
cd rtl8192eu-linux-driver
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8192eu.ko ../wireless
cd ..
rm -rf rtl8192eu-linux-driver



git clone https://github.com/lwfinger/rtl8723au
cd rtl8723au
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8723au.ko ../wireless
cd ..
rm -rf rtl8723au


git clone https://github.com/morrownr/8812au-20210820
cd 8812au-20210820
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8812au.ko ../wireless
cd ..
rm -rf  8812au-20210820


git clone https://github.com/morrownr/8814au
cd 8814au
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8814au.ko ../wireless
cd ..
rm -rf 8814au

git clone https://github.com/morrownr/8821au-20210708
cd 8821au-20210708
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8821au.ko ../wireless
cd ..
rm -rf 8821au-20210708

git clone https://github.com/morrownr/8821cu-20210916 8821cu
cd 8821cu
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8821cu.ko ../wireless
cd ..
rm -rf 8821cu

git clone https://github.com/lwfinger/rtl8188eu
cd rtl8188eu
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
make -j 8
cp -f 8188eu.ko ../wireless
cd ..
rm -rf rtl8188eu


git clone https://github.com/FoxtrotGolf/rtl8188fu
cd rtl8188fu
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
export USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN -Wno-error=incompatible-pointer-types"
make -j 8
cp rtl8188fu.ko ../wireless
cd ..
rm -rf rtl8188fu


# git clone https://github.com/lwfinger/rtl8192cu
# cd rtl8192cu
# export USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN -Wno-error=incompatible-pointer-types"
# sed -i 's/I386_PC = y/I386_PC = n/' Makefile
# sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
# sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
# sed -i 's/KSRC *:= /KSRC ?= /' Makefile
# sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
# make -j 8
# unset USER_EXTRA_CFLAGS
# cp rtl8192cu.ko ../wireless
# cd ..
# rm -rf rtl8192cu


git clone https://github.com/lwfinger/rtl8723bu
cd rtl8723bu
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
export USER_EXTRA_CFLAGS="-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DCONFIG_P2P_IPS"
make -j 8
unset USER_EXTRA_CFLAGS
cp 8723bu.ko ../wireless
cd ..
rm -rf rtl8723bu


git clone https://github.com/morrownr/rtl8852bu
cd rtl8852bu/
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
sed -i 's/#_PLATFORM_FILES/_PLATFORM_FILES/' Makefile
export USER_EXTRA_CFLAGS="-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DCONFIG_P2P_IPS -DCONFIG_LITTLE_ENDIAN"
make -j 8
unset USER_EXTRA_CFLAGS 
cp 8852bu.ko ../wireless
cd ..
rm -rf rtl8852bu


git clone https://github.com/lwfinger/rtl8852au
cd rtl8852au/
sed -i 's/I386_PC = y/I386_PC = n/' Makefile
sed -i 's/ARM_RPI = n/ARM_RPI = y/' Makefile
sed -i 's/KVER *:= $(shell uname -r)/KVER ?= $(shell uname -r)/' Makefile
sed -i 's/KSRC *:= /KSRC ?= /' Makefile
sed -i 's/CROSS_COMPILE *:=/CROSS_COMPILE ?=/' Makefile
sed -i 's/#_PLATFORM_FILES/_PLATFORM_FILES/' Makefile
export USER_EXTRA_CFLAGS="-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DCONFIG_P2P_IPS -DCONFIG_LITTLE_ENDIAN"
make -j 8
unset USER_EXTRA_CFLAGS 
cp 8852au.ko ../wireless
cd ..
rm -rf rtl8852au


tar -czf wireless-${BASEVER}.tgz wireless
