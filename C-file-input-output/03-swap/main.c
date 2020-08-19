/*
	Реализирайте команда swap, разменяща съдържанието на два файла, подадени като
	входни параметри. Приемаме, че двата файла имат еднакъв брой символи. Може да
	модифицирате решението, да работи и когато нямат еднакъв брой символи.
*/
#include<stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <err.h>
#include<stdlib.h>

int main(int argc, char* argv[]) {
	if (argc != 3 ) {
		errx(1, "Wrong num of arguments");
	}

	int fd1 = open(argv[1], O_RDWR);
	if ( fd1 == -1)	{
		err(2, "cannot open %s", argv[1]);
	}

	int fd2 = open(argv[2], O_RDWR);
	if( fd2 == -1 ) {
		close(fd1);
		err(3, "cannot open %s", argv[2]);
	}

	int fd3 = open("my_temp_file", O_RDWR | O_CREAT | O_TRUNC, 0666);
	if ( fd3 == -1 ) {
	//	int save_errno = errno;
		close(fd1);
		close(fd2);
	//	errno = save_errno;
		err(4, "cannot swap");
	}
	
	
	char buff[4096];
	ssize_t read_bytes;
	while ( (read_bytes = read(fd1, &buff, sizeof(buff)))>0 ) {
		write(fd3, &buff, read_bytes);
	}

	lseek(fd1, 0, SEEK_SET);


	while ( (read_bytes = read(fd2, &buff, sizeof(buff)))>0 ) {
		write(fd1, &buff, read_bytes);
	}

	lseek(fd2, 0, SEEK_SET);
	lseek(fd3, 0, SEEK_SET);

	while ( (read_bytes = read(fd3, &buff, sizeof(buff)))>0 ) {
		write(fd2, &buff, read_bytes);
	}

	close(fd1);
	close(fd2);
	close(fd3);
	exit(0);
}
