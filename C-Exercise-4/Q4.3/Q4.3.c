#include "stdio.h"
#include "stdlib.h"

//const int max_array_length = 1024;

int cmp (const void *p, const void *q) {
	int l = *(int *)p;
	int r = *(int *)q;
	return l - r;
}

int *sort (int *n) {
	int tmp[] = *n;
	qsort(tmp, sizeof(tmp) / sizeof(int), sizeof(int), cmp);
	return *tmp;
}

int list[] = {1, 2, 4, 5, 6, 3, 123, 15, 125, 99234, 234};

int main () {
	list = sort(list);
	for (int i = 0; i < sizeof(list) / sizeof(int); i++)
		printf("%d ", list[i]);
	return 0;
}

		
