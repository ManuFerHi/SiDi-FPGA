# NES core for SiDi

This is a port of Luddes' NES core to SiDi (see his [FPGANES blog](http://fpganes.blogspot.de) for details).

## Resources
- [FPGANES original source code by strigeus](https://github.com/strigeus/fpganes) 
- [MiST port by gyurco](https://github.com/mist-devel/nes)

## 15 khz support (TV)
Create a mist.ini file with at least the following line:

```
[mist]
scandoubler_disable=1
```

## Joystick support

* Use one or two gamepads
* Buttons 3 and 4 are Select and Start
* If your gamepad has only 2 buttons you can use Select and Start from OSD menu
* F12 to open OSD menu


## Keyboard support

* 1 - Switch to joystick A
* 2 - Switch to joystick B
* Up, Down, Left, Right
* Esc - Start
* Tab - Select
* Space - Fire 1
* Left Alt - Fire 2

## Powerpad emulation support

The [Powerpad / Family Trainer / Family Fun Fitness](https://en.wikipedia.org/wiki/Power_Pad) accessory is emulated through
the keyboard.

Side A:
*    O  O    -   T R
* O  O  O  O - H G F D
*    O  O    -   B V   

Side B:
* 1  2  3  4 - E R T Y
* 5  6  7  8 - D F G H
* 9 10 11 12 - C V B N 

## FDS image support

Famicom Disk System images are supported through Loopy's FDS mapper. It needs
a modified FDS BIOS, can be found in the [NES PowerPak](https://www.retrousb.com/product_info.php?products_id=34).
Get FDSBIOS.BIN from the archive, and load it using the OSD "Load FDS BIOS" option before
loading an FDS file.

If a game requires a disk swap, hold down the PgUp key for a while. If the automatic
feature determining the requested disk side doesn't work, select it using the
OSD "Disk Side" option.

## NSF music files

They're played using Loopy's NSF player. Just load the NSF file and enjoy!

## Backup RAM support / FDS image save

* Create an empty SAV file on the SD-Card to store the backup RAM data. The size of this file should be 8 kbytes for
ordinary cart saves, and the size of the .FDS file (usually ~128 kbytes) for disk saves.
* After loading the NES/FDS file, choose the "Mount SRAM" option from the OSD, and select the .SAV file.
* You can load/save the backup RAM contents from/to the SD Card via the "Load SRAM" and the "Save SRAM" OSD items.
