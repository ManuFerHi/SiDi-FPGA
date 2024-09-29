BBC Micro for MiSTica / SiDi
============================

This is a port of Mike Sterlings great [BBC Micro on FPGA](http://www.mike-stirling.com/retro-fpga/bbc-micro-on-an-fpga/) with major changes by Stephen Leary and David Banks. 

SD card
-------

This core includes os1.2, basic2 and MMFS. It implements a
MMBEEB (SD card to user port) compatible interface
and can use it to load software from SD card. The limitations of the original
MMFS still apply and e.g. the SD card needs to be FAT16/FAT32 (without partitions)
formatted and the 'beeb.mmb' file needs to be written first to the SD card before anything else.
Also the size limit of the file system is 8 GB. However you can copy 'beeb.mmb' to the SD card, rename
it to bbc.vhd and MMFS will use it without the need of a FAT filesystem.

One such file can be found at [here](http://stardot.org.uk/files/mmb/higgy_mmbeeb-v1.0.zip).

If using the beeb.mmb file, once the BBC is booted type "*MENU" to start
the menu. You can also set it to start automatically by setting "Auto boot"
in the OSD.

This core supports VGA and RGB 15khz. Use the setting in mist.ini
or hold down the middle button to switch between the two modes.

Sideways ROM/RAM
----------------

A 16k ROM image can be uploaded to Sideways ROM slot 10 using the OSD. 
An OSD option allows to map BASIC and SuperMMC from slots 12 and 14 (hi)
down to slots 0 and 2 (low) giving the uploaded ROM and the RAM banks 
priorty over SuperMMC and BASIC.

Four RAM banks are present in slots 4,5,6 and 7.

Keyboard
--------

The BREAK key maps to the PrintScr key. BREAK is effectively the reset button.

Joysticks
---------

Two analog joysticks are supported on ADC channels 1-4. Digital joysticks
are mapped to max/min values.

Floppy images (Master mode only)
--------------------------------

A WD1770 compatible FDC is available in Master mode. It supports the SSD (single side) and DSD (double side) image formats. These images are 10 sectors/track (FM) images. MFM currently not supported. These images are usually made for the DFS filing system, thus to work with them, changing from the default MMFS to DFS is needed:

*CO. FILE 9

This command selects ROM slot 9 for the default filing system. It can be saved permanently via the "Save CMOS" option in the OSD. After a reset, DFS will be the default. The easiest way to boot from floppy is to set Auto boot to ON, and press reset (or simply hold SHIFT and press PrtScrn).

Games
-----
New to the BBC? Here's a selection of the best games to try: Arcadians, Chuckie Egg, Elite, Monsters, Planetoid, Snapper.
