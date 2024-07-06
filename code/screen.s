; ******************************************************
; Show text on LED screen
; ******************************************************

	.org	$8000

start
	jsr	lcdinit

	ldx	#0
.msgloop
	lda	msgtext,x
	beq	loop
	jsr	lcdchar
	inx
	bra	.msgloop
loop
	jmp	loop

msgtext
	.asciiz	"HI JOEL :-)"

	.include lcd.s

	.org	$fffc
	.word	start
	.word	$0000

