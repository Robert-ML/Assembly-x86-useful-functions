%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov esi, [ebp + 8]
    mov eax, [esi]     ; arg0 aka the program name and path
    mov ebx, [esi + 4] ; takes pointer to arg 1
    mov ecx, [esi + 8] ; takes pointer to arg 2 
    
    PRINT_STRING [eax]
    NEWLINE
    PRINT_STRING [ebx]
    NEWLINE
    PRINT_STRING [ecx]
    NEWLINE
    xor eax, eax
    ret