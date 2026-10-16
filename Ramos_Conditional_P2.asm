section .text
    global _start

_start:
    ; Store the two numbers
    mov eax, 15
    mov ebx, 9

    ; Compare the numbers
    cmp eax, ebx
    jl first_is_smaller

    ; Display second-number message
    mov eax, 4
    mov ebx, 1
    mov ecx, second_msg
    mov edx, second_len
    int 0x80
    jmp exit

first_is_smaller:
    ; Display first-number message
    mov eax, 4
    mov ebx, 1
    mov ecx, first_msg
    mov edx, first_len
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    first_msg  db "First number is smaller.", 10
    first_len  equ $ - first_msg

    second_msg db "Second number is smaller or equal.", 10
    second_len equ $ - second_msg