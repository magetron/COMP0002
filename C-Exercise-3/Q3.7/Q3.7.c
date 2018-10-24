#include "stdio.h"
#include "math.h"

int isPrime(int test) {
	if (test <= 1) return 0;
	for (int i = 2; i <= roundf(sqrt(test)); i++ ) if (test % i == 0) return 0;
	return 1;
}

int a,b;

int main () {
	printf("range (a,b) = ");
	scanf("%d%d", &a, &b);
	if ( (a <= 2) && (b >= 2) ) printf("2 3\n");
	for (int i = a; i <= b; i++) {
			if ( (i % 2 == 1) && isPrime(i) && isPrime(i + 2) )
				printf("%d %d\n",i, i + 2);
	}
	return 0;
}

