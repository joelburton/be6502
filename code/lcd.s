; Basic output to LED

PORTB	=	$6000
PORTA	=	$6001
DDRB    =   $6002
DDRA   	=	$6003

E       =   %10000000
RW      =   %01000000
RS		=	%00100000

	.macro LCDdo
        lda     \1
        jsr     lcdcmd
	.endm

lcdinit
	lda	#%11111111	; set all pins on port b to output
	sta	DDRB
	lda	#%11100000	; set top 3 pins on port a to output
	sta	DDRA

	LCDdo   #%00111000
	LCDdo   #%00001110
	LCDdo   #%00000110
	LCDdo   #%00000001
	rts

lcdcmd
	sta	PORTB

	lda	#$0		; clear RS/RW/E bits
	sta	PORTA
	lda	#E		; set enable to send instruction
	sta	PORTA
	lda	#$0		; clear RS/RW/E bits
	sta	PORTA
	rts

lcdchar
	sta	PORTB

	lda	#RS		; clear RW/E bits, set RS=1
	sta	PORTA
	lda	#(RS | E)	; set enable to send instruction
	sta	PORTA
	lda	#RS		; clear RW/E bits, set RS=1
	sta	PORTA
	rts
