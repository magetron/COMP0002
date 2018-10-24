#include "stdio.h"
#include "string.h"
#include "graphics.h"

typedef struct {
	int x,y;
} point;

const int sqr_l = 10;
const int pat_l = 20;
const point init = {10, 10};

int p[pat_l][pat_l]; 

void generate(int pat_l) {
	memset(p, 0, sizeof(p));
	for (int j = 0; j < pat_l; j++) 
		switch (j % 10) {
			case 0:
				p[0][j] = 1; break;
			case 1:
				p[0][j] = 1; break;
			case 2:
				p[0][j] = 1; break;
			case 3:
				p[0][j] = 0; break;
			case 4:
				p[0][j] = 1; break;
			case 5:
				p[0][j] = 0; break;
			case 6:
				p[0][j] = 0; break;
			case 7:
				p[0][j] = 0; break;
			case 8:
				p[0][j] = 1; break;
			case 9:
				p[0][j] = 0; break;
		}
	for (int i = 1; i < pat_l; i++) {
		for (int j = 0; j < pat_l - 3; j++) p[i][j] = p[i - 1][j + 3];
		for (int j = pat_l - 3; j < pat_l; j++) p[i][j] = p[i - 1][j - pat_l + 3];
	}
	return;
}

void drawBlue(point a, int sqr_l) {
	setColour(blue);
	fillRect(a.x, a.y, sqr_l, sqr_l);
	setColour(black);
}

void drawYellow(point a, int sqr_l) {
	setColour(yellow);
	fillRect(a.x, a.y, sqr_l, sqr_l);
	setColour(black);
}

void draw(int pat_l, point init) {
	point pointer = {init.x, init.y + sqr_l};
	for (int i = 0; i < pat_l; i++) {
		for (int j = 0; j < pat_l; j++) {
			if (p[i][j]) drawBlue(pointer, sqr_l); else drawYellow(pointer, sqr_l);
			pointer.x += sqr_l;
		}
		pointer.x = init.x;
		pointer.y += sqr_l;
	}
	return;
}

int main () {
	generate(pat_l);
	
	/*for (int i = 0; i < pat_l; i++) {
		for (int j = 0; j < pat_l; j++) printf("%d",p[i][j]);
		printf("\n");
	} */

	draw(pat_l, init);
	return 0;
}
