/*

Basic calculator using inline ASM

*/

#include <stdio.h>
#include <stdlib.h>

void menu();
int add();
int sub();
int multi();
int divi();

// bss segment
int a = {1};
int b = {1};
int c;

int main(int argc, char *argv[])
{
	int ch;

	do
	{
		menu();
		printf("\nOption: ");
		scanf("%d", &ch);

		if(ch == 1){
			add();
		}

		else if(ch == 2){
			sub();
		}

		else if(ch == 3){
			multi();
		}

		else if(ch == 4){
			divi();
		}

		else if(ch == 0){
			fprintf(stderr, "Shutting down...\n");
			exit(0);
		} 
	} while (ch < 0 || ch > 4);

	return ch;

}

void menu()
{
	printf("\n");
	printf("[ Just a simple calc in C using inline ASM ]\n\n");

	printf("(1) - Add\n");
	printf("(2) - Subtract\n");
	printf("(3) - Multiply\n");
	printf("(4) - Divide\n");
	printf("(0) - Exit\n");
}

int add()
{
	printf("\n1st number: \n");
	scanf("%d", &a);

	printf("\n2nd number: \n");
	scanf("%d", &b);

	asm(".intel_syntax noprefix"); // start of inline asm
	asm("mov eax, [a]"); // move a into eax
	asm("add eax, [b]"); // addict b and eax 
	asm("mov [c], eax"); // move result of a+b into c
	asm(".att_syntax noprefix"); // end of inline asm

	printf("\nResult: %d\n", c);
	return 0;
}

int sub()
{
	printf("\n1st number: \n");
	scanf("%d", &a);

	printf("\n2nd number: \n");
	scanf("%d", &b);

	asm(".intel_syntax noprefix");
	asm("mov eax, [a]");
	asm("sub eax, [b]");
	asm("mov [c], eax");
	asm(".att_syntax noprefix");

	printf("\nResult: %d\n", c);
	return 0;


}

int multi()
{
	printf("\n1st number: \n");
	scanf("%d", &a);

	printf("\n2nd number: \n");
	scanf("%d", &b);

	asm(".intel_syntax noprefix");
	asm("mov eax, [a]");
	asm("mov ebx, [b]");
	asm("mul ebx");
	asm("mov [c], eax");
	asm(".att_syntax noprefix");

	printf("\nResult: %d\n", c);
	return 0;
}

int divi()
{	
	printf("\n1st number: \n");
	scanf("%d", &a);

	printf("\n2nd number: \n");
	scanf("%d", &b);

	asm(".intel_syntax noprefix");
	asm("mov ax, [a]"); // 'a' is dividend
	asm("mov bl, [b]"); // 'b' is divisor
	asm("div bl");
	asm("mov [c], ax");
	asm(".att_syntax noprefix");

	printf("\nResult: %d\n", c);
	return 0;
}
