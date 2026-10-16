section .text
    global _start

_start:
    ; Store the number
    mov eax, 7

    ; Check if the number is less than 1
    cmp eax, 1
    jl outside_range

    ; Check if the number is greater than 10
    cmp eax, 10
    jg outside_range

    ; The number is between 1 and 10
    mov eax, 4
    mov ebx, 1
    mov ecx, within_msg
    mov edx, within_len
    int 0x80
    jmp exit

outside_range:
    ; Display outside-range message
    mov eax, 4
    mov ebx, 1
    mov ecx, outside_msg
    mov edx, outside_len
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    within_msg  db "Number is within the range.", 10
    within_len  equ $ - within_msg

    outside_msg db "Number is outside the range.", 10
    outside_len equ $ - outside_msg