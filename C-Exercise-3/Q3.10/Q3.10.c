#include "stdio.h"
#include "string.h"

const int max_s = 256;

void big1 (int a) {
	switch (a) {
		case 1 :
			printf(" *  "); break;
		case 2 :
			printf("**  "); break;
		case 3 :
			printf(" *  "); break;
		case 4 :
			printf(" *  "); break;
		case 5 :
			printf("*** "); break;
	}
	return;
}

void big2 (int a) {
	switch (a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("     * "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("*      "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void big3 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("     * "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("     * "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void big4 (int a) {
	switch(a) {
		case 1 :
			printf("*    * "); break;
		case 2 :
			printf("*    * "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("     * "); break;
		case 5 :
			printf("     * "); break;
	}
	return;
}

void big5 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("*      "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("     * "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void big6 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("*      "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("*    * "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void big7 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("    *  "); break;
		case 3 :
			printf("   *   "); break;
		case 4 :
			printf("  *    "); break;
		case 5 :
			printf(" *     "); break;
	}
	return;
}

void big8 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("*    * "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("*    * "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void big9 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("*    * "); break;
		case 3 :
			printf("****** "); break;
		case 4 :
			printf("     * "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void big0 (int a) {
	switch(a) {
		case 1 :
			printf("****** "); break;
		case 2 :
			printf("*    * "); break;
		case 3 :
			printf("*    * "); break;
		case 4 :
			printf("*    * "); break;
		case 5 :
			printf("****** "); break;
	}
	return;
}

void bigline (int a) {
	switch(a) {
		case 1 :
			printf("       "); break;
		case 2 :
			printf("       "); break;
		case 3 :
			printf("****** "); break;
		case 4:
			printf("       "); break;
		case 5:
			printf("       "); break;
	}
	return;
}



char s[max_s];
int len;

int main () {
	fgets(s ,sizeof(char) * max_s, stdin);
	len = strlen(s);
	for (int i = 1; i <= 5; i++) {
		for (int j = 0; j < len;  j++)
			switch (s[j]) {
				case '0' : 
					big0(i); break;
				case '1' :
					big1(i); break;
				case '2' :
					big2(i); break;
				case '3' :
					big3(i); break;
				case '4' :
					big4(i); break;
				case '5' :
					big5(i); break;
				case '6' :
					big6(i); break;
				case '7' :
					big7(i); break;
				case '8' :
					big8(i); break;
				case '9' :
					big9(i); break;
				case '-' :
					bigline(i); break;
			}
		printf("\n");
	}
	return 0;
}
