%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    mov eax, 55
    mov ebx, 44
    
    sub eax, ebx
    ;negativ
    cmp eax, 0
    jl modul
    jmp print
    
modul:
    neg eax
    
print:
    PRINT_DEC 4, eax
    
    
    xor eax, eax
    ret