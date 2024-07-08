; Blink LEDs forever

blink
	lda #%11111111
	sta DDRB
	lda #%01010101
	sta PORTB
	jsr delay
	lda #%10101010
	sta PORTB
	jsr delay
	bra blink

; Delay for ~0.33sec

delay           ; ~330000 clk cycles
	ldy #0      ;    [if code doesn't span page boundary]
delay_y
.yloop
	ldx #0      ; ~1287 clk cycles per y
.xloop
	dex         ;
	bne .xloop  ;
	dey         ;
	bne .yloop  ;
	rts

    .include via.s

