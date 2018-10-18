#include "stdio.h"
#include "math.h"

int isPrime(int test) {
	for (int i = 2; i <= roundf(sqrt(test)); i++ ) if (test % i == 0) return 0;
	return 1;
}

int main () {
	int n;
	scanf("%d", &n);
	if (n <= 1) printf("no"); else 
		if (isPrime(n)) printf("yes"); else printf("no");
	return 0;
}
