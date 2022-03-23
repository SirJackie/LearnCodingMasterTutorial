mov cx, 0x0064  ; 100
mov ax, 0x0000  ; 0

sum:
    add ax, cx
    loop sum

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
