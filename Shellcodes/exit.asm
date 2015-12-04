; Linux\x86 - exit(1)
; zxp

00000000  31C0              xor eax,eax
00000002  FEC0              inc al
00000004  31DB              xor ebx,ebx
00000006  B301              mov bl,0x1
00000008  CD80              int 0x80

==============================================================
gcc exit.c -o exit -z execstack -fno-stack-protector
==============================================================

#include <stdio.h>

const char code[] = "\x31\xc0\xfe\xc0\x31\xdb\xb3\x01\xcd\x80";

int main(void)
{
	(*(void(*)()) code)();
}

==============================================================

./exit
echo $?
1
