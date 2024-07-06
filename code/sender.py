#!/usr/bin/env python

import serial
import time
import sys

ser = serial.Serial("/dev/tty.usbmodem14101", 115200, timeout=0.1)
time.sleep(0.8)

def wr_rd(s):
    # Write a line to the serial port and print out a line from it.
    if s: ser.write((s + "\r\n").encode("ascii"))
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
wr_rd("clock auto")
wr_rd("clock 256")
wr_rd("reset")
