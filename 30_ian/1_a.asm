%include "io.inc"
extern printf

section .data
    print_format_lower db "lower", 0
    print_format_greater db "greater", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov esi, [ebp + 8]
    mov ebx, [esi + 4]
    push ebx
    call creaza_numar_din_string
    add esp, 4
    mov edx, eax
    
    mov ecx, [esi + 8]
    push ecx
    call creaza_numar_din_string
    add esp, 4
    mov ecx, eax
    
    cmp edx, ecx
    jl afisare_lower
    push print_format_greater
    call printf
    add esp, 4
    jmp final
    
afisare_lower:
    push print_format_lower
    call printf
    add esp, 4
    
final:
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
