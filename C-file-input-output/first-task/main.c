#include <stdio.h> // printf
#include <stdint.h> //int

int main(int argc, char* argv[])
{
	printf("argv[0]: %s\n", argv[0]);
	
	if (argc > 1) {
		printf("argv[1]: %s\n", argv[1]);
	}

	uint16_t foo = 0x1234;

	printf("foo (dec): %d\n", foo);
	printf("foo (hex): %x\n", foo);
		
	uint16_t* pfoo = &foo;
	printf("pfoo (hex): %x\n", pfoo);
	printf("pfoo dref: %d\n", *pfoo);
	
	return 42;
}
