#include "stdio.h"

const int d = 1;
const int m = 1;
const int y = 1970;
// Unix Time Epoch

int day_of_date (int d, int m, int y) {
	static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };
	y -= m < 3;
	return (y + y / 4 - y / 100 + y / 400 + t[m - 1] + d) % 7;
}

int main() {
	printf("%d\n",day_of_date(d, m, y));
	return 0;
}
