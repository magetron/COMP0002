#include "stdio.h"

void putDot () {
	printf("*");
	return;
}

void putSpace () {
	printf(" ");
	return;
}

int main () {
	for (int i = 1; i <= 5; i++) {
		for (int j = 1; j <= 5; j++)
			if ( !((i >= 2) && (i <= 4) && (j >= 2) && (j <= 4)) ) putDot();
			 else putSpace();
		printf("\n");
	}
	return 0;
}

