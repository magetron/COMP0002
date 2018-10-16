#include "stdio.h"
#include "math.h"

int main () {
	int a,b,c;
	scanf("%d%d%d",&a, &b, &c);
	int p = a + b + c;
	float s = (float)p / 2;
	float area = sqrt(s * (s - a) * (s - b) * (s - c));
	printf("perimeter = %d\narea = %f\n", p, area);
	return 0;
}
