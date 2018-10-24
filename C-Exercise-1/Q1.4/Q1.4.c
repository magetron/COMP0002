#include "graphics.h"
#include "math.h"

typedef struct {
	int x,y;
} point;

const float	PI = 3.141592653589;
const float 	heptagonAngle = 128.42857143;

const int 	sideLength = 75;
const point	startPoint = {200,200};

float sideSin (float angle) {
	return sideLength * (sin(angle/180*PI));
}

float sideCos (float angle) {
	return sideLength * (cos(angle/180*PI));
}


int main () {
	point currentPoint;	
	
	//printf("%f %f\n", side_sin,side_cos);
	drawLine(startPoint.x,		startPoint.y,	currentPoint.x = startPoint.x+sideLength,		currentPoint.y = startPoint.y);

	drawLine(currentPoint.x,	currentPoint.y,	currentPoint.x += roundf(sideCos(180-heptagonAngle)),	currentPoint.y -= roundf(sideSin(180-heptagonAngle)));
	drawLine(currentPoint.x,	currentPoint.y,	currentPoint.x -= roundf(sideSin(270-2*heptagonAngle)),	currentPoint.y -= roundf(sideCos(270-2*heptagonAngle)));
	drawLine(currentPoint.x,	currentPoint.y, currentPoint.x -= roundf(sideCos(3*heptagonAngle-360)),	currentPoint.y -= roundf(sideSin(3*heptagonAngle-360)));

	drawLine(startPoint.x,		startPoint.y,	currentPoint.x = startPoint.x - roundf(sideCos(180-heptagonAngle)),	currentPoint.y = startPoint.y - roundf(sideSin(180-heptagonAngle)));
	drawLine(currentPoint.x,	currentPoint.y,	currentPoint.x += roundf(sideSin(270-2*heptagonAngle)),	currentPoint.y -= roundf(sideCos(270-2*heptagonAngle)));
	drawLine(currentPoint.x,	currentPoint.y, currentPoint.x += roundf(sideCos(3*heptagonAngle-360)), currentPoint.y -= roundf(sideSin(3*heptagonAngle-360)));

	//printf("%d %d", currentPoint.x,currentPoint.y);
	return 0;
}

