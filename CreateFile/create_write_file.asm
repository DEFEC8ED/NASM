BITS 32
;#-----------------------------------------------------------------------------
;
; PaX/zpx @ 2017

; Create file DINGDONG.txt and write 'This is Sparta!'

; open
; write
; close
; exit


;#-----------------------------------------------------------------------------
section .data

	STDIN	equ 0
	STDOUT	equ 1
	STDERR	equ 2

	filename	db	'DINGDONG.txt', 0 ; The filename string requires a 0-byte terminator
	text	db	"This is Sparta!", 0x0a
	text_len	equ $ - text 

;#-----------------------------------------------------------------------------
section .bss


;#-----------------------------------------------------------------------------
section .text

global _start:

_start:
	nop

	; open("DINGDONG.txt", O_RDWR|O_CREAT|O_TRUNC, 0666) = 3
	mov eax, 5
	mov ebx, filename  ; const char *filename
	mov ecx, 0102o ; int flags --> https://gist.github.com/Zhangerr/6022492 + https://stackoverflow.com/questions/8312290/how-to-open-a-file-in-assembler-and-modify-it
	mov edx, 0666o  ; int mode --> 'o' means octal .. or $0666
	int 0x80

	mov ebx, eax ; eax has the file descriptor we opened. so we move it to ebx

	mov eax, 4
	mov ecx, text
	mov edx, text_len
	int 0x80

	mov eax, 6
	int 0x80

	jmp exit

exit:
	nop

	xor al, 1
	mov bl, 0
	int 0x80
