#include "graphics.h"

typedef struct {
	int x,y;
} point;


void drawRec(point a, int width, int length) {
	drawRect(a.x, a.y, width, length);
	return;
}

void drawTriangle(point a, point b, point c) {
	drawLine(a.x, a.y, b.x, b.y);
	drawLine(b.x, b.y, c.x, c.y);
	drawLine(c.x, c.y, a.x, a.y);
	return;
}


int main () {
	point a = {100,100};
	drawRec(a, 50, 100);
	point b = {150, 100};
	point c = {100, 50};
	drawTriangle(a,b,c);
	return 0;
}

