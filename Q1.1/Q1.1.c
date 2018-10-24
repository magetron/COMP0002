// Written by <Patrick Wu 1st Oct 2018>
// This program displays my name

#include<stdio.h>
#include<string.h>

int main() {
	char myName[] = "Patrick Wu";
	printf("Hello, my name is %s\n", myName);

	int index = strlen(myName) - 1;
	do {
		printf("%c",myName[index]);
		index = index - 1;
	} while (index >= 0);

	printf("\n");
	return 0;
}
