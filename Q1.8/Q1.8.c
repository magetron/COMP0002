#include "graphics.h"

typedef struct {
	int x,y;
} point;

const point 	ovalInit = {150,150};
const int	widthInit = 30;
const int	lengthInit = 70;
const int	widthInc = 10;
const int	lengthInc = 10;
const int	ovalToDraw = 5;

int main () {
	int width = widthInit;
	int length = lengthInit;
	
	point ovalPoint = ovalInit;

	for (int i=0; i<ovalToDraw; i++)	drawOval(ovalPoint.x -= widthInc/2,	ovalPoint.y -= lengthInc/2,	width += widthInc,	length += lengthInc);

	return 0;
}

