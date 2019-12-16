# ZX80/ZX81 for MiSTica / SiDi

Source code > https://github.com/gyurco/ZX8X_MiST
Copy .rbf and ZX8X.rom into sd root.

### Features:
- Based on Grant Searle's [ZX80 page](http://searle.hostei.com/grant/zx80/zx80.html)
- Selectable ZX80/ZX81
- 16k/32k/64k RAM packs
- CHR128 board at $3000
- YM2149 sound chip (ZON X-81 compatible)
- Sinclar type joystick (keys 67890)
- PAL/NTSC timings
- Turbo loading of .o and .p files
- Loading original tapes from the UART RX port

### Tape loading
Selecting an .o (ZX80) or .p (ZX81) file opens the tape. This is indicated by the
user LED. The LOAD command will load it as it would be on a standard tape.
If there's no opened file, the standard ROM load routine is executed, and it
can receive tape data from the UART port.
Reset (ALT-F11 or the Reset OSD option) closes the .o or .p file.

