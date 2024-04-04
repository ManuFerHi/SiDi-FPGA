# PC Engine/TurboGrafx-16 core

This is a MiST/SiDi port of [TurboGrafx16](https://github.com/MiSTer-devel/TurboGrafx16_MiSTer) by srg320.

- [SiDi Binaries](https://github.com/ManuFerHi/SiDi-FPGA/tree/master/Cores/Console/PCE)
- [MiST Binaries](https://github.com/mist-devel/mist-binaries/tree/master/cores/pcengine)
- [Sources](https://github.com/mist-devel/TurboGrafx16_FPGA)

### Features:
- SuperGrafx support
- CD-ROM support
- Saves
- 384K, 768K, Populous and SF2 special ROM mapper support
- Multitap up to 5 controllers (4 reported to work)
- 6 buttons controller support

# Installation #

Copy the `*.rbf` file to the root of the SD card.
You can rename the file to `core.rbf` if you want to load it automatically at startup.

Copy the PCE ROMS to the TGFX16 folder to automatically list them when you select the Load options in the OSD menu. TurboGrafx-16 titles should use .pce file extension, SuperGrafx ROMS have to be .sgx files.

## CD support

Only CUE files with single image file (FILE keyword) are supported!

Some CD-ROM files have split BIN files (such as the archive in the cloud redump files). Combine them with old program "CDmage 1.02.1 Beta 5" (Windows 32bit) to create one BIN file, steps: open CUE, Save and use defaults. 
Or you can use CHDMAN from MAME:

```
chdman createcd -i input.cue -o output.chd
```

After that, CHD files can be converted to the required format:

```
chdman extractcd -i input.chd -o output.cue -ob output.img
```

### Usage

- Load a BIOS (usually syscard3.pce) with the first OSD option (as it would be a normal HuCard). Hint: move and rename the syscard3.pce file to tgfx16.rom in the root directory, and the BIOS will auto-load with the core.
  A BIOS file with .sgx extension will allow the use the CD in SuperGrafx mode.
- Mount the CUE file via the "Mount CD" option
- Optionally mount a SAV file (size: 2KB - 2048 byte). Before the first use, it must be formatted from the BIOS menu. Use the "Write Save RAM" option to
  save its contents to the SD Card.
  Generate SAV files with the following Windows command (BIN in this is for the CD-ROM titles only):

```
  `for %f in (*.bin) do fsutil file createnew "%~nf.sav" 2048`
```

- Start the game with RUN

## Contributions

- [Original core by Torlus](https://github.com/Torlus/fpgapce)
- [Alastair Robinson's updates](https://github.com/robinsonb5/fpgapce)
- [MiSTer improvements, CPU, VDP rewrite and CD support by srg320](https://github.com/MiSTer-devel/TurboGrafx16_MiSTer)
- MiST port by Gyurco
- Turbo Chameleon port, new SDRAM controller by robinsonb5

## Notes ##

  * You can switch TV/VGA mode with pressing the middle MiST button for 2 seconds, or with the scandoubler_disable setting in mist.ini.
  * YPbPr output can be activated via the ypbpr option in mist.ini, or by pressing the middle and right buttons on MiST simultaneously.

## Gameplay videos of older core versions

- [Devil's Crush](http://www.youtube.com/watch?feature=player_embedded&v=eqkAILkPe5I)
- [Super Star Soldier](http://www.youtube.com/watch?feature=player_embedded&v=4l58HPSzfjQ)
- [Parodius](http://www.youtube.com/watch?feature=player_embedded&v=CzeHW-gyMSI)
- [R-Type](http://www.youtube.com/watch?feature=player_embedded&v=OvreesBg8AE)
