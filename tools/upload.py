#!/usr/bin/env python

"""Upload code to BE6502.

Run as:

    $ python upload.py mycode.bin auto   (or manual/external clock)
"""

import serial
import time
import sys
import os

port = os.environ.get("SERIAL_PORT", "/dev/tty.usbmodem14101")

ser = serial.Serial(port, 115200, timeout=0.1)
time.sleep(1.4)

def wr_rd(s):
    # Write a line to the serial port and print out a line from it.
    if s: ser.write((s + "\r").encode("ascii"))
    print(ser.read(1024).decode("ascii"), end="")

# ignore initial msg
wr_rd("")

# do("ansi off")
wr_rd("clock manual")
wr_rd("control")

with open(sys.argv[1]) as f:
    for line in f:
        wr_rd(line)

wr_rd("exit")

if sys.argv[2] == "auto":
    wr_rd("clock auto")
    wr_rd("clock 2")
elif sys.argv[2] == "manual":
    wr_rd("clock manual")
elif sys.argv[2] == "external":
    wr_rd("clock external")
else:
    raise Exception("Need to provide one of: auto, manual, external")

wr_rd("reset")
os.system(f"picocom {port} -q --omap delbs -b 115200")