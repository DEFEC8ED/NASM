BITS 32

section .data
	input:	db "Enter a number in range 1 - 10", 0, 0
	toobig:	db "Number is too big!", 0, 0 ; if num is bigger than 10
	negative: db "Negative numbers are not allowed!", 0, 0
	
	output: db "Yup: %d", 10, 0 ; 10 = 0x0a - newline
	fmt:	db "%d", 0 ; for scanf

section .bss

section .text
	extern printf
	extern puts
	extern scanf
	extern exit

	global main:

main:
	push ebp
	mov ebp, esp
	sub esp, 4 

	push input ; puts input msg
	call puts
	add esp, 4

	lea eax, [ebp-0x4] ; load address of variable into eax
	push eax
	push fmt
	call scanf
	add esp, 8 ; scanf has 2 parameters - input & format param.

	mov eax, DWORD [ebp-0x4]
	cmp eax, 10
	jle minus ; jump if the previous comparison is "less than or equal" (easily, jump if less than or equal to 10)
					; will jump on 'minus' function and print your number
	push toobig
	call puts
	add esp, 4

	call over ; exit(1)

minus:
	mov eax, DWORD [ebp-0x4]
	cmp eax, 0 ; 
	jns print_time ; jump if not sign
		
    push negative
	call puts
	add esp, 4

	call over

print_time:
	mov eax, DWORD [ebp-0x4]
	push eax
	push output
	call printf
	add esp, 8

	xor eax, eax
	leave
	ret	

over:
	xor eax, eax
	inc al
	mov bl, 0
	int 0x80