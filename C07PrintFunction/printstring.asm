section code align=16 vstart=0x7c00

Main:
    ; ; ; A question here:
    ; ; ; Why it doesn't work if I set ds as 0x7c00
    ; ; ; Shouldn't ds be 0x7c00, where the program loads?
    ; ; ; Since the vstart is 0x7c00???
    ; ; Set Parameter ds
    ; mov ax, 0x7c00
    ; mov ds, ax

    ; Set Parameter si
    mov si, MyString

    ; Set Parameter di = 0x00
    xor di, di

    ; Call the Function
    call PrintString

    ; Jump to the Infinite Loop
    jmp End

PrintString:
    ; Require Parameters:
    ; (not required) ds: Data Segment where the string stores
    ; si: Source Index of the string
    ; di: Destination Index, where you gonna draw string on the screen

    ; Return Value:
    ; none

    .setup:
    ; Set Video RAM
    mov ax, 0xb800
    mov es, ax
    ; Set Attribute Char
    mov bh, 0x07
    ; Set Looping Times
    mov cx, 0xffff

    .printchar:
    ; Read From Source Index(SI)
    mov bl, [ds:si]
    inc si
    ; Write To Destination Index(DI)
    mov [es:di], bl
    inc di
    ; Write Attribute Char
    mov [es:di], bh
    inc di
    ; Is the next char 0x00?
    or bl, 0x00
    ; If it is (ZF==0), return
    jz .return
    ; Else, continue loop in order to print chars
    loop .printchar

    .return:
    ret

MyString db 'Hello, I am SirJackie!'
         db 0x00

End:
    jmp $
    times 510-($-$$) db 0
    db 0x55, 0xaa
