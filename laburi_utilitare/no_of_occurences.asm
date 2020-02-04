%include "io.inc"

section .data
    string db "ceva ceva ", 0
    letter db "c"

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    ;write your code here
    xor eax, eax
    mov al, [letter]
    sub esp, 1
    mov [esp], al
    push string
    call no_of_occurences
    add esp, 5
        
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret
    
    
    ; int no_of_occurences(char*, char)
    ; + 8 char* sirul caruia ii vrem lungimea
    ; +12 char  caracterul pe care il numaram
    ; modifica numai eax
    
no_of_occurences:
    push ebp
    mov ebp, esp
    
    push ecx
    push edx
    push esi
    push edi


    mov edi, [ebp + 8]
    mov esi, edi
    
    ; aflam lungimea
    push edi
    call str_len
    add esp, 4
    mov ecx, eax
    
    xor eax, eax
    mov al, [ebp + 12]
    xor edx, edx

no_of_occurences_loop:
    repnz scasb
    inc edx
    cmp ecx, 0
    jnz no_of_occurences_loop
    cmp [edi - 1], al
    jz no_of_occurences_last_letter
    dec edx
    
no_of_occurences_last_letter:
    mov eax, edx
    
    push edi
    push esi
    push edx
    push ecx
    
    leave
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