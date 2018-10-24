#include "graphics.h"
#include "math.h"
#include "stdio.h"

typedef struct {
	int x,y;
} point;

const float PI = 3.141592653589;
const int endAngle = 1080;
const point pointInit = {0,100};
const int xMagnifier = 5;
const int yMagnifier = 75;

float degToRad (int degree) {
	return degree*PI/180;
}

int main () {
	point currentPoint = pointInit;

	for (int i = 0; i < endAngle; i++) {	 
		drawLine(currentPoint.x, currentPoint.y, currentPoint.x += xMagnifier,	currentPoint.y = roundf(sin(degToRad(i*xMagnifier))*yMagnifier) + pointInit.y);
		//printf("%d %d %f \n", currentPoint.x, currentPoint.y, roundf(sin(degToRad(i))*yMagnifier)+pointInit.y); 
		//currentPoint.x = currentPoint.x + xMagnifier;
		//currentPoint.y = roundf(sin(degToRad(i*xMagnifier))*yMagnifier) + pointInit.y;
	}

	return 0;
}

