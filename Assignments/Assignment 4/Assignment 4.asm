;;;;;;;;;;;;;;;;;;;;	MACRO DEFINITIONS	;;;;;;;;;;;;;;;;;;;;
; A macro with two parameters
; Implements the write system call
	%macro write_string 2
		mov eax, 4  ;sys_write system call number
		mov ebx, 1  ;file descriptor std_out
		mov ecx, %1 ;message to write from parameter 1
		mov edx, %2 ;message length from parameter 2
		int 0x80
	%endmacro

; A macro with two parameters
; Implements the sys_read call
	%macro read_string 2
		mov eax, 3  ;sys_write system call number
		mov ebx, 2  ;file descriptor std_in
		mov ecx, %1 ;variable/array to hold data, pass by reference in param 1
		mov edx, %2 ;number of bytes to read passed by value in param 2
		int 0x80
	%endmacro

section .data
	prompt1 db 'Please enter a number: '
	lenP1 equ $-prompt1
	prompt2 db 'Please enter another number: '
	lenP2 equ $-prompt2
	prompt3 db 'Please enter a third number: '
	lenP3 equ $-prompt3
	crlf db 0x0D,0x0A 
	lencrlf equ $-crlf
	dispSum db 'The sum of the entered numbers is: '
	lendispSum equ $-dispSum
	
	num1 db 0xff
	num2 db 0xff
	num3 db 0xff
	sum db 0xff
	
section .text
	global _start
	_start:
	
	write_string prompt1 , lenP1	; Display Please enter a number
	read_string num1, 1				; 
	write_string crlf , lencrlf		; newline
	write_string prompt2 , lenP2	;
	read_string num2 , 1			;
	write_string crlf , lencrlf		;
	write_string prompt3 , lenP3	;
	read_string num3 , 1			;
	write_string crlf , lencrlf		;
	
	mov bl , [num1]					;
	and bl , 0x0F					;
	
	mov al , [num2]					;
	and al , 0x0F					;
	add al , bl						;
	
	mov bl , [num3]					;
	and bl , 0x0F					;
	add al , bl						;
	or al , 0x30					;
	
	mov [sum] , al					;
	
	write_string dispSum , lendispSum ;
	write_string sum , 1			;
	write_string crlf , lencrlf		;
	
	
	mov eax , 1						;
	mov ebx , 0						;
	int 0x80						;