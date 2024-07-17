
    ldx #$FF
    txs
stackaccess = $0080
stackbase   = $0000
    ldx #$FF
push16
    lda stackaccess+1       ; first byte (big end)
    sta stackbase,x
    dex
    lda stackaccess         ; second byte (little end)
    sta stackbase,x
    dex
    rts
pop16
                            ; remember, stackbase,x points to the next available slot.
    lda stackbase+1,x       ; the little end
    sta stackaccess
    inx
    lda stackbase+1,x       ; the second byte
    sta stackaccess+1
    inx
    rts

