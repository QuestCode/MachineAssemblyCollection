segment .data
	;user input prompt
	prompt: db "Enter an uppercase letter: "
	lenPrompt: equ $-prompt

	;output display message and variables
	uppercase: db 0xff
	message: db " was entered, in lowercase it is: "
	lowercase: db 0xff
	newLine2: db 0xa,0xd	;carriage return/line feed
	lenOutput: equ $-message

segment .code
	global _start:
_start:
	
	;display prompt
	mov edx, lenPrompt      ;provide prompt length
	mov ecx, prompt         ;provide prompt to display
	mov ebx, 1              ;file descriptor: stdout
	mov eax, 4              ;system call #: sys_write
	int 0x80                ;call operating system

	;get character
	mov eax, 3              ;system call #: sys_read
	mov ebx, 1              ;file descriptor: stdin
	mov ecx, uppercase      ;where to store the user input
	mov edx, 1              ;number of bytes to read
	int 0x80                ;call operating system
	
	;convert character to uppercase
	mov eax, [uppercase]    ;put uppercase variable value into register A low byte
	add	eax, 0x20           ;add hex 20 to register A low byte value
	mov [lowercase], eax    ;put register A low byte into lowercase variable

	;display the output message
	mov edx, lenOutput      ;provide Output message length
	mov ecx, uppercase      ;reference data to display
	mov ebx, 1              ;file descriptor: stdout
	mov eax, 4              ;system call #: sys_write
	int 0x80                ;call operating system
	
	;exit program
	mov eax, 1
	int 0x80
	
