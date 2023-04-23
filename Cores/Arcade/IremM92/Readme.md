# Irem M92 core

![IREM M72-M84 logo](https://live.staticflickr.com/65535/52610865422_eef543e3db_o.png)

This is an implementation of Irem [M92 arcade hardware](http://www.system16.com/hardware.php?id=747) for the SiDi FPGA platform.
The Irem M92 core includes numerous games that have not been ported elsewhere, providing a unique and authentic arcade experience.
_Due to the limited available FPGA logic space, part of the music (JT51) and "Major Title 2" (EEPROM) are **not supported** in this release._

Original core by [Martin Donlon](https://github.com/wickerwaka).

MiST port, new SDRAM controller and minor optimizations [Gyorgy Szombathelyi](https://github.com/gyurco) and [Gehstock](https://github.com/Gehstock).

## Resources

- [Original core and documentation by Martin Donlon](https://github.com/MiSTer-devel/Arcade-IremM92_MiSTer)
- [MiST port by Gyorgy Szombathelyi / Gehstock](https://github.com/Gehstock/Mist_FPGA/tree/master/Arcade_MiST/IremM92%20Hardware) - MRA files are in the "meta" folder
- [MRA tool by Sebastien Delestaing / squidrpi](https://github.com/mist-devel/mra-tools-c/tree/master/release)
- [Arcade cores overview](https://github.com/ManuFerHi/SiDi-FPGA/wiki/Arcade-overview)
