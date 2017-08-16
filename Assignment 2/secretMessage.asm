section	.data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   system call numbers to load in eax register ;
sys_exit equ 1
sys_fork equ 2
sys_read equ 3
sys_write equ 4
sys_open equ 5
sys_close equ 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   file descriptors to load in ebx register    ;
;   sys_read file descriptor
stdin equ 2
;   sys_write file descriptor
stdout equ 1

; Secret Message is There is no spoon
secretmsg db 01010100b, 01101000b, 01100101b, 01110010b, 01100101b, 00100000b, 01101001b, 01110011b, 00100000b, 01101110b, 01101111b, 00100000b, 01110011b, 01110000b, 01101111b, 01101111b, 01101110b, 00001101b, 00001010b
len	equ	$ - secretmsg			;length of our dear string

section	.text
	global _start       ;must be declared for using gcc
_start:                 ;tell linker entry point

mov	edx, len    ;message length
mov	ecx, secretmsg    ;message to write
mov	ebx, 1	    ;file descriptor (stdout)
mov	eax, 4	    ;system call number (sys_write)
int	0x80        ;call kernel
mov	eax, 1	    ;system call number (sys_exit)
int	0x80        ;call kernel

