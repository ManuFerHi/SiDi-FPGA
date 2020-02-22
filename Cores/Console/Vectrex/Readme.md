GCE(General Consumer Electronics) - Vectrex For Mistica / SiDi FPGA

Up to 32kb Roms supported

Controls:
 Movement: 	Joystick
 Buttons: 	1-4 on Joystick Fire Buttons

CPU: It's possible to choose between two CPUs:
  - MC6809 - Greg Miller's cycle exact 6809
  - CPU09  - John Kent's 6809 compatible CPU

Speech extension can clash with the controls in some games,
turn off Speech if it happens.







---------------------------------------------------------------------------------
-- DE10_lite Top level for vectrex by Dar (darfpga@aol.fr) (27/12/2017)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Use vectrex_de10_lite.sdc to compile (Timequest constraints)
-- /!\
-- Don't forget to set device configuration mode with memory initialization 
--  (Assignments/Device/Pin options/Configuration mode)
---------------------------------------------------------------------------------
-- TODO :
--   sligt tune of characters drawings (too wide)
--   tune hblank to avoid persistance artifact on first 4 pixels of a line
---------------------------------------------------------------------------------
--
-- Main features :
--  PS2 keyboard input @gpio pins 35/34 (beware voltage translation/protection) 
--  Audio pwm output   @gpio pins 1/3 (beware voltage translation/protection) 
--
--  Uses 1 pll for 25/24MHz and 12.5/12MHz generation from 50MHz
--
--  Horizontal/vertical display selection at compilation 
--  3 or no intensity level selection at compilation
--
--  No external ram
--  FPGA ram usage as low as :
--
--		  336.000b ( 42Ko) without   cartridge, vertical display,   no intensity level (minestrom)
--		  402.000b ( 50Ko) with  8Ko cartridge, vertical display,   no intensity level
--	 	  599.000b ( 74ko) with 32Ko cartridge, vertical display,   no intensity level
--	 	  664.000b ( 82ko) with  8Ko cartridge, horizontal display, no intensity level
--		1.188.000b (146ko) with  8Ko cartridge, horizontal display, 3 intensity level

--  Tested cartridge:
--
--		berzerk          ( 4ko)
--		ripoff           ( 4ko)
--		scramble         ( 4ko)
--		spacewar         ( 4ko)
--		startrek         ( 4ko)
--		pole position    ( 8ko)
--		spike            ( 8ko)
--		webwars          ( 8ko)
--		frogger          (16Ko)
--		vecmania1        (32ko)
--		war of the robot (21ko)
--
-- Board key :
--   0 : reset game
--
-- Keyboard players inputs :
--
--   F3 : button
--   F2 : button
--   F1 : button 
--   SPACE       : button
--   RIGHT arrow : joystick right
--   LEFT  arrow : joystick  left
--   UP    arrow : joystick  up 
--   DOWN  arrow : joystick  down
--
-- Other details : see vectrex.vhd
-- For USB inputs and SGT5000 audio output see my other project: xevious_de10_lite
---------------------------------------------------------------------------------
-- Use tool\vectrex_unzip\make_vectrex_proms.bat to build vhdl rom files
--
--make_vhdl_prom 	exec_rom.bin vectrex_exec_prom.vhd (always needed)
--
--make_vhdl_prom 	scramble.bin vectrex_scramble_prom.vhd
--make_vhdl_prom 	berzerk.bin vectrex_berzerk_prom.vhd
--make_vhdl_prom 	frogger.bin vectrex_frogger_prom.vhd
--make_vhdl_prom 	spacewar.bin vectrex_spacewar_prom.vhd
--make_vhdl_prom 	polepos.bin vectrex_polepos_prom.vhd
--make_vhdl_prom 	ripoff.bin vectrex_ripoff_prom.vhd
--make_vhdl_prom 	spike.bin vectrex_spike_prom.vhd
--make_vhdl_prom 	startrek.bin vectrex_startrek_prom.vhd
--make_vhdl_prom 	vecmania1.bin vectrex_vecmania1_prom.vhd
--make_vhdl_prom 	webwars.bin vectrex_webwars_prom.vhd
--make_vhdl_prom 	wotr.bin vectrex_wotr_prom.vhd
---------------------------------------------------------------------------------
