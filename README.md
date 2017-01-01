# efergy-e2-classic
This project is to create alternative firmware for the e2 classic energy monitor to allow usb output of raw data and improved functionality.

The hardware is:
PIC16f1939 - Microcontroller
HT1620 - LCD driver
A72C01AUF - Radio Receiver
SIL 2104 F1XSH 1317 - USB to Serial
REF4066BT - Bilateral Switch (used between the USB and microcontroller)
24LC512 - 512 KB EEPROM

The EEPROM is connected to RC4/RC5.
The USB is connected to the Bilateral Switch to TX/RX (RC6/RC7) pins and RC2 for the Switch Control.
RD0-6 are for switch inputs (TODO: expand)
RE0/RA4/RA5 are connected to the LCD controller
RV0/RB1 are connected to the Radio
RA1/RA2/RC3 are outputs for led's (TODO: expand and check)

So far, the firmware was dumped from the microcontroller, and disassembled.
Presently going through the assembly and updating names.
