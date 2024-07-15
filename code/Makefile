SERIAL_PORT ?= /dev/tty.usbmodem14101

%.bin: %.s
	vasm6502_oldstyle -Fbin -wdc02 -L $*.lst -o $@ -dotdir $<

%.hex: %.s
	vasm6502_oldstyle -Fihex -wdc02 -L $*.lst -o $@ -dotdir $<

%.external: %.hex
	python3 ../tools/upload.py $< external

%.auto: %.hex
	python3 ../tools/upload.py $< auto

%.manual: %.hex
	python3 ../tools/upload.py $< manual

%.rom: %.bin
	minipro -w $< -p 28C256

msg.bin: msg.s blink.s lcd.s
msg.hex: msg.s blink.s lcd.s

term:
	picocom $(SERIAL_PORT) -q --omap delbs -b 115200

clean:
	rm -f *.lst *.bin *.hex
