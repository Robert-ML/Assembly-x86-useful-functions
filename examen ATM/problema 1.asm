; read <arg1> characters from stdin or '\n' and then print them with a space between them
; sort the odd digits ascending and print them with a space between them
; make their sum and print it

%include "io.inc"

extern scanf

section .data
    read_char db "%c", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    ; get the maximum number of characetrs to read from arg1
    mov esi, [ebp + 8]
    mov edi, [esi + 4] ; arg1 is a string
    
    push edi
    call my_atoi
    add esp, 4
    mov ecx, eax ; arg1 in numeric form is in ecx now
    dec esp
    mov [esp], byte 0 ; we put \0 at the end of the string

; read from keyboard each caracter
read_loop:
    cmp ecx, 0
    jz read_done
    dec ecx
    
    ; alocate an int of memory
    sub esp, 1
    mov ebx, esp
    
    push ebx
    push dword read_char
    call scanf
    add esp, 8
    
    mov dl, [ebx]
    cmp dl, 0xA ; 0xA =  \n
    jnz read_loop

    ; we finished reading
read_done:
    
    PRINT_STRING [esp]
    NEWLINE
    
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
