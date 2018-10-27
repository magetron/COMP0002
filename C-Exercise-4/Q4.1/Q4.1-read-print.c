#include "stdio.h"
#include "string.h"

const int maxStringLength = 256;

char* stringCopy(char *s) {
	return(s);
}

int main () {
	char str[maxStringLength];
	fgets(str, maxStringLength, stdin);
	printf("%s\n", stringCopy(str));
	return 0;
}
