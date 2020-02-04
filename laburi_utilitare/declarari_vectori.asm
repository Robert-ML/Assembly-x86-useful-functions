%include "io.inc"

section .data
    vector_initializat_byte: times 20 db 42 ; declara vectorul de char[20] initializat cu 42
    vector_initializat_word: times 14 dw 43 ; declara vectorul de short[14] initializat cu 43
    vector_initializat_dword: times 25 dd 44 ; declara vectorul de int[25] initializat cu 44
    
    vector_cu_chestii_byte db "cev", 'a', 42, 0
    vector_cu_inturi dd 12345, 2443
    marime_vector_inturi dd $-vector_cu_inturi ; wildcard '$-<nume vector>' imi da marimea vectorului in bytes !!! nu merge mereu
    
    macro_inlocuire equ 40 ; este un macro si se inlocuieste cu valoarea la compile | recomand sa fie folosit doar cu inturi
    
section .bss
    vector_neinitializat_byte: resb 20 ; declara vectorul de char[20] neinitializat
    vector_neinitializat_word: resw 23 ; declara vectorul de short[23] neinitializat
    vector_neinitializat_dword: resd 24 ; declara vectorul de int[24] neinitializat

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov eax, macro_inlocuire
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret