#include "stdio.h"
#include "string.h"

const int maxStringLength = 256;

char num[maxStringLength];
char numCompare[maxStringLength];

int main () {
	fgets(num, sizeof(num), stdin);
	int len = strlen(num);
	char tmpC;
	for (int i = 0; i < strlen(num); i++) {
		tmpC = num[i];
		sprintf(numCompare, "%c", tmpC);
	}
	if (strcmp(numCompare,num)) printf("yes\n"); else printf("no\n");
	return 0;
}

