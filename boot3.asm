bits 16
org 0x7c00

boot:
    mov ax, 0x2401
    int 0x15

    mov ax, 0x3
    int 0x10

    lgdt [gdt_pointer]
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax
    jmp CODE_SEG: boot3

gdt_start:
    dq 0x0
gdt_code:
    dw 0xFFFF
    dw 0x0
    dw 0x0
    dw 10010010b
    dw 11001111b
    dw 0x0
gdt_data:
    dw 0xFFFF
    dw 0x0
    dw 0x0
    dw 10010010b
    dw 11001111b
    dw 0x0
gdt_end:

gdt_pointer:
    dw gdt_end - gdt_start
    dd gdt_start
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

bits 32
boot3:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov esi , hello
    mov ebx, 0xb8000
.loop:
    lodsb
    or al,al
    jz halt
    or eax, 0x0100
    mov word [ebx], ax
    add ebx,2
    jmp .loop
halt: 
    cli
    hlt
hello: db "Goeie dag eem!",0
