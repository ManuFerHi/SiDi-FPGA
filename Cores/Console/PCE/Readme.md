  PC-engine / SuperGrafx for MIST / SiDi
  ================
  Instructions - Put .rbf file into SD.

This is a continuation of Alastair Robinson's FPGAPCE fork, focusing mainly
on the MiST board. Contains CPU, VDP and other fixes from the MiSTer project.
Other board's code and the ZPUFlex controller still in the repo, but there
were no efforts to make them work. Fixing them would be highly appreciated.

Features:

- Standard MiST OSD and ARM ROM downloading
- SuperGrafx support
- 384K, 768K and SF2 special ROM mapper support
- Multitap up to 5 controllers (4 reported to work)
- 6 buttons controller support

Previous README:
================

PLEASE NOTE - this is a fork of the original FPGA PC Engine core, which adds
a second CPU and an on-screen display menu for setting options and selecting
ROMs.  I may well have introduced bugs in the process, and this should be
considered highly experimental.

In particular, the strange bank remapping used in 768K ROMs is not currently
supported - if you have such a ROM please let me know.

Currently the core builds for the following platforms:
Turbo Chameleon 64
MIST
Altera DE1 (Sound currently disabled to make space for the OSD CPU - since
otherwise we run out of block RAM.

Currently only one joypad is supported.  As well as native joypad support
the OSD firmware provides joypad emulation via the keyboard, using the
cursor keys, right ctrl, and AltGr keys.
The Run and Select buttons are Enter and Right Shift, respectively.

Ultimately I will try and add multitap support.

Original README follows:

================================================================================
fpgapce - a NEC PC-Engine/Turbografx-16 clone in a FPGA.
Copyright (c) 2011-2013 Gregory Estrade (greg@torlus.com)
All rights reserved

fpgapce is an attempt to clone the NEC PC-Engine/Turbografx-16 console in a FPGA.
It is currently advanced enough to run many games.

================================================================================
In order to run this project you will need :
- A Terasic/Altera DE1 board.
- A VGA monitor.
- A headset, if you want to enjoy sound.
- DE1 CD-ROM contents. (http://www.terasic.com/downloads/cd-rom/de1/)
- Altera Quartus II 9.1 Web Edition.
- (optional) ModelSim-Altera 6.5b Starter Edition.

First, the FPGA EEPROM should be programmed with the demonstration design
"DE1_USB_API.sof". It should be the case if you've never re-programmed it.
That will allow you to use the "DE1 Control Panel" software.

Power on your DE1 board, make it sure it is connected thru USB to your computer.
Run the "DE1_Control_Panel.exe" program.
Click on "Open", select "Open USB Port 0".
Select the "FLASH" tab, and click on "Chip Erase".
Check "File Length", then click on "Write a File to FLASH".
Choose a PC-Engine ROM.
Once the write operation is done, close the "DE1 Control Panel".

If you downloaded the programming file, run the Quartus Programmer
("quartus_pgmw.exe" located in "<altera root directory>\91\quartus\bin").
Select the "pce_top.sof" file, click on "Start", and you're done!

Notes : 
- Be sure to always perform a "Chip Erase" before programming a new ROM.
- I don't know if it's due to my own setup, but I've found that the flash write
  operation is not very reliable, as I often get a byte off when I try to read
  back the flash. For some games it doesn't matter (if you're lucky enough, and
  that the write error occurs in a data section, and not a code section).
  Some games however perform a self-consistency check, and won't run at all.
  Only workaround so far : erase and re-program the flash until it succeeds.

ROMs are cartridge memory dumps, that may include a 512-bytes header.
There is also a special memory mapping for ROMs that have a size of 768 Kb.
So I've set up some switches to cope with these different configurations :
- SW1 : header present or not (usually, ROMs do have this header, so set it to "1").
- SW2 : set it to "1" if your ROM is 768 Kb.
- SW3 : set it to "1" if you're dealing with a TGFX ROM instead of a PCE ROM.
  NEC created a very basic region-lockout by swapping data bits on the cartridge
  and cartridge connector on US (TGFX-16) consoles.
  So, for the (very few) ROMs that have been dumped off a US cartridge, set it to "1".  
  If unsure, set it to "0".

A 4-button pad is mapped to the board's switches and buttons.
Here is a description of the controls :
- KEY0 : Button I
- KEY1 : Button II
- KEY2 : Run
- KEY3 : Select
- SW9 : Up
- SW8 : Down
- SW7 : Left
- SW6 : Right
SW0 performs a Hard-Reset operation.

================================================================================
Gregory Estrade (Torlus) - 2012/02/02
greg@torlus.com
