# Next186 SoC PC

This is a MiST / SiDi port of the [Next186 SoC](https://opencores.org/projects/next186_soc_pc) by (C) Nicolae Dumitrache.

Modifications from the original core:

- Added a standard MiST BIOS loader, the Next186.ROM will be loaded when the core starts.
- Selectable CPU speed (Maximum, half, third, quarter).
- CPU clock is 50 MHz, SDRAM clock is 100 MHz.
- DSP coprocessor is disabled currently (out of BRAM), MP3 playing is not possible.


# Usage

You'll need an installed MS-DOS on the SD-Card (or on a **Next186.VHD** file),
and the **Next186.ROM** BIOS file next to the **RBF**.

This core requires at least firmware version **210715**.


# Interfacing with mt32-pi

Thanks to MPU emulation the Next186 core can be interfaced with [mt32-pi](https://github.com/dwhinham/mt32-pi) to exploit bare-metal emulation of a Roland MT-32 MIDI sound card using the following (Raspberry Pi) GPIO <-> (SiDi) [serial port connection](https://github.com/dwhinham/mt32-pi/wiki/MIDI-via-RS-232-or-USB-to-serial#real-rs-232-port-vintage-computer-to-raspberry-pi-gpio):

- RPi GPIO pin 6 (GND) <-> SiDi serial GND
- RPi GPIO pin 10 (UART RX) <-> SiDi serial RXD

The baud rate of the mt32-pi GPIO UART must be set as **31250** in the configuration file.

Also, the [mt32-pi-control](https://github.com/gmcn42/mt32-pi-control) utility can be used to manage all mt32-pi features under MS-DOS.


# Source code

- [Original code on opencores.org](https://opencores.org/projects/next186_soc_pc)
- [MiST port](https://github.com/gyurco/Next186)
