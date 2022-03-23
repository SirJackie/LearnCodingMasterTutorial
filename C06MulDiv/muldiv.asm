; 8位乘法
mov al, 0xf0
mov ah, 0x02
mul ah
; 结果保存在ah:al，是0x1e0(存不下CF大写)

; 16位乘法
mov ax, 0xf000
mov bx, 0x0002
mul bx
; 结果保存在dx:ax，是0x 0001 e000

; 16位除法
mov ax, 0x0004
mov bl, 0x02
div bl
; 商(0x02)保存在al里，余数(0x00)保存在ah里

; 32位除法
mov dx, 0x0008
mov ax, 0x0006
mov cx, 0x0002
div cx
; 理论上，商(0x40003)保存在ax里，余数(0x00000)保存在dx里
; 实际上，ax存不下会溢出，导致机器陷入死循环
; 所以32位div要注意使用

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
