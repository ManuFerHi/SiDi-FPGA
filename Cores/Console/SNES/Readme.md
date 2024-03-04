# Overview of the SNES core #

  * Cycle accurate SNES replica.
  * Supports LoROM, HiROM, ExHiROM.
  * Supports additional chips: DSP-1/2/3/4/ST010, S-RTC, OBC-1
  * Save/Load Backup RAM.
  * Video support: VGA, RGB, YPbPr.

  * [Original source code](https://github.com/gyurco/SNES_MiSTer/tree/mist)


# Installation #

Copy the `*.rbf` file at the root of the SD card.
You can rename the file to core.rbf if you want the MIST to load it automatically at startup.

Roms can be copied anywhere on the SD card (but SNES directory is preferred) and are selected via the OSD menu. They should be .SFC, .SMC or .BIN ROM format. SMC only difference compared to SFC is that they have a 512byte header, the core detects that from the file size.

If a ROM doesn't work it's possible it uses one of the unsupported enhancement chips. Currently only DSPn variants (the most common chip), S-RTC1 and OBC-1 are supported .

The core will start with a blank screen. Press F12 to enter the OSD menu or SELECT+START on the gamepad. _If you have a ROM named SNES.rom then that will automatically be loaded when the core starts._

_Make sure you select the correct LoROM/HiROM setting before loading the ROM!_ You need to use a SNES ROM utility to discover the ROM type, the Core currently cannot automatically detect the ROM type.
If you have many files you might want to store them into alphabetized sub-folders to access them more quickly.

# Controls #

**Controls:**
  * Use one or two gamepads
  * Buttons 3 and 4 map to Select and Start.
  * F12 to open OSD
  * Configure additional buttons using mist.ini joystick_remap.

Example gemepad mappings:
  * iBuffalo SNES gamepad: `joystick_remap=0583,2060,1,2,4,8,10,20,100,200,400,800,40,80`
  * Logitech F310: `joystick_remap=046d,c216,1,2,4,8,200,20,10,100,400,800,0,0,40,80,0,0`
  * Dragonrise SNES gamepad: `joystick_remap=0079,0011,1,2,4,8,100,10,20,200,400,800,0,0,40,80`
  * USB-to-PSX (cheap) adapter: `joystick_remap=0810,0003,1,2,4,8,100,10,20,200,400,800,400,800,40,80`

MIST front panel buttons:
  * (left) Reset MIST to default core
  * (middle) Open OSD menu, hold to switch between VGA & RGB.
  * (right) Reset SNES with current ROM

# Backup SRAM support #

Many games allow save game states or highscores to an on-cart battery backed SRAM chip. This core supports backup and load of this SRAM to the SD card:

  * Create an empty file of size 64K (65536 bytes) on the SD-Card with .sav extension. It doesn't matter if this file is larger than the SRAM backup size, just as long as it is not smaller.
  * _It is important you select the correct LoROM or HiROM in the OSD for the chose ROM as the incorrect setting can cause the SRAM backup/load to fail without notification. Some games will appear to load correctly even with the wrong LoROM/HiROM setting._
  *  After loading the game ROM, choose "Mount SAV" from the OSD, and select the previously created file. The yellow LED will lit, indicating that the backup file is loaded.
  *  Before you load a new ROM, or turn off the MIST, don't forget to write back the contents of the backup RAM to the SD-Card via the "Write Save RAM" OSD option. You can only write back the SRAM contents when the yellow led lit!
  *  A list of carts with backup SRAM support: https://www.dkoldies.com/blog/complete-list-of-snes-games-with-save-batteries/

# ROM Validation and SAV File Generation #

BASH script to validate, rename and prepare ROMS for this core. It also generates SAV files for games that support them. 

[Download script here](https://github.com/mist-devel/mist-binaries/blob/master/cores/snes/utils/tidy_SNES_roms.sh). The script requires NSRT which is also [here](https://github.com/mist-devel/mist-binaries/tree/master/cores/snes/utils)

Put the script and NSRT executables inside the directory with the ROMS.

Please note that the script cannot correctly detect and rename ExHiROM games (e.g. Captain Commando, Tales of Phantasia, Trials of Mana). These need to be renamed manually.

# Contributors #

 * [Original core by srg320](https://github.com/MiSTer-devel/SNES_MiSTer)
 * [Ported to MIST by Gyurco](https://github.com/gyurco/SNES_MiSTer/tree/mist)
