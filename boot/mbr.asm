bits 16
org 0x7c00

; code
section .text


xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx

; clear screen via set video mode 80x25 text mode
mov ah, 0
mov al, 3h
int 10h

; set cursor position to 0
mov ax, 0200h
mov dx, 0000h
int 10h

; print string via int 10h-13h
mov ax, 1301h
mov bp, welcome_text
mov cx, welcome_text_len 
mov bl, 0Fh
int 10h

; data	
welcome_text db "Hello!", 0x0a, 0x0d, 0
welcome_text_len equ $-welcome_text

; nulls and signature
times 510-($-$$) db 0
dw 0xaa55