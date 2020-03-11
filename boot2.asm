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
    je opt1        
    cmp al, 50
    je opt2

    jmp input

halt:               ;|
	cli             ;|
	hlt             ;| Halting program

hello: 
	db "Welcome to XxX_0per4ting_syst3m_XxX press 1 or 2",13,10,0

opt1:
    mov si, pressed1
    mov ah,0x0e
    jmp print

pressed1:
    db "U have press the button 1, son",13,10,0

opt2:
    mov si, pressed2
    mov ah,0x0e
    jmp print

pressed2:
    db "You pressed 2, baby boo",13,10,0

times 510 - ($-$$) db 0
dw 0xaa55
