%include "io.inc"

section .data
    a dd 13, 54, 23, 566, 22
    b dd 0, 0, 0, 0, 0
    vector_len dd 5
    spatiu db ' ', 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push dword [vector_len]
    ;push dword a
    sub esp, 4
    mov dword [esp], a    
    call print_arr
    add esp, 8
    
    xor eax, eax
    ret
    
    ; void print_arr(int *arr, int len)
    ; + 8 int* pointerul la vector
    ; +12 int  lungimea vectorului
print_arr:
    push ebp
    mov ebp, esp
    
    push ecx
    push edx
    push esi
    
    mov edx, [ebp + 12]
    mov esi, [ebp + 8]

    xor ecx, ecx
    
print_arr_afisare:   
    mov eax, [esi + ecx * 4]
    PRINT_DEC 4, eax
    PRINT_STRING spatiu
    inc ecx
    cmp edx, ecx
    jnz print_arr_afisare
    
    pop esi
    pop edx
    pop ecx
    
    xor eax, eax
    leave
    ret