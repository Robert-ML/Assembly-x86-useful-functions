%include "io.inc"

extern printf

section .data
    print_message db "Hello world", 10, 0 ; 10 - ascii number for \n | 0 - ascii number for \0
    print_message_with_info db "Now it's %d A.M.", 10, 0

section .text
global CMAIN
CMAIN:
    ;write your code here
    
    push print_message
    call printf
    add esp, 4
    
    push dword 1
    push print_message_with_info
    call printf
    add esp, 8

    xor eax, eax
    ret