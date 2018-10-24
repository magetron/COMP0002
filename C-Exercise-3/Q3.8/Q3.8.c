#include "stdio.h"

int calc_f(int a) {
	if ((a == 0) || (a == 1)) return 1;
	int s = 1;
	for (int i = 2; i <= a; i++) s *= i;
	return s;
}

int calc_f_sum(int n) {
	int f_sum = 0;
	int tmp;
	while (n > 0) {
		tmp = n % 10;
		n /= 10;
		f_sum += calc_f(tmp);
	}
	return f_sum;
}

int is_strong(int n) {
	if (n <= 0) return 0; else 
		if (n == calc_f_sum(n)) return 1; else return 0;
}

int a,b;

int main () {
	printf("range (a,b) = ");
	scanf("%d%d", &a, &b);
	for (int i = a; i <= b; i++) if (is_strong(i)) printf("%d ",i);
	printf("\n");
	return 0;
}
