# Introduction #

This page has operating instructions for the Amiga core, which is a version of _Minimig_ customized for the MiST / SiDi.

# Links #

  * [Minimig AGA Source Code](https://github.com/rkrajnc/minimig-mist)


# Installation #

Copy the minimig FPGA core into a root folder of the SD card. To make the MiST start with this core, rename it to `core.rbf`.

Copy a version of the KickStart ROM into the root folder, renaming it to `kick.rom`. Kickstart 1.2, 1.3, 2.0 and 3.1 have been tested. Very good compatibility has been reported on firmware 2.0 37.350 for A600.

Disk files (HDF, ADF) can be copied anywhere on the SD card, including subfolders.
If you have many files you might want to store them sorted by type (games/apps) and alphabetical folders for finding files easily.

_For the AGA core_

You can optionally copy files `minimig.art`, `minimig.cop`, and `minimig.bal` to have an animation at boot.


---


# OSD Menu #

If the Kickstart ROM is recognized you should see the familiar "insert disk" logo.
Press F12 to open the OSD menu.

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/amiga_start.jpg' title='OSD Menu' width='320px' />

  * df0: select first floppy disk (.adf)
  * df1: select second floppy disk (.adf)
  * +/- : press +/- on numeric keypad to add or remove floppy disk drives
  * Floppy disk turbo: enable faster load, only compatible with some Kickstart versions
  * Hard disk settings: configure mass storage options

You can move to other pages of settings by pressing the right arrow key:

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/amiga_osd2.jpg' title='OSD Menu 2' width='320px' />

  * **Load/Save config**: store up to 5 different configuration (and define startup config)
  * **Chipset settings**: configure CPU and Amiga type (ECS/AGA)
  * **Memory settings**: configure RAM and ROM file
  * **Video settngs**: scanline and smoothing options

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/amiga_osd3.jpg' title='OSD Menu 3' /> <img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/amiga_osd4.jpg' title='OSD Menu 3' />





## Notes ##

  * PAL video mode is 720x576p at 50hz
  * NTSC video mode is 720x480p at 60hz
  * On the AGA core, use 24MB Fast RAM to enable full speed.


---
