mov ax, 0x0001
mov bx, 0x0002
add ax, bx

mov ax, 0xf000
mov bx, 0x1000
add ax, bx

mov cx, 0x0003
mov dx, 0x0002
sub cx, dx

mov cx, 0x0001
mov dx, 0x0002
sub cx, dx

loop: jmp loop
times 510-($-$$) db 0
db 0x55, 0xaa
