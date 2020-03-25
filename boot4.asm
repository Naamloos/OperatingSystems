mov ah, 0x2    ;read sectors
mov al, 1      ;sectors to read
mov ch, 0      ;cylinder idx
mov dh, 0      ;head idx
mov cl, 2      ;sector idx
mov dl, [disk] ;disk idx
mov bx, copy_target;target pointer
int 0x13

times 510 - ($-$$) db 0
dw 0xaa55
copy_target:
bits 32
    hello: db "Hello more than 512 bytes world!!",0
boot2:
    mov esi,hello
    mov ebx,0xb8000
.loop:
    lodsb
    or al,al
    jz halt
    or eax,0x0F00
    mov word [ebx], ax
    add ebx,2
    jmp .loop
halt:
    cli
    hlt
times 1024 - ($-$$) db 0