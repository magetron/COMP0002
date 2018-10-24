#include "stdio.h"

void putLine() {
	printf("*****\n");
	return;
}

int main () {
	for (int i = 0; i <= 4; i++) {
		for (int j = 0; j < i; j++) printf(" ");
		putLine();
	}
	for (int i = 3; i >= 0; i--) {
		for (int j = 0; j < i; j++) printf(" ");
		putLine();
	}
	return 0;
}
