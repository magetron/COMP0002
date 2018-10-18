#include "stdio.h"
#include "math.h"

int isPrime(int test) {
	if (test <= 1) return 0;
	for (int i = 2; i <= roundf(sqrt(test)); i++ ) if (test % i == 0) return 0;
	return 1;
}

int main () {
	int n;
	scanf("%d", &n);
	if (isPrime(n)) printf("yes\n"); else printf("no\n");
	return 0;
}
