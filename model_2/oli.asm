%include "io.inc"

section .data
   word_num1 dd 0xff543210
   word_num2 dd 0x00111111
   result_word resd 2
   big_num1 dd 0x11111111, 0x22222222, 0x33333333
   big_num2 dd 0xffffffff, 0x22222222, 0x33333333
   result_4word resd 4
   num_array1 dd 0x11111111, 0x22222222, 0x33333333, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   num_array2 dd 0xffffffff, 0x22922252, 0x33033338, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   result_array resd 12
   length dd 3

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging

    ;TODO a, b, c: Implement the array sum starting with double word sum incrementally solving subsequent task b and c.
    
    ; c.
    ; +8 coada1 +20 coada2
    ; +12 mijloc1 +24 mijloc2
    ; +16 inceput1 +28 inceput2
    mov eax, [num_array1]
    mov ebx, [num_array1 + 4]
    mov ecx, [num_array1 + 8]
    
    mov edx, [num_array2]
    mov esi, [num_array2 + 4]
    mov edi, [num_array2 + 8]
    
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call functie
    add esp, 24
    
    NEWLINE
    
    mov eax, [num_array1 + 12]
    mov ebx, [num_array1 + 16]
    mov ecx, [num_array1 + 20]
    
    mov edx, [num_array2 + 12]
    mov esi, [num_array2 + 16]
    mov edi, [num_array2 + 20]
    
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call functie
    add esp, 24
    
    NEWLINE
    
    mov eax, [num_array1 + 24]
    mov ebx, [num_array1 + 28]
    mov ecx, [num_array1 + 32]
    
    mov edx, [num_array2 + 24]
    mov esi, [num_array2 + 28]
    mov edi, [num_array2 + 32]
    
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call functie
    add esp, 24
    
    ret
    
    
functie:
    push ebp
    mov ebp, esp 
    
    xor ecx, ecx
    xor edx, edx
    xor esi, esi
    mov eax, [ebp + 8]
    mov ebx, [ebp + 20]
    add ecx, eax
    add ecx, ebx
    mov [result_array], ecx
    PRINT_HEX 4, [result_array]
    NEWLINE
    jc f_aduna2
    
f_back2:
    mov eax, [ebp + 12]
    mov ebx, [ebp + 24]
    add edx, eax
    add edx, ebx
    mov [result_array], edx
    PRINT_HEX 4, [result_array]
    NEWLINE
    jc f_aduna1
    
f_back1:
    mov eax, [ebp + 16]
    mov ebx, [ebp + 28]
    add esi, eax
    add esi, ebx
    mov [result_array], esi
    PRINT_HEX 4, [result_array]
    NEWLINE
    jc f_aduna0
    jmp f_exit
    
f_aduna2:
    add edx, 1
    jmp f_back2
    
f_aduna1:
    add esi, 1
    jmp f_back1
    
f_aduna0:
    mov dword [result_array], 1
    PRINT_HEX 4, [result_array]
 
f_exit:   
    leave
    ret
     
exit:
    leave
    ret