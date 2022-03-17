#!/bin/bash

set -e

git submodule init
git submodule sync
git submodule update

pushd rpi-eeprom/
git pull origin master
popd

pushd usbboot
git pull origin master
popd

rm -rf beta_release/
sed -i 's/BOOT_UART=0/BOOT_UART=1/g' `ls rpi-eeprom/imager/*.txt`
./rpi-eeprom/imager/make-imager-release
