bits 16
org 0x7c00
boot:
	mov si, hello       ; show welcome msg
	mov ah,0x0e         ; Write character in titty mode

    .loop:              ; this is our loop
        lodsb
        or al, al       ;|
        jz .input        ;| jump to input if al is zero

        cmp ah, 'a'      ;|
        je .opt1        ;|

        cmp ah, 'b'
        je .opt2

        int 0x10
        jmp .loop

    .opt1:
        mov si, opt1       ; show msg
	    mov ah,0x0e         ; Write character in titty mode

    .opt2:
        mov si, opt2        ; show msg
	    mov ah,0x0e         ; Write character in titty mode

    .input:             ;|
        mov ah, 00h     ;|
        int 16h         ;| Getting input uhh
        jmp .loop       ; Jumping back to loop

halt:               ;|
	cli             ;|
	hlt             ;| Halting program

hello: 
	db "Welcome to XxX_0per4ting_syst3m_XxX",13,10,0

opt1:
    db "you press a",13,10,0

opt2:
    db "b breh",13,10,0

times 510 - ($-$$) db 0
dw 0xaa55
