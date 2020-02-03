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
    push dword b
    push dword a
    call sum_adj
    add esp, 12
    
    xor eax, eax
    ret

    ; void sum_adj(int *a, int *b, int len)
    ; + 8 int* pointer la vectorul sursa
    ; +12 int* pointer la vectorul destinatie
    ; +16 int  lungimea vectorului
sum_adj:
    push ebp
    mov ebp, esp
    
    mov esi, [ebp + 8]  ;a
    mov edi, [ebp + 12] ;b
    mov edx, [ebp + 16] ;len
    
    xor ecx, ecx
    xor ebx, ebx
    xor eax, eax
    dec edx
    
sum_adj_make_b:
    mov eax, [esi + ecx * 4]
    inc ecx
    add eax, [esi + ecx * 4]
    mov [edi + ebx * 4], eax
    inc ebx
    cmp edx, ecx
    jnz sum_adj_make_b
    
    mov eax, [esi + ecx * 4]
    xor ecx, ecx
    add eax, [esi + ecx * 4]
    mov [edi + ebx * 4], eax
    inc edx

    push dword edx
    push dword edi
    call print_arr
    add esp, 8
    
    xor eax, eax
    leave
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
    