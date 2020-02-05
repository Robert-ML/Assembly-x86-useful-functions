%include "io.inc"

section .bss
    result_word resd 2
    result_4word resd 4
    result_array resd 12    
    
section .data
   word_num1 dd 0xff543210
   word_num2 dd 0x00111111
   big_num1 dd 0, 0x11111111, 0x22222222, 0x33333333
   big_num2 dd 0, 0xffffffff, 0x22222222, 0x33333333
   num_array1 dd 0, 0, 0, 0x11111111, 0x22222222, 0x33333333, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   num_array2 dd 0, 0, 0, 0xffffffff, 0x22922252, 0x33033338, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   length dd 3

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ;TODO a, b, c: Implement the array sum starting with double word sum incrementally solving subsequent task b and c.
    mov eax, [word_num1]
    mov ebx, [word_num2]
    add eax, ebx
    jnc fara_carry
    mov ecx, 1
    
fara_carry:
    mov [result_word + 0], ecx
    mov [result_word + 4], eax
    
    PRINT_HEX 4, [result_word + 4]
    NEWLINE
    NEWLINE
    ; B
    
    xor eax, eax
    
    push eax
    lea eax, [result_4word + 1]
    push eax
    push big_num2
    push big_num1
    call aduna_nr_3
    add esp, 16
    
    NEWLINE
    NEWLINE

    ; C
    
    mov ebx, 2
    xor eax, eax
    
loop_ex_3:
    push eax
    lea eax, [result_array + ebx * 4]
    push eax
    mov eax, 16
    mul ebx
    lea eax, [num_array1 + eax]
    push eax
    mov eax, 16
    mul ebx
    lea eax, [num_array2 + eax]
    push eax
    call aduna_nr_3
    add esp, 16
    
    NEWLINE
    dec ebx
    cmp ebx, -1
    jnz loop_ex_3
    
    ret
    
    ; int aduna_nr_3(int* sursa_1, int* sursa_2, int* dest, int carry)
    ; int - intoarce carry ul daca este cazul
aduna_nr_3:
    push ebp
    mov ebp, esp
    
    push ebx
    push ecx
    push edx
    push esi
    push edi
    
    mov eax, [ebp + 20]
    mov ebx, 3

aduna_nr_3_loop:
    mov edi, [ebp + 16]
    lea edi, [edi + ebx * 4]
    
    mov ecx, [ebp + 8]
    mov ecx, [ecx + ebx * 4]
    
    mov edx, [ebp + 12]
    mov edx, [edx + ebx * 4]
    
    add ecx, edx
    jc am_cary_dupa_adunare
    add ecx, eax
    jc am_cary_dupa_adaugare_cary
    xor eax, eax
    jmp aduna_nr_3_dupa_tratare_cary
    
am_cary_dupa_adunare:
    add ecx, eax
    mov eax, 1
    jmp aduna_nr_3_dupa_tratare_cary
    
am_cary_dupa_adaugare_cary:    
    mov eax, 1
    
    
aduna_nr_3_dupa_tratare_cary:
    mov [edi], ecx
    PRINT_HEX 4, ecx
    NEWLINE
    
    dec ebx
    cmp ebx, -1
    jnz aduna_nr_3_loop
    
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    
    leave
    ret
