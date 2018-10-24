#include "graphics.h"

typedef struct {
	int x,y;
} point;

void drawRectWithLine(point init, int width, int length) {
	drawLine(init.x,	init.y,		init.x+width,	init.y);
	drawLine(init.x,	init.y,		init.x,		init.y+length);
	drawLine(init.x,	init.y+length,	init.x+width,	init.y+length);
	drawLine(init.x+width,	init.y,		init.x+width,	init.y+length);
	return;
}

int main () {
	point firstRectInit,secondRectInit;
	firstRectInit.x = 30;
	firstRectInit.y = 30;
	drawRectWithLine(firstRectInit,90,50);
	
	secondRectInit.x = 150;
	secondRectInit.y = 50;
	drawRect(150,50,60,140);
	return 0;
}

