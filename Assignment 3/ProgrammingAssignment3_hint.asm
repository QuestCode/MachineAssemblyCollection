section	.data

msg1	db	0xa,'original value of  variable X:',0x20
len1	equ	$ - msg1			
msg2    db  0xa,'updated value of variable X:',0x20
len2    equ $ - msg2
X       db 'A'
crcr      db  0xa,0xa


section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
    ;display fist message
	mov	edx, len1    ;message length
	mov	ecx, msg1    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel

    ;display X
	mov	edx, 1    ;message length
	mov	ecx, X    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	
	;update X
	mov al, [X]     ;put content of variable X into register A low byte
	add [X], 0x10      ;add hex 10 to register A
	mov [X], al     ;mov register A low byte back to variable X
	
    ;display second message
	mov	edx, len2    ;message length
	mov	ecx, msg2    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel

    ;display X
	mov	edx, 1    ;message length
	mov	ecx, X    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	
    ;display crcr
	mov	edx, 2    ;message length
	mov	ecx, crcr    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	
	mov	eax, 1	    ;system call number (sys_exit)
	int	0x80        ;call kernel

