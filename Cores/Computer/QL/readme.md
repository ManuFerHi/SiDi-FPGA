Sinclair QL core for the MIST / SiDi board
===================================

This core needs a QL rom image on SD card named ql.rom in the SD cards
root directory. It's known to work with Minerva ROM 1.98 as well as the
original js.rom. Other ROMs may work as well. The ROM size must be exaclty
49152 bytes. Minerva and other roms are available as a free download from 
http://www.dilwyn.me.uk/qlrom/.

It is possible to add another 16k of extension ROM. The resulting size
of the ROM image should then be 65536 bytes. E.g. the Toolkit-2 ROM is
available for download at http://www.dilwyn.me.uk/pe. The necessary
combination of both ready-to-use is available 
[here](https://github.com/mist-devel/mist-binaries/raw/master/cores/ql/ql.rom).

This core honours the scandoubler_disable setting in the mist.ini and can
be used with the VGA to SCART cable.

The core implements the complete 8049 IPC controller and thus fully
supports all keybaord monitoring modes as well as joysticks and audio.

Files can be loaded from microdrive images stored in MDV files in QLAY
format. Thee files must be exactly 174930 bytes in size. Examples can
be found in http://web.inter.nl.net/hcc/A.Jaw.Venema/psion.zip as well as
in the [examples](https://github.com/mist-devel/mist-binaries/raw/master/cores/ql/examples) directory.

If a matching [ql.rom](https://github.com/mist-devel/mist-binaries/raw/master/cores/ql/minerva+qlsd_ql.rom) is being used the built-in [QL-SD](http://www.dilwyn.me.uk/qlsd/index.html) allows to directly access a huge image file stored
on SD card.


