generate eeprom usbboot for raspi4b
```bash
./runMe.sh
```

zip file such as: release/rpi-boot-eeprom-recovery-2022-01-25-vl805-000138a1-usb.zip

and unzip file to sdcard boot partition
```bash
❯ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0    7:0    0 110.8M  1 loop /snap/core/12725
loop1    7:1    0 110.7M  1 loop /snap/core/12821
loop2    7:2    0    42M  0 loop /home/jun/raspi/Raspi-4B/Raspi4B_BootConfig/rpi4boot/boot
sda      8:0    0  1000G  0 disk
└─sda1   8:1    0  1000G  0 part /
sdc      8:32   1   7.4G  0 disk
├─sdc1   8:33   1   512M  0 part
└─sdc2   8:34   1   6.9G  0 part

sudo mount /dev/sdc1 /mnt/sdcard/

sudo unzip release/rpi-boot-eeprom-recovery-2022-01-25-vl805-000138a1-usb.zip -d /mnt/sdcard/
```

then insert sdcard to raspi4b and power on the raspi4b board wait for 10~20
seconds

raspi4 logs:
```bash
SIG vl805.sig 6246230ecd5b472902e6a49c95e857a5e3190c4fa6c462d6a8867e9a5e523a7c 0
VL805 EEPROM is up to date
SIG pieeprom.sig 5fb803c25b3e895bd704807773933a0753fdba51762f3ab8a3006b9d77955fcc 1647757642
Reading EEPROM: 524288
Writing EEPROM
.................................................................................................+.............................+
Verify BOOT EEPROM
Reading EEPROM: 524288
BOOT-EEPROM: UPDATED
```

the eeprom with usbboot is flashed in the Raspi4b Board

and unplug the sdcard.

power on the raspi4b, and it will enter rpiboot mode.
raspi4b usbboot logs:
```bash
RPi: BOOTLOADER release VERSION:6efe41bd DATE: 2022/01/25 TIME: 14:30:41 BOOTMODE: 0x00000006 part: 0 BUILD_TIMESTAMP=1643121041 0x33e564e3 0x00c03111 0x00056a04
PM_RSTS: 0x00001000
part 00000000 reset_info 00000000
uSD voltage 3.3V
Initialising SDRAM 'Micron' 16Gb x2 total-size: 32 Gbit 3200

XHCI-STOP
xHC ver: 256 HCS: 05000420 fc000031 00e70004 HCC: 002841eb
USBSTS 11
xHC ver: 256 HCS: 05000420 fc000031 00e70004 HCC: 002841eb
xHC ports 5 slots 32 intrs 4
Reset USB port-power 1000 ms
xhci_set_port_power 1 0
xhci_set_port_power 2 0
xhci_set_port_power 3 0
xhci_set_port_power 4 0
xhci_set_port_power 5 0
xhci_set_port_power 1 1
xhci_set_port_power 2 1
xhci_set_port_power 3 1
xhci_set_port_power 4 1
xhci_set_port_power 5 1
XHCI-STOP
xHC ver: 256 HCS: 05000420 fc000031 00e70004 HCC: 002841eb
USBSTS 18
XHCI-STOP
xHC ver: 256 HCS: 05000420 fc000031 00e70004 HCC: 002841eb
USBSTS 19
xHC ver: 256 HCS: 05000420 fc000031 00e70004 HCC: 002841eb
xHC ports 5 slots 32 intrs 4
Boot mode: RPIBOOT (03) order f1
```

PC rpiboot process start

```bash
✦ ❯ ./rpiboot -d rpi4boot
RPIBOOT: build-date Mar 16 2022 version 20220315~121405 6fa2ec0c
Loading: rpi4boot/bootcode.bin
Waiting for BCM2835/6/7/2711...
Loading embedded: bootcode4.bin
Second stage boot server
Loading: rpi4boot/config.txt
File read: config.txt
Loading: rpi4boot/boot.img
File read: boot.img
Second stage boot server done
```

and then raspi4b is booting now!!!
Enjoy youself ! ! !
