section .text
    global _start

_start:
    ; Store the two numbers
    mov eax, 20
    mov ebx, 20

    ; Compare the numbers
    cmp eax, ebx
    je numbers_equal
    jne numbers_not_equal

numbers_equal:
    ; Display equal message
    mov eax, 4
    mov ebx, 1
    mov ecx, equal_msg
    mov edx, equal_len
    int 0x80
    jmp exit

numbers_not_equal:
    ; Display not-equal message
    mov eax, 4
    mov ebx, 1
    mov ecx, not_equal_msg
    mov edx, not_equal_len
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    equal_msg     db "The numbers are equal.", 10
    equal_len     equ $ - equal_msg

    not_equal_msg db "The numbers are not equal.", 10
    not_equal_len equ $ - not_equal_msg