#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<err.h>
#include<stdlib.h>
#include <unistd.h>

int main( int argc, char* argv[]) {
	if ( argc != 3 ) {
		errx(1, "Invalid number of arguments");
	}

	int fd1 = open(argv[1], O_RDONLY);
	if ( fd1 == -1 ) {
		err(2, "Cannot open %s", argv[1]);
	}

	int fd2 = open(argv[2], O_WRONLY |O_TRUNC| O_CREAT, 0600);
	if ( fd2 == -1 ) {
		err(3, "Cannot open %s", argv[2]);
	}
	
	char b;
	
	while ( read(fd1, &b, 1) == 1 ) {
		if (write(fd2, &b, 1) == -1 ) {
			err(4, "Cannot write");
		}
	}

	exit(0);	
} 
