#include "stdio.h"
#include "string.h"
#include "stdlib.h"

int num, a, b, c;

const int maxStringLength = 256;

void seperateNum (int inNum) {
	a = inNum / 100;
	b = inNum % 100 / 10;
	c = inNum % 10;
}

char *readNum (int digit) {
	char *r = malloc(sizeof(char) * maxStringLength);
	switch (digit) {
		case 1: r = "one"; break;
		case 2: r = "two"; break;
		case 3: r = "three"; break;
		case 4: r = "four"; break;
		case 5: r = "five"; break;
		case 6: r = "six"; break;
		case 7: r = "seven"; break;
		case 8: r = "eight"; break;
		case 9: r = "nine"; break;
	}
	return r;
}

char *readNumH (int b, int c) {
	char *rr = malloc(sizeof(char) * maxStringLength);
	switch (b) {
		case 0 : 
			rr = readNum(c);
			break;
		case 1 :
			switch (c) {
				case 0 : rr = "ten"; break;;
				case 1 : rr = "eleven"; break;
				case 2 : rr = "twelve"; break;
				case 3 : rr = "thirteen"; break;
				case 4 : rr = "fourteen"; break;
				case 5 : rr = "fifteen"; break;
				case 6 : rr = "sixteen"; break;
				case 7 : rr = "seventeen"; break;
				case 8 : rr = "eighteen"; break;
				case 9 : rr = "ninteen"; break;
			}
			break;
		case 2 : strcat(rr, "twenty "); strcat(rr, readNum(c)); break;
		case 3 : strcat(rr, "thirty "); strcat(rr, readNum(c)); break;
		case 4 : strcat(rr, "fourty "); strcat(rr, readNum(c));     break;
		case 5 : strcat(rr, "fifty "); strcat(rr, readNum(c));     break;
		case 6 : strcat(rr, "sixty "); strcat(rr, readNum(c));   break;
		case 7 : strcat(rr, "seventy "); strcat(rr, readNum(c));   break;
		case 8 : strcat(rr, "eighty "); strcat(rr, readNum(c)); break;
		case 9 : strcat(rr, "ninty "); strcat(rr, readNum(c));  break;
	}                     
	return rr;            
}




int main () {
	scanf("%d", &num);
	if ( (num >= 0) && (num <= 999) ) {
		seperateNum(num);
		if (a > 0) {
			printf("%s hundred", readNum(a));
			if ( (b > 0) || (c > 0) ) {
			printf(" and %s\n", readNumH(b,c));
			} else printf("\n");
		} else {
			if ( (b > 0) || (c > 0) ) {
				printf("%s\n", readNumH(b,c));
			} else printf("zero\n");
		}
	} else {
		printf("ERROR: input invalid");
	}
	return 0;
}
