bits 16
org 0x7c00
boot:
	mov si, hello
	mov ah,0x0e
.loop:
	lodsb
	or al, al
	jz halt
	int 0x10
	jmp .loop
halt:
	cli
	hlt
hello: 
	db "Me and the boys rootin' tootin' and  bootin in assembly a niffos",0

times 510 - ($-$$) db 0
dw 0xaa55
