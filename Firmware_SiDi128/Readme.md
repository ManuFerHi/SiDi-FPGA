For update your SiDi128 copy firmware_xxxxxx.upg to root sd card and rename it to firmware.upg, start yor SiDi128 and select in OSD upgrade firmware.

## firmware_250907
------------------
- CFG_FILE_N option to arc files for Minimig (Eugene Lozovoy)
- Custom file processor framework (Manuel Teira)
- MMC DMA Read/Write fix for unaligned buffers
- Handle Ultimate2-style IDX files for C64 TAP files

## firmware_250604
------------------
- Reconfigurable DB9 mapping in OSD
- usb: fix possible hang during parsing malformed device descriptor
- Fix extension handling in file selection (affects Gameboy core)
- Add 68EC020 to Minimig CPU types
- Add IMG extension to hardfile selection in Atari ST cores
- Fix ATAPI CDROM for non-Minimig use (Next168 mainly)

## firmware_250314
------------------
- Support prof'I'le strings in cores
- Allow selecting IDE hardfiles from the OSD

## Firmware 241104
------------------
- two new modes for amiga_mod_keys (by robinsonb5)
- USB HID fix (mainly for some mice)
- XML parser for ZX81 CHR and COL files

## Firmware 240922
------------------
- Use QSPI on Minimig for CDROM data transfer
- Load boot art files from the current directory for Minimig
- USB/HID fixes by Eugene Lozovoy (UzixLS)
- Detect ROM type for SNES carts

## Firmware 240505
------------------
- Fix PSC CD TOC sent to core (Wipeout, CD audio in some games)
- Increase the max. supported number of HD file fragments to 2048 for indexing
- Fallback to root directory when RBFNAME from ARC file is not found
