#include "string.h"
#include "stdio.h"

int d = 0;
int m = 0;
int y = 0;


void init () {
	char tmp = ' ';
	int pos = 0;
	do {
		scanf("%c", &tmp);
		//printf("tmp = %c\n",tmp);
		if (tmp != '\n') {
			if (tmp == '-') pos++; else 
				if (pos == 0) d = d * 10 + tmp - '0';
				else if (pos == 1) m = m * 10 + tmp - '0';
				else if (pos == 2) y = y * 10 + tmp - '0';
		}
		//printf("pos = %d, d = %d, m = %d, y = %d\n",pos, d, m ,y);
	} while (tmp != '\n');
	return;	
}	

int isLeap (int y) {
	if ((y % 4 == 0) && (y % 100 != 0)) return 1;
	else if (y % 400 == 0) return 1;
	return 0;
}

int isValid (int d, int m, int y) {
	  


int main () {
	init();
	printf("%d %d %d", d, m, y);
	return 0;
}
