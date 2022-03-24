; Define Constants
MaximunLoopingTime equ 0xffff
DefaultAttributeChar equ 0x07
VideoRAM equ 0xb800
BootLoader equ 0x7c00

; Start a Section
section code align=16 vstart=BootLoader

Main:

    ; ; ; Question 1:
    ; ; ; Why it doesn't work if I set ds as 0x7c00
    ; ; ; Shouldn't ds be 0x7c00, where the program loads?
    ; ; ; Since the vstart is 0x7c00???
    
    ; ; Set Parameter ds
    ; mov ax, BootLoader
    ; mov ds, ax

    ; Set Parameter si
    mov si, MyString

    ; Set Parameter di = 0x00
    mov di, 0x00A0

    ; Call the Function
    call PrintString

    ; Jump to the Infinite Loop
    jmp End

    ; ; ; Question 2:
    ; ; ; PrintString seems to be one-time usable
    ; ; ; It can't be reused like this:

    ; Print Another Line of String
    mov si, MyString
    mov di, 0x0000
    call PrintString
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
    mov ax, VideoRAM
    mov es, ax
    ; Set Attribute Char
    mov bh, DefaultAttributeChar
    ; Set Looping Times
    mov cx, MaximunLoopingTime

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
