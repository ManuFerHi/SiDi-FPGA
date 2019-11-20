
# Amstrad CPC 6128 for MiST and SiDi
This core has been started as a port of [CoreAmstrad by Renaud Hélias](https://github.com/renaudhelias/CoreAmstrad) but every module has been either rewritten or replaced so, now it can be treated as a completely new core.

## Features
* Precise CPU timings including proper contention model.
* Precise CRTC model supporting many tricks of Types 1 and 0.
* 2 disk drives
* Disk write support.
* Close to real disk drive emulation with support of some protections.
* Selectable CPC 6128/664 mode with separate ROM sets.
* Multiface 2.
* Several monochrome modes and 2 types of palette (GA/ASIC).
* Selectable expansion ROM loading.
* Joystick support with up to 3 buttons (2 on MiST)
* Kempston, SYMBiFACE II and Multiplay mice.
* HQ2x and Scanlines FX for scandoubler.
* Tape input through UART header (MiST)
* Support *.CDT tape files.
* Tape output through speaker.


## Installation
place RBF and **amstrad.rom** into root of SD card. 

## Disk support
Put some *.DSK files into Amstrad folder and mount it from OSD menu.
important Basic commands:
* cat - list the files on mounted disk.
* run" - load and start the program. ex: run"disc
* |a, |b - switch between drives


## CDT tape files
CDT supported in very basic form for retro feeling and for some very specific apps. There is no way to rewind or fast forward the file. 
USER LED will lit if there is a tape in the memory and still have data to play and blink while playback.

Control keys:
* Alt+F1 - mute/unmute the tape sound
* Alt+F2 - force playback
* Alt+F3 - force pause
* Alt+F2+F3 - unload the tape (turn off the LED)

CDT playback respects the tape motor state, so using F2/F3 is not required during playback.

## RAM
CPC664 model has only 64KB RAM - use this model for programs not compatible with 128KB RAM.

CPC6128 model has 64KB+512KB RAM. Upper 448KB are visible in special OS ROM or application aware of 512KB expansion.

## Multiface 2
* Multiface 2 can be activated with F11.
* USER LED shows if the MF2 ROM/RAM is active.
* Returning from the MF2 menu via (r)eturn makes the device invisible.
* Visibility can be restored via machine reset (original MF 2+).
* For loading a saved game, MF2 must be visible.
* ROM version is 8D.
