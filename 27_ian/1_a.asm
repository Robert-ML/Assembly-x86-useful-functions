%include "io.inc"

section .data
    NB dd 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push dword [NB]
    call count_set_bytes
    add esp, 4
    
    xor eax, eax
    ret
    
    
count_set_bytes:
    push ebp
    mov ebp, esp
    
    push ebx
    
    mov ebx, [ebp + 8]
    xor eax, eax
    
count_set_bytes_loop:
    test ebx, 1
    jz count_set_bytes_do_not_count
    inc eax
    
    
count_set_bytes_do_not_count:
    shr ebx, 1
    cmp ebx, 0
    jnz count_set_bytes_loop
    
    PRINT_DEC 4, eax
    
    pop ebx
    
    leave
    ret