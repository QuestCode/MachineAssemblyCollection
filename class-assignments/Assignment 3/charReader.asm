section .data ;Data segment
    userMsg db 'Please enter a character: '     ;Ask user to enter a char
    lenUserMsg equ $ - userMsg                  ;The length of the message
    dispMsg db 'You have entered: '             ;Message for echo
    char db 0xff                                ;char defaul value 0cff
    cr_lf db 0xA, 0xD                           ;carriage return / line feed
    lenDispMsg equ $ - dispMsg                  ;Length of Message for echo

section .text
    global _start
    _start:

    ;User Prompt - 'Please enter a character: '
    mov eax, 4                                  ;sys_write system call number
    mov ebx, 1                                  ;stdout file descriptor
    mov ecx, userMsg                            ;message to write
    mov edx, lenUserMsg                        ;message length
    int 0x80                                    ;call kernal

    ;Read and store the user input
    mov eax, 3                                  ;sys_read system call number
    mov ebx, 2                                  ;std_in file descriptor
    mov ecx, char
    mov edx, 1                                 ;5 bytes can be read
    int 0x80

    ;Output the message 'The entered number is: '
    mov eax, 4
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDispMsg
    int 0x80

    ;Exit code
    mov eax, 1
    mov ebx, 0
    int 0x80