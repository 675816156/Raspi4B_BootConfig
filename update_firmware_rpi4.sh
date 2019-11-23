# unzip rpi-boot-eeprom-recovery-2019-09-10-vl805-000137ab.zip
git submodule init
git submodule sync
git submodule update

pushd rpi-eeprom/
git pull origin master
popd

newest_firmware=$(ls rpi-eeprom/firmware/beta/pieeprom-* | gawk 'END { print $0 }')
newest_vl805=$(ls rpi-eeprom/firmware/beta/vl805-* | gawk 'END { print $0 }')

./rpi-eeprom/rpi-eeprom-config ${newest_firmware} >bootconf.txt
vim bootconf.txt
./rpi-eeprom/rpi-eeprom-config --out pieeprom.bin --config bootconf.txt ${newest_firmware}
sha256sum pieeprom.bin | awk '{print $1}' > pieeprom.sig
cp ${newest_vl805} vl805.bin
sha256sum vl805.bin | awk '{print $1}' > vl805.sig
cp ./rpi-eeprom/firmware/beta/recovery.bin .
