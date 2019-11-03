</a>FPGA64 on MIST</h3>
Instructions - Put *.rbf core in to yor SD card root directory.
<p>This is the port of the FPGA64 C64 core by Peter Wendrich distributed with
his kind permission. The later ports are based on Dar FPGAs work and includes
a c1541 floppy implementation.</p>
<h2><a id="user-content-features" class="anchor" aria-hidden="true" href="#features"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Features</h2>
<ul>
<li>Can use .CRT, .PRG and .D64 files</li>
<li>1541 writeable floppy drive</li>
<li>Cartridge support</li>
<li>TAP file loading</li>
<li>Load from real tape using the UART RX pin</li>
<li>Save to real tape through audio output</li>
<li>PAL/NTSC modes</li>
<li>RGB and YPbPr output, optionally with scandoubler (VGA)</li>
<li>6581 and 8580 SID support</li>
<li>1351 Mouse on both controller ports</li>
<li>Stereo SIDs at D420 and D500 addresses</li>
<li>Pseudo stereo mode (SID 6580 on left, 8580 on right, driven by the same data)</li>
<li>4 player interface support (up to 4 joysticks)</li>
<li>UART support (RX and TX on M,B and C pins of the User port)</li>
</ul>
<p>The current core implements a c1541 floppy disk drive. A D64 image can
be mounted from the MISTs OSD. Programs can afterwards be loaded from
floppy using the usual commands (e.g. LOAD "$",8 and LOAD"*",8,1)</p>
<p>Additionally it implements some mechanism called direct memory injection.
This can be triggered via the OSD (which is opened with the F12 key)
allowing to to upload a c64 program binary (.PRG) directly into the
memory of the embedded c64. After injection the program can simply be
started using the basic "run" command. As shown in the beginning of this
video: <a href="https://www.youtube.com/watch?v=tnboiECYXVo" rel="nofollow">https://www.youtube.com/watch?v=tnboiECYXVo</a></p>
<p>The basic+kernal+1541 ROMs can be overriden by putting a new C64.rom to
the root folder of the SD card. The file size can be 16k (basic+kernal)
or 32k (basic+kernal+1541).</p>
<h2><a id="user-content-special-keys" class="anchor" aria-hidden="true" href="#special-keys"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Special keys:</h2>
<ul>
<li>F9  - Pound</li>
<li>F10 - Plus</li>
<li>F11 - Restore/Freeze</li>
<li>CTRL+F11 - Reset</li>
<li>Page Up - Start/Stop tape</li>
</ul>
