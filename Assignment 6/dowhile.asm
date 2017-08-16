; A macro with two parameters
; Implements the write system call
	%macro write_string 2
		mov eax, 4  ;sys_write system call number
		mov ebx, 1  ;file descriptor std_out
		mov ecx, %1 ;message to write from parameter 1
		mov edx, %2 ;message length from parameter 2
		int 0x80
	%endmacro
;;;;;;;;;;;;;;;;;;;;	DATA SEGMENT	;;;;;;;;;;;;;;;;;;;;
section .data
	;;;;;;;;;;;;;;;;;;Prompt for numbers;;;;;;;;;;;;;;;;;;;
	msg1	db	'Displaying numbers 0 through 9 using a loop: '
	lenmsg1	equ	$ - msg1
	;;;;;;;;;;;;;;;;;;Insert carriage return and line feed;;;;;;;;;;;;;;;;;;;
	crlf db 0x0d, 0x0a
	lencrlf	equ	$ - crlf
	;;;;;;;;;;;;;;;;;;num variable;;;;;;;;;;;;;;;;;;;	
	num db 0
	;;;;;;;;;;;;;;;;;;num to display in console;;;;;;;;;;;;;;;;;;;	
	stdoutnum db 0xff

;;;;;;;;;;;;;;;;;;;;	TEXT SEGMENT	;;;;;;;;;;;;;;;;;;;;
section	.text
	global _start
	_start:
	write_string msg1, lenmsg1
	dowhile:
	    mov al, [num]       ;put num variable value into register AL
	    or al, 0x30         ;put ascii encoding onto the value in register AL
	    mov [stdoutnum], al ;put ascii encoded digit into stdoutnum variable
	    write_string stdoutnum, 1   ;write stdoutnum to console
	    mov al, [num]       ;put num variable value into register AL
	    add al, 1           ;calculate num + 1
	    mov [num], al       ;put num +1 back into num variable
	    cmp al, 10          ;compare num to 10
	    jl dowhile          ;jump if less to the dowhile label

    write_string crlf, lencrlf
	;Exit to operating system
	mov eax, 1
	mov ebx, 0
	int 0x80
;;;;;;;;;;;;;;;;;;;;	END OF PROGRAM	;;;;;;;;;;;;;;;;;;;;
	