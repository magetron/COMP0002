#include "stdio.h"

int main() {
	for (int i = 0; i < 7; i++){
		for (int j = 0; j < 8; j++) 
			if ((j == 0) || (j == 7) || (i == 0) || (i == 6)) printf("*");
			else if (((j >= 2) && (j <= 5)) && ((i == 2) || (i == 4))) printf("#");
			else if (((j == 2) || (j == 5)) && (i == 3)) printf("#");
				else printf(" ");
		printf("\n");
	}
	return 0;
}
