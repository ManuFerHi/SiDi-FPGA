# TSConf for MiST FPGA computer

This is the port of TSConf (advanced ZX Spectrum-compatible platform) to [MiST](https://github.com/mist-devel/mist-board) and [MiST.1010](https://github.com/UzixLS/mist1010-board).

## Features of this port
- VDAC 1
- RTC
- ZiFi (WiFi)
- Tape in/out via UART_RX/UART_TX pins
- MIDI output via UART_TX pin
- TurboSound FM (2x YM2203)
- General Sound 2MB
- SAA1099
- Covox
- SounDrive
- 2x Kempston/Sinclair/Cursor joystick
- Kempston mouse

## TSConf features
- High compatibility with original Pentagon-128 clone
- Advanced video features:
  - Pixel resolutions 360x288, 320x240, 320x200, 256x192
  - Up to 720x288 Hi-res pixel resolution
  - Hardware scrolled graphic planes
  - 256 and 16 indexed colors per pixel
  - Programmable color RAM with RGB555 color space and 256 cells
  - 512 and 256 bytes per line addressing
  - Text mode with loadable font and hardware vertical scroll
  - Up to 256 graphic screens
- Hardware engine for Tiles and Sprites graphics
  - Up to 85 sprites per line
  - Sprites sized from 8x8 to 64x64 pixels
  - Up to 3 sprite planes
  - Up to 2 tile planes with 8x8 pixels tiles
  - Up to 16 palettes for sprites per line
  - Up to 4 palettes for tiles per line for each tile plane
- Z80 Memory addressing enhancements:
  - Programmable RAM page for any 16kB window
- Z80 acceleration features
  - Selectable CPU clock 14MHz, 7MHz and 3,5MHz
  - 512 bytes of zero-wait RAM for 14MHz
  - On-the-fly programmable maskable interrupt position
  - Separate IM2 vectors for different interrupt sources
- Advanced hardware features
  - DRAM-to-Device, Device-to-DRAM and DRAM-to-DRAM DMA Controller

See details in the official git repository: [link](https://github.com/tslabs/zx-evo/blob/master/pentevo/docs/TSconf/tsconf_en.md)


## Installation
Place TSConf.ROM, TSConf.R01 and RBF file from [release](release/) folder into root of SD card.

Also you need to place TSConf.VHD file with  Wild Commander and your games and demos. [There is](release/) example VHD to start with. \
As alternative to VHD you can just unzip Wild Commander into root of your FAT32-formatted SD card.

By default, if everything is done right, Wild Commander will be loaded where you can choose software to start.


## Usage
Original TSConf F12 key (reset) is transferred to F11. \
To enter BASIC press Shift+F11. \
To enter TS-BIOS Setup Utility press Ctrl+F11. By default these setting are volatile and lost after MiST reset. To save them - open OSD menu (with F12 key) and tap "Save NVRAM settings".


## Software
- Wild Commander: https://forum.tslabs.info/viewtopic.php?f=26&t=143
- ZiFi: http://zifi.vtrd.in/
- Demos and games: https://prods.tslabs.info/


## Credits
- TSConf official git repository - [link](https://github.com/tslabs/zx-evo/tree/master)
- TSConf official forum - [link](http://forum.tslabs.info/viewforum.php?f=20&sid=137db6b31f9fb533b908742c2b18284e)
- Original TSConf port for MiSTer (on base of which this port was created) - [link](https://github.com/MiSTer-devel/TSConf_MiSTer)
- T80 - Z80 HDL implementation
- JT12 - Yamaha OPN HDL implementation - [link](https://github.com/jotego/jt12)
- SiDi128 port from Rampa069
