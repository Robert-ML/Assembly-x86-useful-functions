%include "io.inc"

section .data
    string db "ceva ceva", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    ;write your code here
    
    push dword string
    call str_len
    add esp, 4
    
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret

    ; int str_len(char*)
    ; + 8 char* sirul caruia ii vrem lungimea
    ; modifica numai eax
str_len:
    push ebp
    mov ebp, esp
    
    push ecx
    push esi
    push edi
    

    mov esi, [ebp + 8]
    mov edi, esi
    mov ecx, -1
    xor eax, eax

    cld ; DF = 0
    repnz scasb
    dec edi
    sub edi, esi
    mov eax, edi
    
    pop edi
    pop esi
    pop ecx
    
    leave
    ret