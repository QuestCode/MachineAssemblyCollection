section	.text
global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov	edx, len    ;message length
mov	ecx, msg    ;message to write
mov	ebx, 1	    ;file descriptor (stdout)
mov	eax, 4	    ;system call number (sys_write)
int	0x80        ;call kernel
mov	eax, 1	    ;system call number (sys_exit)
int	0x80        ;call kernel

section	.data

msg	db	0x48,0x45,0x4c,0x4c,0x20,0x4f,0x55,0x54,0x20,0x54,0x48,0x45,0x52,0x45,0x21,0xa	;
len	equ	$ - msg			;length of our dear string
