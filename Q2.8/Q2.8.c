#include "stdio.h"

int main () {
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 5; j++) 
			if ((j + i * 5) % 2 == 0) printf("*");
			else printf("#");
		printf("\n");
	}
	return 0;
}
