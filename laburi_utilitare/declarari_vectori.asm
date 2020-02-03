%include "io.inc"

section .data
    vector_initializat_byte: times 20 db 42 ; declara vectorul de char initializat cu 44
    vector_initializat_word: times 20 dw 43
    vector_initializat_dword: times 20 dd 44
    
    vector_cu_chestii_byte db "cev", 'a', 42, 0
    vector_cu_inturi dd 12345, 2443
    marime_vector_inturi dd $-vector_cu_inturi ; wildcard '$-<nume vector>' imi da marimea vectorului in bytes
    
    macro_inlocuire equ 40 ; este un macro si se inlocuieste cu valoarea la compile | recomand sa fie folosit doar cu inturi
    
section .bss
    vector_neinitializat_byte: resb 20 ; declara vectorul de char neinitializat
    vector_neinitializat_word: resw 20 ; declara vectorul de short neinitializat
    vector_neinitializat_dword: resd 20 ; declara vectorul de int neinitializat

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov eax, macro_inlocuire
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret