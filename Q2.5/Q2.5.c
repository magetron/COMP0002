#include "stdio.h"


int main () {
	for (int i = 6; i >= 1; i--) {
		for (int j = 0; j < 6 - i; j++) printf(" ");
		for (int j = 0; j < i; j++) printf("*");
		printf("\n");
	}
	return 0;
}
