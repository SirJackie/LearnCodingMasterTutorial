section code align=16 vstart=0x7c00

Main:
    ; Set Video RAM
    mov ax, 0xb800
    mov ds, ax

    ; Set Looping Counter, Loop 80 * 25 times
    mov cx, 0x07d0

    ; Set Character
    mov bl, 'A'
    mov bh, 0x07

    ; Create Printing Counter (Set SI=0)
    xor si, si

Loop:
    ; Draw Single Character
    mov [ds:si], bl
    inc si
    mov [ds:si], bh
    inc si

    ; If the Looping Counter equals 0, End the Program
    or cx, 0x00
    jz End

    ; Else, Continue to Draw
    loop Loop

End:
    jmp $
    times 510-($-$$) db 0
    db 0x55, 0xaa
