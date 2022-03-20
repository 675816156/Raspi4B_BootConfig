#!/bin/bash

set -e

git submodule init
git submodule sync
git submodule update

pushd rpi-eeprom/
git checkout .
git pull origin master
popd

pushd usbboot
git checkout .
git pull origin master
popd

rm -rf beta_release/
rm -rf release/
sed -i 's/BOOT_UART=0/BOOT_UART=1/g' `ls rpi-eeprom/imager/*.txt`
sed -i 's/BOOT_ORDER=0xf14/BOOT_ORDER=0xf13/g' rpi-eeprom/imager/boot-conf-usb.txt
./rpi-eeprom/imager/make-imager-release

# ignore error
set +e
wget --no-check-certificate -O rpi4boot/bootcode.bin https://github.com/raspberrypi/firmware/blob/master/boot/bootcode.bin
set -e

sed -i -e "s/BOOT_UART=0/BOOT_UART=1/" rpi4boot/bootcode.bin
# ignore error
set +e
sudo mount rpi4boot/boot.img rpi4boot/boot
set -e

