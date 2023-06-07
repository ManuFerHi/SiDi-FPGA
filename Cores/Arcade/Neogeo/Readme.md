# SNK Neo Geo core for SiDi

![Neo Geo rounded logo](https://live.staticflickr.com/65535/52958482059_69a299d0a8_o.png)

This is a port of the [NeoGeo FPGA implementation](https://github.com/MiSTer-devel/NeoGeo_MiSTer) by [Furrtek](https://www.patreon.com/furrtek/posts) and [Gyurco](https://github.com/gyurco/NeoGeo_MiSTer/tree/mist) for the SiDi FPGA platform.

## Limitations
The original Neo Geo system has big RAM/ROM memories, which don't fit into the BRAM of the SiDi's FPGA. A new SDRAM controller was written, which can
read two 32 bit words simultaneously in just 8 cycles using bank interleaving, and running at 96MHz. 

The limitation of ROM sizes for SiDi (32 MiB) is ~6 MiB PROMS and 24 MiB CROM+VROMs (in any size combination)



## Usage

Internal ROMs (System ROM, SFIX, LO ROM and SM1 ROM) can be created from MAME's neogeo.zip with the help of the [MRA files](https://github.com/mist-devel/mist-binaries/tree/master/cores/neogeo/bios).

TerraOnion .NEO file format was choosen as the supported cart format, as it conveniently merges all the various ROMs in one file. The following utilities can be used to create such files:

[Original NeoBuilder tool](https://wiki.terraonion.com/index.php/Neobuilder_Guide)

[MAME to .neo conversion tool](https://github.com/city41/neosdconv)

[Darksoft to .neo conversion tool](https://gitlab.com/loic.petit/darksoft-to-neosd/)

Note: Core doesn't support encrypted ROMs. Make sure the ROM has no encrypted parts before use. MAME ROM pack includes many encrypted ROMs so it's not recommended for inexperienced users. Using the .neo conversion tool with a MAME ROM set will result in some ROMs still being encrypted. There is an alternate .neo conversion tool for the Darksoft ROM set that will give you a fully decrypted set.
