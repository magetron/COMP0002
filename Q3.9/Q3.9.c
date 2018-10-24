#include "stdio.h"
#include "stdlib.h"
#include "string.h"

const int max_str_length = 5;

int h,m;

char* convert_h_12 (int h, int m) {
	
	int new_h;
	
	char *s = malloc(sizeof(char) * max_str_length);
	char *sm = malloc(sizeof(char) * max_str_length);
	char *sn = malloc(sizeof(char) * max_str_length);
	
	if (h == 0) {
		new_h = 12;
		sn = "am";
	} else if (h == 12) {
		new_h = h;
		sn = "pm";
	} else if ((h > 12) && (h < 24)) {
		new_h = h - 12;
		sn = "pm";
	} else if ((h > 0) && (h < 12)) {
		new_h = h;
		sn = "am";
	}
	
	sprintf(s, "%d", new_h);
	if (m >= 10) sprintf(sm, "%d", m); else sprintf(sm, "0%d", m);
	
	strcat(s,":");
	strcat(s,sm);
	strcat(s,sn);
	
	return s;
}

int main() {
	scanf("%d:%d", &h, &m);
	if ((h >= 0) && (h <= 23) && (m >= 0) && (m <= 59)) printf("%s\n",convert_h_12(h,m));
		else printf("ERROR : invalid time");
	return 0;
}
