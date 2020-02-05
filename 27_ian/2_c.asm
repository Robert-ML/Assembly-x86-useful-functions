%include "io.inc"

extern printf

section .data
    param_a dd 1
    param_b dd 5
    vector dd 3, 6, 7, 8
    vector_size dd 4
    print_d db "%d %d %d %d", 0
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push dword 2
    push dword [vector_size]
    push dword vector
    call apply
    add esp, 12
    
    
    push dword [vector_size]
    push dword vector
    call print_f
    add esp, 8
    
    
    xor eax, eax
    ret
    
    ; void apply(int*, int, int)
    ; + 8 int* vectorul de elemente
    ; +12 int  marimea vectorului
    ; +16 int  scalarul cu care sa inmulteasca
    
apply:
    push ebp
    mov ebp, esp
    
    mov esi, [ebp + 8]
    mov ecx, [ebp + 12]
    
    
apply_again:
    push dword [esi]
    push dword [ebp + 16]
    call mul_f
    add esp, 8
    mov [esi], eax
    add esi, 4
    dec ecx
    cmp ecx, 0
    jnz apply_again
    
    
    leave
    ret




    
    
    ; void print_f(int*, int)
    ; + 8 int* pointer la vector
    ; +12 int  marimea vectorului
    
print_f:
    push ebp
    mov ebp, esp
    
    mov ecx, [ebp + 12]
    dec ecx
    mov esi, [ebp + 8]
    
print_f_loop_param_2:
    push dword [esi + ecx * 4]
    dec ecx
    cmp ecx, -1
    jnz print_f_loop_param_2
    
    push dword print_d
    call printf
    mov ecx, [ebp + 12]
    lea ecx, [ecx * 4]
    add esp, ecx
    add esp, 4
    
    leave
    ret

    
    
    ; int mul_f(int, int)
    ; + 8 int param_a
    ; +12 int param_b
    
mul_f:
    push ebp
    mov ebp, esp
    
    push ebx
    
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    
    mul ebx
    
    pop ebx
    
    leave
    ret

