; ******************************************************
; Set vectors for ROM to call RAM
; ******************************************************

; Since it's a pain to reprogram the ROM, most of the time, it's easier to
; put code in RAM. Since the 6502 looks for the vectors for nmi/reset/irq in
; ROM, though, this file needs to be burned in the ROM.

; This assumes the ROM is 32k and starts at $8000 --- the 6502 needs to find
; the vectors at $FFFA

	.org	$8000

; This will leave 32k-6 bytes at $00 and then sets these

	.org	$fffa
vector_nmi
	.word   $3000  ; NMI fn could be at $3000
vector_reset
	.word	$0200  ; after reset, start at $0200 (lowest RAM)
vector_irq
	.word	$3800  ; IRQ fn could be at $3800

