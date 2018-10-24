#include "stdio.h"

int main () {
	int i = 1;
	do {
		printf("%d * 13 = %d\n", i, i*13);
		i++;
	} while (i <= 13);
	return 0;
}
