#include "stdio.h"

int power (int x, int y) {
	int ans = 1;
	for (int i = 0; i < y; i++) ans *= x;
	return ans;
}

int main () {
	int x,y;
	scanf("%d%d", &x, &y);
	printf("%d\n", power(x,y));
	return 0;
}
