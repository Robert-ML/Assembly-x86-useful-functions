%include "io.inc"

section .data
    string db "ceva ceVAA", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push string
    call str_len
    add esp, 4
    
    sub esp, 1
    mov byte [esp], 0
    mov edi, esp
    sub esp, eax
    mov esi, esp
    mov ecx, eax
    
    
; ----------------------------
    sub esp, 1
    mov byte [esp], 'a'
    push string
    call no_of_occurences
    add esp, 5
    
    mov ebx, eax
        sub esp, 1
    mov byte [esp], 'A'
    push string
    call no_of_occurences
    add esp, 5
    
    add ebx, eax
    sub edi, ebx
    
    ; esi - la inceputul vectorului
    ; edi - unde tre sa punem 'a' si 'A'
    xor ebx, ebx
    
again:
    mov dl, [string + ebx]
    inc ebx
    cmp dl, 'a'
    jz este_a
    cmp dl, 'A'
    jnz dupa_A

este_a:
    mov byte [edi], dl
    inc edi
    jmp dupa
    
    
dupa_A:
    mov byte [esi], dl
    inc esi
    
dupa:
    dec ecx
    jnz again
    
    PRINT_STRING [esp]
    
    mov esp, ebp
    
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
    
    pop edi
    pop esi
    pop edx
    pop ecx
    
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