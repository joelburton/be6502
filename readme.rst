6502 Project
============

A retrocomputing project to build a 6502-based computer from scratch.
From tebl's project.

Tools needed:

- vasm6502_oldstyle: http://sun.hasenbraten.de/vasm/
- PySerial library

Helpful:

- syntax highlight for 65C02 (I use RetroAssembler VSCode extension)

Quickstart:

- `make myfile.bin`: compile myfile.s to raw myfile.bin

- `make myfile.hex`: compile myfile.s to Intel hex format

- `make myfile.{auto,manual,external}`: compile and upload,

  connect via serial and start clock in auto/manual/external

- `make term`: connect via serial

The env var SERIAL_PORT will be used when connecting via serial.
