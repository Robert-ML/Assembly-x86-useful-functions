%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    ret
    
    ; -------------------------FUNCTII UTILITARE-----------------------------------

    ; int creaza_numar_din_string(char*)
    ; +8 char* pointer la vectorul de caractere care se termina cu \0
    ; modifica numai eax
creaza_numar_din_string:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push edx
    push esi
    push edi
    
    mov edi, [ebp + 8]
    mov ecx, 10
    xor eax, eax
    xor ebx, ebx
    
creaza_numar:
    mov bl, [edi] ; luam un numar
    cmp bl, 0
    jz terminat_creare_numar
    sub bl, '0' ; ne facem numar din char
    mul ecx
    add eax, ebx
    inc edi
    jmp creaza_numar
    
terminat_creare_numar:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret