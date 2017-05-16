one:
	mov eax, 4
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, msg1_len
	int 0x80

	jmp gameover

two:
	mov eax, 4
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, msg2_len
	int 0x80

	jmp gameover

three:
	mov eax, 4
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, msg3_len
	int 0x80

	jmp gameover

four:
	mov eax, 4
	mov ebx, STDOUT
	mov ecx, msg4
	mov edx, msg4_len
	int 0x80

	jmp gameover

greater:
	mov eax, 4
	mov ebx, STDOUT
	mov ecx, greatter
	mov edx, greatL
	int 0x80

	jmp gameover

less:
	mov eax, 4
	mov ebx, STDOUT
	mov ecx, msg_less
	mov edx, msg_less_len
	int 0x80

	jmp gameover

gameover:
	mov al, 1
	xor bl, bl
	int 0x80
