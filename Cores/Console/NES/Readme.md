# Overview #

This page has operating instructions for the NES/Famicom core.


# Links #
  * [Core binaries](https://github.com/mist-devel/mist-binaries/tree/master/cores/nes)
  * [FPGANES](http://fpganes.blogspot.de/)
  * [Original source code](https://github.com/strigeus/fpganes)


# Installation #

Copy the `*`.rbf file at the root of the SD card.
You can rename the file to core.rbf if you want the MiST to load it automatically at startup.

Roms can be copied anywhere on the SD card and are selected via the OSD menu.
If you have many files you might want to store them into alphabetized sub-folders to access them more quickly.


---


# Controls #

Controls:
  * Use one or two gamepads
  * Buttons 3 and 4 map to Select and Start.
  * If you gamepad has only 2 buttons, you can use Select and Start from OSD menu
  * F12 to open OSD

MiST front panel buttons:
  1. (left) Reset MiST to default core
  1. (middle) Open OSD menu
  1. (right) Reset NES with current ROM

# OSD Menu #

The core will start with a blank screen. Press F12 to enter the OSD menu:

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/nes_osd1.jpg' title='OSD Menu - Page 1' width='320px' />

  * **Load `*`.NES**: load a ROM from the SD card
  * **HQ2X**: active hq2x image enhancement, smoothing pixels (good for large screens)
  * **Start**: push the Start button
  * **Select**: push the Select button
  * **Reset**: restart the NES core

The second page contains some general options:
  * **Firmware & core**: allows to switch to another core or upgrade the MiST firmware
  * **Save settings**: save the current settins to the SD card for next startup

In the rom selection screen, m can select a rom with Enter.


## Notes ##

  * Video mode is 720x481p


---


# Compatibility #

This table shows the memory mappers that the core supports; a large amount of commercial ROMs will run (~87%).

One major limitation is that we cannot save to the SD card.

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/nes_mappers.jpg' title='mapper supprot' />


---
