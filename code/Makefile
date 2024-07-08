%.bin: %.s
	../tools/vasm6502_oldstyle_macho_x86_64 -Fbin -wdc02 -L $*.lst -o $@ -dotdir $<

%.hex: %.s
	../tools/vasm6502_oldstyle_macho_x86_64 -Fihex -wdc02 -L $*.lst -o $@ -dotdir $<

%.up: %.hex
	python3 ../tools/upload.py $<

msg.s: blink.s lcd.s
blink.s: lcd.s

clean:
	rm -f *.lst *.bin *.hex
