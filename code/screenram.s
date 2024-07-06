; ******************************************************
; Show text on LED screen
; ******************************************************

	.org	$0200

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
	.asciiz	"HEY :-)"

	.include lcd.s
