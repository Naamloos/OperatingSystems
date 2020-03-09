bits 16
org 0x7c00
boot:
	mov si, hello       ; show welcome msg
	mov ah,0x0e         ; Write character in titty mode
    jmp print

print:
    .loop:              ; this is our loop
        lodsb
        
        or al, al       ;|
        jz input        ;| jump to input if al is zero
        int 0x10
        jmp .loop

input:             ;|
    mov ah, 00h     ;|
    int 16h         ;| Getting input uhh
    jmp inputcheck

inputcheck:
    cmp al, 49      
    je .opt1        
    cmp al, 50
    je .opt2
    cmp al, 51
    je .opt3

    .opt1:
        mov si, opt1       ; show msg
	    ;mov ah,0x0e         ; Write character in titty mode

    .opt2:
        mov si, opt2        ; show msg
	    ;mov ah,0x0e         ; Write character in titty mode

    jmp print

halt:               ;|
	cli             ;|
	hlt             ;| Halting program

hello: 
	db "Welcome to XxX_0per4ting_syst3m_XxX press 1 or 2",13,10,0

opt1:
    db "you press 1",13,10,0

opt2:
    db "2 breh",13,10,0

times 510 - ($-$$) db 0
dw 0xaa55
