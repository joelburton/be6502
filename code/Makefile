%.bin: %.s
	../tools/vasm6502_oldstyle_macho_x86_64 -Fbin -c02 -L $*.lst -o $@ -dotdir $<

%.hex: %.s
	../tools/vasm6502_oldstyle_macho_x86_64 -Fihex -c02 -L $*.lst -o $@ -dotdir $<

%.up: %.hex
	python3 ../tools/upload.py $<

clean:
	rm -f *.lst *.bin *.hex
