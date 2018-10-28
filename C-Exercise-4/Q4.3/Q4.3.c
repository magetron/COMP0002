#include "stdio.h"
#include "string.h"
#include "stdlib.h"

int cmp (const void *p, const void *q) {
	int l = *(int *)p;
	int r = *(int *)q;
	return l - r;
}

int *sort (int *n, int size) {
	int *ans = malloc(sizeof(int) * size);
	memcpy(ans, n, sizeof(int) * size);
	qsort(ans, size, sizeof(int), cmp);
	//for (int i = 0; i < size; i++) printf("%d ", ans[i]);
	return ans;
}

int list[] = {1, 2, 4, 5, 6, 3, 123, 15, 125, 99234, 234};

int main () {
	int size = sizeof(list) / sizeof(int);
	int *ans;
	ans = sort(list, size);
	for (int i = 0; i < 11; i++) printf("%d ", ans[i]);
	free(ans);
	return 0;
}		
