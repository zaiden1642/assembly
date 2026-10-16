section .text
    global _start

_start:
    ; Store the number
    mov eax, 17

    ; Clear EDX because EDX:EAX is used as the dividend
    xor edx, edx

    ; Divide the number by 2
    mov ebx, 2
    div ebx

    ; Check if the remainder is zero
    cmp edx, 0
    je even_number

    ; Display odd message
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, odd_len
    int 0x80
    jmp exit

even_number:
    ; Display even message
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, even_len
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    even_msg db "Even number.", 10
    even_len equ $ - even_msg

    odd_msg  db "Odd number.", 10
    odd_len  equ $ - odd_msg