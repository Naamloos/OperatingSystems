bits 16
org 0x7c00
boot:
	mov si, hello       ; show welcome msg
	mov ah,0x0e         ; Write character in titty mode

    .loop:              ; this is our loop
        lodsb
        or al, al       ;|
        jz input        ;| jump to input if al is zero

        cmp al, 49      ;|
        je .opt1        ;|

        cmp al, 50
        je .opt2

        int 0x10
        jmp .loop

    .opt1:
        db "you press 1",13,10
        jmp .loop
    
    .opt2:
        db "2 breh",13,10
        jmp .loop

input:              ;|
    mov ah, 00h     ;|
    int 16h         ;| Getting input uhh
    jmp .loop       ; Jumping back to loop

halt:               ;|
	cli             ;|
	hlt             ;| Halting program

hello: 
	db "Welcome to TempleOS",13,10

times 510 - ($-$$) db 0
dw 0xaa55
