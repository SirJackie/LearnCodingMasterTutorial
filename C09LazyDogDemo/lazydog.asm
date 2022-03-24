section code align=16 vstart=0x7c00

Main:
    mov si, MyString
    xor di, di
    call PrintString
    jmp End

PrintString:
    ; si: Source String Index
    ; di: Destination Screen Index

    .start:
    ; Set Source (String)
    ; mov ax, 0x0000
    ; mov ds, ax

    ; Set Destination (Screen)
    mov ax, 0xb800
    mov es, ax

    ; Set Attribute Char
    mov bh, 0x07

    ; Set Looping Times
    mov cx, 0xffff

    .printchar:
    ; Print a Char
    mov bl, [ds:si]
    mov [es:di], bl
    inc di
    mov [es:di], bh
    inc di

    ; Move to the Next Char
    inc si

    ; If reaches the end of the string, then return
    or byte [ds:si], 0x00
    jz .return

    ; Else, Continue Looping
    loop .printchar

    .return:
    ret

End:
    jmp $
    times 510 - ($ - $$) db 0
    db 0x55, 0xaa

MyString db 'A quick brown fox jump over the lazy dog.'
         db 0
