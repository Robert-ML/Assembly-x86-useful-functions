%include "io.inc"

extern scanf

section .data
    read_int db "%d%d%d%d%d", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    ; alocam pe stiva un int
    sub esp, 20 ; alocam vectorul int v[5]
    mov ebx, esp
    mov edx, ebx
    add edx, 16
    
    mov ecx, 5
    
mai_pune_pt_citire:
    push edx
    sub edx, 4
    dec ecx
    cmp ecx, 0
    jnz mai_pune_pt_citire
    
    ; apelam scanf("%d", &int)
    push dword read_int ; scanf("%d%d%d%d%d", &v[0], &v[1], &v[2], &v[3], &v[4]);
    call scanf
    add esp, 24
    
    ; pointerul la variabila declarata a ramas in ebx
    mov edx, ebx
    mov ecx, 5
    
printare_vector:
    mov eax, [edx]
    add edx, 4
    dec ecx
    PRINT_DEC 4, eax ; print v[i]
    NEWLINE
    cmp ecx, 0
    jnz printare_vector
    
    
    add esp, 20 ; dealocam vectorul
    xor eax, eax
    ret