// Written by <Patrick Wu 1st Oct 2018>
// This program displays my name

#include<stdio.h>
#include<string.h>

void reversePrint(char stringToReverse[]) {
	int index = strlen(stringToReverse) - 1;
	do {
		printf("%c",stringToReverse[index]);
		index--;
	} while (index >= 0);
	printf("\n");
}

int main() {
	char myName[] = "Patrick Wu";
	char myDept[] = "Dept. of Computer Science";
	char myAddr[] = "Malet Place Engineering Building";
	
	printf("Hello, my name is %s\n", myName);
	printf("I belong to the %s\n", myDept);
	printf("I study in the %s\n", myAddr);

	reversePrint(myName);
	reversePrint(myDept);
	reversePrint(myAddr);
}
