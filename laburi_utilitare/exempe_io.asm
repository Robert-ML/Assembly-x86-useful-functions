%include "io.inc"

section .data
    vector_to_print db "ceva ceva", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov eax, -3
    mov bx, 3
    
    
    PRINT_DEC 4, eax
    NEWLINE
    PRINT_UDEC 4, eax
    NEWLINE
    PRINT_DEC 2, bx
    NEWLINE
    
    PRINT_STRING [vector_to_print]
    NEWLINE    
    
    xor eax, eax
    ret