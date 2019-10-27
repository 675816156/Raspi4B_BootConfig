unzip rpi-boot-eeprom-recovery-2019-09-10-vl805-000137ab.zip
./rpi-eeprom/rpi-eeprom-config ./pieeprom.bin >bootconf.txt
vim bootconf.txt
./rpi-eeprom/rpi-eeprom-config --out pieeprom_new.bin --config bootconf.txt pieeprom.bin
sha256sum pieeprom_new.bin | awk '{print $1}' > pieeprom.sig
mv pieeprom_new.bin pieeprom.bin
