%include "io.inc"

section .text
global CMAIN
CMAIN:
    xor eax, eax
    ret
    
    ; -------------------------UTILITY FUNCTIONS-----------------------------------

    ; int my_atoi(char*) // it only converts pozitive numbers
    ; +8 char* pointer to the char array ended in \0
    ; modifies only eax
    ; if the number does't fit on 32 bits
my_atoi:
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
    xor edx, edx
    
my_atoi_loop:
    mov bl, [edi] ; luam un numar
    cmp bl, 0
    jz terminat_creare_numar
    sub bl, '0' ; ne facem numar din char
    mul ecx
    cmp edx, 0
    jnz my_atoi_number_over_32_bits
    add eax, ebx
    jc my_atoi_number_over_32_bits
    inc edi
    jmp my_atoi_loop
    
my_atoi_number_over_32_bits:
    mov eax, -1

terminat_creare_numar:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
