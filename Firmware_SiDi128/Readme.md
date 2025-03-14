For uddate your SiDi128 copy firmware_xxxxxx.upg to root sd card and rename it to firmware.upg, start yor SiDi128 and select in OSD upgrade firmware.

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
