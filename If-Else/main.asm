BITS 32

; nasm -f elf main.asm
; ld -m elf_i386 main.o -o main

%include 'func.asm' ; include file with fuctions

section .data
	STDIN 	equ 0
	STDOUT 	equ 1

	choose:	db "Choose a number in range 1 - 4: "
	choose_len:	equ $ - choose

	msg1: db "You have chosen number: 1", 0x0a
	msg1_len: equ $ - msg1

	msg2: db "You have chosen number: 2", 0x0a
	msg2_len: equ $ - msg2

	msg3: db "You have chosen number: 3", 0x0a
	msg3_len: equ $ - msg3

	greatter: db "Only numbers in range 1 - 4", 0x0a
	greatL:	equ $ - greatter

	msg4: db "4 is a trap...", 0x0a
	msg4_len: equ $ - msg4

	msg_less: db "Not negative numbers and 0. Only 1 - 4", 0x0a
	msg_less_len: equ $ - msg_less


section .bss
	opt:	resb	10
	opt_len:	equ $ - opt 


section .text
	global _start

_start:
	mov eax, 4 ; num of syscall for write
	mov ebx, STDOUT ; stdout
	mov ecx, choose ; choose message
	mov edx, choose_len ; len of choose message
	int 0x80 ; syscall

	mov eax, 3 ; num of syscall for read
	mov ebx, STDIN ; stdin
	mov ecx, opt
	mov edx, opt_len
	int 0x80

	mov eax, [opt] ; move the selected option to the register eax
	sub eax, '0' ; convert from ASCII to decimal

	; comparing values
	cmp al, 0
	jle less ; jump if less or equal to 0

	cmp al, 1
	je one ; jump equal to 1

	cmp al, 2
	je two

	cmp al, 3
	je three

	cmp al, 4
	je four

	cmp al, 4
	jg greater ; jump if greater than 4
