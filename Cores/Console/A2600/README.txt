Port of the A2601 FPGA implementation for the MiST
---------------------------------------------------------------------------------

Buttons:
- F9, Start button (Win key with MiST joystick emu)    -> Start
- F10, Select button (Alt key with MiST joystick emu)  -> Select
- F12                                                  -> OSD

OSD
- Select ROMs from the sd card (needs extension .a26 or .bin)
- Special extensions (.e0, .3f, .fe, fa, cv, e7) allows to force a specific mapper
- P2 extension for Pitfall II Lost Caverns allows to use the DPC chip
- 'S' for the 3rd letter of the extension, or the Load SuperChip item allows
  to use SuperChip games (see below)
- Switch between NTSC/PAL and color/b&w
- Select difficulty for left and right

Current limitations:
- no support for DPC+, SaveKey and other custom EPROM/RAM/bank switching solutions
  on carts

Mapper support:
- F4, F6, F8 - standard Atari mappers, autodetected by ROM size
- E0 - Parker Bros. mapper, need .E0 file extension
- 3F - Used for Tigervision 8K ROMs, need .3F file extension
- FE - Activision mapper, used in Robot Tank and Decathlon, use .FE file extension
- FA - CBS RAM Plus titles, use .FA file extension
- CV - Commavid titles, use .CV file extension
- P2 - Pitfall II Lost Caverns (DPC chip), use .P2 extension
- E7 - M-Networks mapper (Bump'n'Jump, Burgertime), use .E7 extension

Some titles use an extra 128 byte RAM (called SuperChip). Unfortunately it cannot be
autodected easily, so use the Load SuperChip OSD option to load these titles, or set
the 3rd part of the file extension to 's'. E.g. Dig Dug is a game which requires
SuperChip, rename it to digdug.f6s, and it'll work with the normal Load OSD item.

Supports mist.ini scandoubler_disable for RGB 15khz, or you can hold the middle MiST
button to switch between modes. ypbpr=1 in mist.ini also honored.

All MiST related files including the Quartus project files are in the 'mist' subdirectory.

Homepage: http://ws0.org/tag/ma2601/

Original readme below :)




Port of the A2601 FPGA implementation for the Turbo Chameleon
---------------------------------------------------------------------------------

The ROM cartridge is the GPL licensed game Hunchy, see
http://www.atariage.com/forums/topic/67953-hunchy-my-first-2600-homebrew-game/
converted to hex file format with 
http://www.ht-lab.com/freeutils/bin2hex/bin2hex.html

Copyright 2012 Frank Buss


Original readme:


A2601: An FPGA-based clone of the Atari 2600 video game console (Release 0.1.0)
---------------------------------------------------------------------------------

This archive contains source code for VHDL implementation and Python script 
utilities for the A2601 video game console project.

VHDL source code provided includes implementation of the 6502(7) CPU, the TIA, 
the 6532 RIOT, additional audio/video/joypad circuitry and bankswitching schemes 
plus additional RAM used by some game cartridges. Test benches are supplied for 
all main components (although they may be slightly out of date).

The 6502 CPU core has been developed from scratch for this project. It contains 
hand-crafted finite state machine and controls that implement all documented 
6502 opcodes. It synthesizes quickly and has good performance in the simulator. 

The TIA implementation digitally synthesizes NTSC composite video signal via a 
lookup table that contains a sequence of values that signifies a sine wave at 
correct phase for each one of the 16 chrominance values selectable in the TIA. 

You should be able to synthesize the A2601 in Xilinx ISE without any major 
problems. No project files are included, but it is best to create these 
yourself, anyway. Two top level entities are provided: One reads cartridge ROM 
data from on-board flash memory, the other stores the ROM data in the FPGA 
built-in SRAM. It is also possible to run A2601 sources in a VHDL simulator. 
Some helper utilities and a test bench are provided for this purpose in the 
A2601/util directory.

For more information, visit the project website at 
<http://retromaster.wordpress.com/a2601>.

All source code and other content found in this archive is subject to GNU 
General Public License Version 3. See the included LICENSE.TXT file for details.

Copyright 2006, 2007, 2010 Retromaster.
