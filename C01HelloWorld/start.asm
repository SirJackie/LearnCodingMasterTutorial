; Set the Data Segment to 0xb800 (Color Text Buffer)
mov ax, 0xb800  ; 3 Byte
mov ds, ax      ; 2 Byte

; See how long the program till now is
; And print it out
; This is a great example which shows how $, $$ and add command works
; --------------------------------------------------------------------
; $ : Memory Address of this line of code
; $$ : Memory Address of the first line of code
; $ - $$ : The length of the code until now
; add a, b : Add a and b, The result will be stored into a
mov ax, $ - $$
mov bl, 0x30
mov cl, 0x30
add bl, ah
add cl, al
mov byte [0x50], bl
mov byte [0x52], cl

; A Hello World from Sir Jackie
; Every one loves to "Hello World", Jackie's the same haha
mov byte [0x00],'H'
mov byte [0x02],'e'
mov byte [0x04],'l'
mov byte [0x06],'l'
mov byte [0x08],'o'
mov byte [0x0a],' '
mov byte [0x0c],'W'
mov byte [0x0e],'o'
mov byte [0x10],'r'
mov byte [0x12],'l'
mov byte [0x14],'d'
mov byte [0x16],''
mov byte [0x18],'f'
mov byte [0x1a],'r'
mov byte [0x1c],'o'
mov byte [0x1e],'m'
mov byte [0x20],' '
mov byte [0x22],'S'
mov byte [0x24],'i'
mov byte [0x26],'r'
mov byte [0x28],' '
mov byte [0x2a],'J'
mov byte [0x2c],'a'
mov byte [0x2e],'c'
mov byte [0x30],'k'
mov byte [0x32],'i'
mov byte [0x34],'e'
mov byte [0x36],' '
mov byte [0x38],'u'
mov byte [0x3a],'s'
mov byte [0x3c],'i'
mov byte [0x3e],'n'
mov byte [0x40],'g'
mov byte [0x42],' '
mov byte [0x44],'N'
mov byte [0x46],'A'
mov byte [0x48],'S'
mov byte [0x4a],'M'
mov byte [0x4c],'!'

; Make a infinity loop
jmp $

; Write zeros at the end of the program
times 510-($-$$) db 0

; Write 55 AA as the end of the MBR Sector
db 0x55,0xaa

; The END
; Total size after compiling should be 512 Byte
