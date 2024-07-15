; ******************************************************
; Show text on LED screen
; ******************************************************

	.org	$0200

	ldx #$FF
	txs

start
	jsr	lcdinit

	ldx	#0
.char
	lda	msgtext,x
	beq	.done
	jsr	lcdchar
	inx
	bra	.char
.done
	jmp blink

; message w/trailing NUL  (lcd is 20 chars, and shows in 0-2-1-3 line order)

msgtext
	.byte	"--------------------"
	.byte	"--------------------"
	.byte	"    Project 6502    "
	.byte	"msg.s"
	.byte	0


	.include lcd.s
	.include blink.s

	.end
