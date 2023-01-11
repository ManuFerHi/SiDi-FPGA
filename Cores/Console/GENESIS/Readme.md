# MiST / SiDi port of fpgagen - Genesis / Mega Drive core


![alt](https://live.staticflickr.com/65535/52620927171_d603eb71b4_o.png)

This core implements a SEGA Genesis / Mega Drive for MiST / SiDi FPGA boards.
 
The core's main features:
  - Complete 68K and Z80 CPU implementations
  - Video controller (VDP)
  - Stereo sound
  - Analog video output
    - VGA
    - SCART RGB (TV)
    - YPbPr component
  - 3/6 buttons controller support
  - Lightgun support (single Menacer or single/dual Justifier) via mouse
  - SEGA Mouse support
  - SEGA Teamplay / EA 4 Way Play / J-CART multitap support
  - SVP chip for Virtua Racing (in a separate downloadable core)
  - CPU Turbo option

Currently the core runs most games perfectly, including the "Titan Overdrive" demo. Some games using
special and undocumented hardware features may show visual or acoustic imperfections, or may not
run at all.


## Installing the core

**This core requires at least firmware version 20181013.**

Copy the following files to the root of your SD card:
  - Copy the latest rbf file (i.e. fpgagen_20181026.rbf) and rename it core.rbf (or load it from the Menu core)
  - Copy your .bin/.md/.gen cartridge images to the SD card (preferrably into a GENESIS subdirectory)

## Backup RAM support

Some games allow to save the game state or highscores to a battery-backed SRAM chip. You can do this in core as well, following this procedure:

  1. Create an empty file on the SD card with .sav extension. The maximum size of the save ram file can be 32k, so it's safe to create a file with 32768 byte size. Another option is to use an existing save file from an emulator, e.g. BlastEm's sram files are working.
  2. After loading the game ROM, choose "Mount SAV" from the OSD, and select the previously created file.
  3. Before you load a new ROM, or turn off the board, don't forget to write back the contents of the
backup RAM to the SD card with the "Write Save RAM" OSD option. You can only write back the SRAM contents
when the SAV is mounted!

Note: only normal RAM type backup devices are working, EEPROM is still fake.

A list of carts with backup RAM support, with the type of the storage can be found in [this forum topic](https://forum.digitpress.com/forum/showthread.php?134961-NES-SNES-Genny-Games-with-Battery-Back-up-Save-feature&p=1614576&viewfull=1#post1614576).

## Some usage tips

  1. **The core requires at least firmware version 20181013.**
  2. Rom file formats supported are .bin and .gen, no support for .smd files.
  3. If the controls seems to not work, try switch to 3 buttons mode in the OSD.
  4. Includes support for [YPbPr cables](https://github.com/mist-devel/mist-board/wiki/YPbPr_Cable)
  5. Some carts have an SRAM or EEPROM to allow saving game states. SRAM is always enabled at 2MB (if
     the cart size < 2MB, or the game uses bank switching to page in), and you can turn on a "fake"
     EEPROM at 2MB in the OSD. For example, it allows NBA Jam TE to run. Note: use "Fake EEPROM"
     option only on games which require it, because its control address can clash with the normal cart ROM.
  6. SVP version is only for Virtua Racing!

## Contributors

  - [Original core by Torlus](https://github.com/Torlus/fpgagen)
  - [TG68K CPU core by Tobias Gubener](https://opencores.org/project/tg68)
  - [FX68K CPU core by Jorge Cwik](https://github.com/ijor/fx68k)
  - [T80 CPU core by Daniel Wallner](https://opencores.org/project/t80/overview)
  - [Initial MIST port by Robinsonb5](https://github.com/robinsonb5/fpgagen)
  - [JT12 YM2612 sound core by Jose Tejada](https://github.com/jotego/jt12)
  - [Improvements by Gyurco](https://github.com/gyurco/)
  - [Improvements by Sorgelig](https://github.com/MiSTer-devel/Genesis_MiSTer)
  
  ...and many more.

## Thanks to the members/authors of

  - [SpriteMind.net forum](http://gendev.spritesmind.net/forum/) for lot of valuable information
  - [Exodus emulator](https://www.exodusemulator.com/) for its great debugger
  - [BlastEm emulator](https://www.retrodev.com/blastem/) for allowing to look into the source code of the most accurate Genesis emulator
