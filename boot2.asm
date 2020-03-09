bits 16
org 0x7c00
boot:
	mov si, hello
	mov ah,0x0e
    mov ah, 00h
    int 16h
    cmp al, 49
    je .opt1
    cmp al, 50
    je .opt2

.loop:
	lodsb
	or al, al
	jz halt
	int 0x10
	jmp .loop

.opt1:
    db "you press 1"
    jmp .loop
 
.opt2:
    db "2 breh"
    jmp .loop

halt:
	cli
	hlt
hello: 
	db "Welcome to TempleOS",13,10

times 510 - ($-$$) db 0
dw 0xaa55
