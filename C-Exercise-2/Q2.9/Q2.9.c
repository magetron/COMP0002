#include "stdio.h"

void putDot() {
	printf("*");
	return;
}

int main () {
	for (int i = 0; i < 5; i++) {
		putDot();
		for (int j = 0; j < i; j++) printf(" ");
		if (!(i == 0)) putDot();
		printf("\n");
	}
	for (int i = 3; i >= 0; i--) {
		putDot();
		for (int j = 0; j < i; j++) printf(" ");
		if (!(i == 0)) putDot();
		printf("\n");
	}
	return 0;
}

