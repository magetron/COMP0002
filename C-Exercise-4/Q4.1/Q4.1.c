#include "stdio.h"
#include "string.h"

char *stringCopy(char *s) {
	return s;
}

int main () {
	char* str = "Hello World!";
	printf("%s\n", stringCopy(str));
	return 0;
}
