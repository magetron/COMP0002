#include "string.h"
#include "stdio.h"

const int dd 	= 1;
const int mm 	= 1;
const int yy 	= 1970;
const int ddd	= 4;
// Unix Time Epoch

int d = 0;
int m = 0;
int y = 0;


int init () {
	int pos = 0;
	char tmp = ' ';
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

int day_of_date (int d, int m, int y) {
	int p_d = dd;
	int p_m = mm;
	int p_y = yy;
	int p_dd = ddd;
	while (!( (p_d == d) && (p_m == m) && (p_y == y) )) {
		p_d ++;
		if ( 		(is_knuckle(p_m))  ) { if (p_d > 31) {	p_d = 1; p_m ++; } }
		else if ( 	(p_m != 2) 	   ) { if (p_d > 30) {	p_d = 1; p_m ++; } }
		else if (	(is_leap(p_y))     ) { if (p_d > 29) {	p_d = 1; p_m ++; } }
		else { if (p_d > 28) { p_d = 1; p_m ++; } }
		if (p_m > 12) {
			p_m = 1;
			p_y ++;
		}
		
		p_dd ++;
		if (p_dd > 6) p_dd = 0;
		//printf("%d %d %d %d\n", p_d, p_m, p_y, p_dd);
	}
	return p_dd;
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
	if (init() > 2) {
		printf("ERROR: invalid input");
		return 1;
	}
	if (is_valid(d, m, y)) {
		printf("%d %s %d is a %s.\n", d, print_month(m), y, print_day(day_of_date(d, m, y)));
		printf("%d %s.\n", y, print_leap_year(y));
	} else printf("No valid date");

	//printf("%d %d %d", d, m, y);
	return 0;
}
