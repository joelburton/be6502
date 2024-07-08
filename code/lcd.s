	.include via.s

; Basic output to LED

E       =   %10000000
RW      =   %01000000
RS		=	%00100000


; Send a LCD command --- need to run lcdinit before calling this

lcdcmd
	sta	PORTB

	lda	#$0		; clear RS/RW/E bits
	sta	PORTA
	lda	#E		; set enable to send instruction
	sta	PORTA
	lda	#$0		; clear RS/RW/E bits
	sta	PORTA
	rts

; Initialize LCD display --- call once before sending chars

lcdinit
	lda	#%11111111	; set all pins on port b to output
	sta	DDRB
	lda	#%11100000	; set top 3 pins on port a to output
	sta	DDRA

	lda #%00111000 ; fn set: 8-bit, 2-lines, 5x8 chars
	jsr lcdcmd
	lda #%00001100 ; display: on, no cursor, no blink
	jsr lcdcmd
	lda #%00000110 ; cursor: move right, no shift
	jsr lcdcmd
	lda #%00000001 ; home
	jsr lcdcmd

	; fall through to lcddelay, since we need to wait for home cmd to run

; Wait for lcd command to finish --- at our speeds, home is only command
; that takes long enough to need to use thia

lcddelay
	lda	#%00000000	; set all pins on port b to input
	sta	DDRB
	lda #0
	sta PORTA
	lda #(RW | E)   ; send RW command to get busy
	sta	PORTA
.busy
	lda PORTB
	and #%10000000  ; if still busy, keep polling
	bne .busy

	lda	#0	     	; clear RW/RS/E bits
	sta	PORTA
	lda	#%11111111	; set all pins on port b to output
	sta	DDRB
	rts

; lcdchar: output letter on LCD
;   A = ascii char to output

lcdchar
	sta	PORTB

	lda	#RS		; clear RW/E bits, set RS=1
	sta	PORTA
	lda	#(RS | E)	; set enable to send instruction
	sta	PORTA
	lda	#RS		; clear RW/E bits, set RS=1
	sta PORTA

	rts
