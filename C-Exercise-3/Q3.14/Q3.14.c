#include "string.h"
#include "stdio.h"

const int dd 	= 1;
const int mm 	= 1;
const int yy 	= 1970;
const int ddd	= 4;
// Unix Time Epoch

int d[2] = {0, 0};
int m[2] = {0, 0};
int y[2] = {0, 0};

int init (int *d, int *m, int *y) {
	int pos = 0;
	char tmp = ' ';
	do {
		scanf("%c", &tmp);
		//printf("tmp = %c\n",tmp);
		if (tmp != '\n') {
			if (tmp == '-') pos++; else 
				if (pos == 0) *d = *d * 10 + tmp - '0';
				else if (pos == 1) *m = *m * 10 + tmp - '0';
				else if (pos == 2) *y = *y * 10 + tmp - '0';
		}
		//printf("pos = %d, d = %d, m = %d, y = %d\n",pos, *d, *m ,*y);
	} while (tmp != '\n');
	return pos;	
}	

int is_leap (int y) {
	if ((y % 4 == 0) && (y % 100 != 0)) return 1;
	else if (y % 400 == 0) return 1;
	return 0;
}

int is_knuckle (int m) {
	if ((m == 1) || (m == 3) || (m == 5) || (m == 7) || (m == 8) || (m == 10) || (m == 12)) return 1;
	else return 0;
}

int is_valid (int d, int m, int y) {
	if ((is_knuckle(m)) && 	(d >= 1) && (d <= 31)) return 1;
	else if ((m != 2) && 	(d >= 1) && (d <= 30)) return 1;
	else if ((is_leap(y))&& (d >= 1) && (d <= 29)) return 1;
	else if (		(d >= 1) && (d <= 28)) return 1;
	else return 0;
}

int day_of_date (int d[2], int m[2], int y[2]) {
	int p_d = dd;
	int p_m = mm;
	int p_y = yy;
	int ans = 0;
	int st_count = 0;
	//int p_dd = ddd;
	while (!( (p_d == d[1]) && (p_m == m[1]) && (p_y == y[1]) )) {
		
		if ( (p_d == d[0]) && (p_m == m[0]) && (p_y == y[0]) ) st_count = 1;
		if ( st_count ) ans ++;

		p_d ++;
		if ( 		(is_knuckle(p_m))  ) { if (p_d > 31) {	p_d = 1; p_m ++; } }
		else if ( 	(p_m != 2) 	   ) { if (p_d > 30) {	p_d = 1; p_m ++; } }
		else if (	(is_leap(p_y))     ) { if (p_d > 29) {	p_d = 1; p_m ++; } }
		else { if (p_d > 28) { p_d = 1; p_m ++; } }
		if (p_m > 12) {
			p_m = 1;
			p_y ++;
		}

		//p_dd ++;
		//if (p_dd > 6) p_dd = 0;
		//printf("%d %d %d\n", p_d, p_m, p_y);
	}
	return ans;
}

char *print_day(int dd) {
	switch (dd) {
		case 0 :
			return "Sunday"; break;
		case 1 :
			return "Monday"; break;
		case 2 :
			return "Tuesday"; break;
		case 3 :
			return "Wednesday"; break;
		case 4 :
			return "Thursday"; break;
		case 5 :
			return "Friday"; break;
		case 6 :
			return "Saturday"; break;
	}
	return "ERROR";
}

char *print_month(int m) {
	switch (m) {
		case 1 :
			return "January"; break;
		case 2 :
			return "February"; break;
		case 3 :
			return "March"; break;
		case 4 :
			return "April"; break;
		case 5 :
			return "May"; break;
		case 6 :
			return "June"; break;
		case 7 :
			return "July"; break;
		case 8 :
			return "August"; break;
		case 9 :
			return "September"; break;
		case 10:
			return "October"; break;
		case 11:
			return "November"; break;
		case 12:
			return "December"; break;
	}
	return "ERROR";
}

char *print_leap_year(int y) {
	if (is_leap(y)) return "is a leap year"; else return "isn't a leap year";
}

int main () {
	if (init(&d[0], &m[0], &y[0]) > 2) {
		printf("ERROR: invalid input");
		return 1;
	}
	if (init(&d[1], &m[1], &y[1]) > 2) {
		printf("ERROR: invalid input");
		return 1;
	}
	if ((is_valid(d[0], m[0], y[0])) && (is_valid(d[1], m[1], y[1]))) printf("There are %d days between %d %s %d and %d %s %d.\n", day_of_date(d, m, y), d[0], print_month(m[0]), y[0], d[1], print_month(m[1]), y[1]);
	else printf("No valid date");

	//printf("%d %d %d", d, m, y);
	return 0;
}
