#include "graphics.h"

int main() {
	drawLine(60,25,110,25);
	drawLine(110,25,145,60);
	drawLine(145,60,145,110);
	drawLine(145,110,110,145);
	drawLine(110,145,60,145);
	drawLine(60,145,25,110);
	drawLine(25,110,25,60);
	drawLine(25,60,60,25);
	return 0;
}
