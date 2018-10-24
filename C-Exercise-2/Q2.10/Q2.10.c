#include "stdio.h"


const int height = 8;

void printHash() {
	printf("#");
	return;
}

void printStar() {
	printf("*");
	return;
}

void printSpace() {
	printf(" ");
	return;
}

int main () {
	for (int i = 1; i <= height - 1; i++) printStar();
	printf("\n");
	
	for (int i = 1; i <= height - 2; i++) {
		printHash();
		for (int j = 1; j < i - 1; j++) printSpace();
		if (!(i == 1)) printHash();

		printStar();
		for (int j = height - i - 3; j > 0; j--) printSpace();
		if (!(i == height - 2)) printStar();

		printf("\n");
	}

	for (int i = 1; i <= height - 1; i++) printHash();
	printf("\n");

	return 0;
}
