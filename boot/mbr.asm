bits 16
org 0x7c00

; code
section .text

xor ax, ax
xor cx, cx

mov ah, 0x0e
mov si, welcome_text 
cld

mov cx, end_data-start_data
sub cx, 2

print_text:
	lodsb
	int 0x10
	loop print_text
jmp $

; data
start_data   db 0	
welcome_text db "Hello!", 0x0a, 0x0d, 0 
end_data     db 0

; nulls and signature
times 510-($-$$) db 0
dw 0xaa55
