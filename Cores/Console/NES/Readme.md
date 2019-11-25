# Introduction #

This page has operating instructions for the Sega Master System core.


# Links #

  * [binary download](https://github.com/mist-devel/mist-binaries/tree/master/cores/sms)
  * [homepage of the core](http://fpga-hacks.blogspot.de/)

# Installation #

Copy the `*`.rbf file at the root of the SD card.
You can rename the file to core.rbf if you want the MiST to load it automatically at startup.

Roms can be copied anywhere on the SD card and are selected via the OSD menu.
If you have many files you might want to store them into alphabetized sub-folders to access them more quickly.


---


# OSD Menu #

The core will start with a screen showing the SMS bootloader. Press F12 to enter the OSD menu:

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/sms_osd1.jpg' title='OSD Menu' width='320px' />

  * Load `*`.SMS: load a ROM from SD card
  * Video: switch from NTSC (60hz) to PAL (50hz)
  * Joysticks: swap 1P and 2P joysticks
  * Pause: press the pause button (useful if your controller only has 2 buttons)
  * Reset: restart the core

A second tab allows to change the firmware:

<img src='https://raw.githubusercontent.com/wiki/mist-devel/mist-board/img_docs/sms_osd2.jpg' title='OSD Menu 2' width='320px' />


---