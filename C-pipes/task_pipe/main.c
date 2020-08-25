//cat /etc/passwd | cut -d':' -f1 | sort | uniq
/* 
	init 
	cut .. /etc/passwd
	int
	sort
	init
	uniq

*/
#include <unistd.h>
#include<err.h>
#include <sys/types.h>
#include<stdlib.h>

int main() {
	int a[2];
	if(pipe(a) == -1 ) {
		err(1, "Cannot pipe");
	}
	
	pid_t p1=fork();
	if( p1 == -1) {
		err(2, "Cannot fork");
	}

	if ( p1 == 0 ) { //in child (cut)
		close(a[0]);
		if(dup2(a[1], 1) == -1) {
			err(3, "Cannot dup");
		}
		if(execlp("cut", "cut", "-d:","-f1","/etc/passwd",(char*)NULL) == -1)
		{
			err(4, "Cannot exec cut");
		}
	}
	
	//parent
	close(a[1]);
	int b[2];
	if (pipe(b) == -1){
		err(11,"Cannot pipe");
	}
	pid_t p2=fork();
	if (p2 == -1 ) { 
		err(5, "Cannot fork");
	}
	if (p2 == 0 ) { //in child (sort)
		if(dup2(a[0],0) == -1) {
			err(6, "Cannot dup");
		}
		close(b[0]);
		if(dup2(b[1],1) == -1) {
			err(7, "Cannot dup");
		}
		if(execlp("sort","sort",(char*)NULL) == -1 ) {
			err(8,"Cannot exec sort");
		}
	}

	
	close(b[1]);
	if(dup2(b[0],0) == -1) {
		err(9, "Cannot dup");
	}
	if(execlp("uniq","uniq",(char*)NULL) == -1) {
		err(10,"Cannot exec");
	}
	exit(0);
}
