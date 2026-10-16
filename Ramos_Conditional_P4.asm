section .text
    global _start

_start:
    ; Store the character 'm'
    mov al, 'm'

    ; Check if the character is below 'A'
    cmp al, 'A'
    jl invalid_character

    ; Check if the character is above 'Z'
    cmp al, 'Z'
    jg check_lowercase

    ; The character is uppercase
    mov eax, 4
    mov ebx, 1
    mov ecx, uppercase_msg
    mov edx, uppercase_len
    int 0x80
    jmp exit

check_lowercase:
    ; Check if the character is below 'a'
    cmp al, 'a'
    jl invalid_character

    ; Check if the character is above 'z'
    cmp al, 'z'
    jg invalid_character

    ; The character is lowercase
    mov eax, 4
    mov ebx, 1
    mov ecx, lowercase_msg
    mov edx, lowercase_len
    int 0x80
    jmp exit

invalid_character:
    ; The character is not a letter

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    uppercase_msg db "Uppercase letter.", 10
    uppercase_len equ $ - uppercase_msg

    lowercase_msg db "Lowercase letter.", 10
    lowercase_len equ $ - lowercase_msg