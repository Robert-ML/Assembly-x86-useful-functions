%include "io.inc"

extern scanf

section .data
    read_int db "%d", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ; alocam pe stiva un int
    sub esp, 4
    mov ebx, esp
    
    ; apelam scanf("%d", &int)
    push ebx
    push dword read_int
    call scanf
    add esp, 8
    
    ; pointerul la variabila declarata a ramas in ebx
    mov edx, [ebx]
    PRINT_DEC 4, edx
    
    add esp, 4
    xor eax, eax
    ret