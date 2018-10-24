#include "graphics.h"
#include "math.h"

typedef struct {
	int x,y;
} point;

const int spiralDepth = 15;
const point origin = {250, 150};

int main () {
	for (int i = 1; i <= spiralDepth * 360; i++) {
		point center;
		int diameter = i / 7;
		center.x = origin.x - roundf((float)diameter / 2 );
		center.y = origin.y - roundf((float)diameter / 2 );
		drawArc(center.x,center.y,diameter,diameter,i, 1);
	}
	return 0;
}
