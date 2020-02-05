%include "io.inc"

section .data
    param_a dd 1
    param_b dd 5

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    push dword [param_b]
    push dword [param_a]
    call mul_f
    add esp, 8
    
    PRINT_DEC 4, eax
    
    
    xor eax, eax
    ret
    
    
    ; int mul_f( int, int)
    ; + 8 int param_a
    ; +12 int param_b
    
mul_f:
    push ebp
    mov ebp, esp
    
    push ebx
    push edx
    
    mov eax, [ebp + 8]
    mov ebx, 7
    
    mul ebx
    add eax, [ebp + 12]
    
    pop edx
    pop ebx
    
    leave
    ret

