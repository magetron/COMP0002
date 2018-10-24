#include "stdio.h"

int isValidRange(int a, int b) {
	if (a > b) return 0; else return 1;
}

int ans = 1;

int main () {
	int a,b;
	printf("range = ");
	scanf("%d%d", &a, &b);
	if (isValidRange(a,b)) {
		for (int i = a; i <= b; i++) ans *= i;
		printf("ans = %d\n", ans);
	} else {
		printf("ERROR : invalid input range");
	}
	return 0;
}
