# Minimig core for Mistica / SiDi
---------------------------------

Instructions - Put .rbf file and minimig.cfg into sd root (if not exist minimig.cfg you can´t save OSD settings).

Minimig need a rom file renamed kick.rom into sd root.

## SiDi128 specific

The expansion port has different input/output pins for UART and MIDI.
By default, the Amiga's serial port sends output data to both UART_TX and MIDI_OUT pins.
Receive data selected by the SW2 switch on the board between UART_RX (Off) and MIDI_IN (On).

[Toccata](https://github.com/ranzbak/fpga-toccata) sound card is added to the core.