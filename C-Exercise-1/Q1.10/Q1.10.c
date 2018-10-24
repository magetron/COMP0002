#include "graphics.h"
#include "string.h"
#include "stdio.h"

typedef struct {
	int x,y;
} point;

const point 	graphOrigin = {40,250};
const int	xLength = 300;
const int	yLength = 200;
const int	maxIntLength = 10;
const int	charLength = 9;
const int	stringHeight = 5;
const int	dataNumber = 5;
const int	maxStringLength = 256;
const int	xGapWidth = 50;

typedef struct {
	char 	category[dataNumber][maxStringLength];
	colour	colourName[dataNumber];
	int 	value[dataNumber];
} data;

data inputData = {{"CDs","DVDs","Books","Clothes","Shoes"},{blue,green,red,yellow,pink},{60,140,130,100,140}};
	
void drawAxis (int xLength, int yLength) {
	drawLine(graphOrigin.x,	graphOrigin.y,	graphOrigin.x + xLength,	graphOrigin.y);
	drawLine(graphOrigin.x,	graphOrigin.y, 	graphOrigin.x,			graphOrigin.y - yLength);
	return;
}

void drawYAxisMarker (int gapHeight, int gapValue, int gapLength) {
	point 	drawMarker = graphOrigin;
	int	drawValue = 0;
	int 	stringLength;
	char 	drawValueStr[maxIntLength];
	memset(&drawValueStr, 0, sizeof(drawValueStr));

	do {
		drawLine(drawMarker.x, drawMarker.y,	drawMarker.x - gapLength, drawMarker.y);
		sprintf(drawValueStr, "%d", drawValue);
		stringLength = strlen(drawValueStr);
		drawString(drawValueStr, drawMarker.x - stringLength*charLength - 7, drawMarker.y + stringHeight);
		
		drawMarker.y -= gapHeight;
		drawValue += gapValue;
	} while (drawMarker.y > graphOrigin.y - yLength);
	
	return;
}

void drawXAxisMarker (data drawData) {
	point	drawMarker = graphOrigin;
	drawMarker.x += (xGapWidth - strlen(drawData.category[0]) * charLength) / 2;
	drawMarker.y +=	stringHeight * 3;
	for (int i = 0; i < dataNumber; i++) {
		drawString(drawData.category[i],	drawMarker.x,	drawMarker.y);
		drawMarker.x += xGapWidth;
	}
	return;
}

void drawGraph (data drawData) {
	point	drawMarker = graphOrigin;
	for (int i = 0; i < dataNumber; i++) {
		setColour(inputData.colourName[i]);
		fillRect(drawMarker.x, drawMarker.y - inputData.value[i], xGapWidth, inputData.value[i]);
		drawMarker.x += xGapWidth;
	}
	return;
}

int main () {
	drawAxis(xLength,yLength);
	drawYAxisMarker(50,50,10);
	drawXAxisMarker(inputData);
	drawGraph(inputData);
	return 0;
}
			
	
