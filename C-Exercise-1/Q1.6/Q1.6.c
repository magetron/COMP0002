#include "graphics.h"
#include "math.h"

typedef struct {
	int x,y;
} point;

const point 	circleInit = {50,50};
const int	circleDiameter = 200;

int squareEdgeLengthFromDiameter(int diameter) {
	return roundf(diameter/(sqrt(2)));
}

point squareInitFromCircle(point circleInit, int diameter) {
	point squareInit = {circleInit.x+roundf(diameter*(sqrt(2)-1)/(2*sqrt(2))), circleInit.y+roundf(diameter*(sqrt(2)-1)/(2*sqrt(2)))};
	return squareInit;
}

int main () {
	drawArc(circleInit.x,		circleInit.y,		circleDiameter,		circleDiameter,0,360);
	
	point squareInit = squareInitFromCircle(circleInit,circleDiameter);
	
	int squareEdgeLength = squareEdgeLengthFromDiameter(circleDiameter);

	drawRect(squareInit.x,		squareInit.y,		squareEdgeLength,	squareEdgeLength);

	return 0;
}
