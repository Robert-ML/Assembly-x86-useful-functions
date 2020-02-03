%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov esi, [ebp + 8]
    mov eax, [esi + 4] ; takes pointer to arg 1
    mov ebx, [esi + 8] ; takes pointer to arg 2
    
    PRINT_STRING [eax]
    NEWLINE
    PRINT_STRING [ebx]
    NEWLINE
    xor eax, eax
    ret