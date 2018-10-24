#include "stdio.h"
#include "math.h"


int isTriangle(int a, int b, int c) {
	if ((a + b > c) && (b + c > a) && (c + a > b)) return 1;
	else return 0;
}

int main () {
	int a,b,c;
	scanf("%d%d%d",&a, &b, &c);
	if (isTriangle(a, b, c)) {
		int p = a + b + c;
		float s = (float)p / 2;
		float area = sqrt(s * (s - a) * (s - b) * (s - c));
		printf("perimeter = %d\narea = %f\n", p, area);
	} else {
		printf("ERROR: not valid triangle");
	}
	return 0;
}
