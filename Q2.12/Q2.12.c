#include "graphics.h"
#include "stdio.h"
#include "math.h"

typedef struct {
	int x,y;
} point;

const float 	PI = 3.141592653589;
const point 	origin = {250,150};
const float   	xGap = 1;
const int	xLength = 50;
const float 	yGap = 0.5;
const int	yLength = 50;
const int	markerLength = 10;
const int	maxStringLength = 256;
const int 	stringHeight = 8;

void drawXAxis(point origin) {
	drawLine(0,origin.y,origin.x * 2,origin.y);
	return;
}

void drawYAxis(point origin) {
	drawLine(origin.x,0,origin.x,origin.y * 2);
	return;
}

void drawXAxisMarker(point origin,float xGap,int xLength,int markerLength) {
	float x = 0;
	for (int i = origin.x + xLength; i < origin.x * 2; i += xLength) {
		x += xGap;
		drawLine(i,origin.y,i,origin.y + markerLength);
		char strToPrint[maxStringLength];
		sprintf(strToPrint,"%g", x);
		drawString(strToPrint,i - 3,origin.y + markerLength + stringHeight);
	}
	x = 0;
	for (int i = origin.x - xLength; i > 0; i -= xLength) {
		x -= xGap;
		drawLine(i, origin.y,i,origin.y + markerLength);
		char strToPrint[maxStringLength];
		sprintf(strToPrint,"%g", x);
		drawString(strToPrint,i - 3,origin.y + markerLength + stringHeight);
	}
	return;
}

void drawYAxisMarker(point origin,float yGap,int yLength,int markerLength) {
	float y = 0;
	for (int i = origin.y - yLength; i > 0; i -= yLength) {
		y += yGap;
		drawLine(origin.x,i,origin.x + markerLength,i);
		char strToPrint[maxStringLength];
		sprintf(strToPrint,"%g", y);
		drawString(strToPrint,origin.x + markerLength,i + stringHeight / 2);
	}
	y = 0;
	for (int i = origin.y + yLength; i < origin.y * 2; i += yLength) {
		y -= yGap;
		drawLine(origin.x,i,origin.x + markerLength,i);
		char strToPrint[maxStringLength];
		sprintf(strToPrint,"%g", y);
		drawString(strToPrint,origin.x + markerLength,i + stringHeight / 2);
	}
	return;
}

void drawSin(point origin,float xMagnifier,float yMagnifier) {
	point prev = origin;
	float x;
	for (float i = 0.03125; i <= 2; i += 0.03125) {
	//	printf("%f\n",i * PI);
		x = i * PI;
		drawLine(prev.x, prev.y, prev.x = origin.x + (int)(x * xMagnifier), prev.y = origin.y - (int)(sin(x) * yMagnifier));
	}
	prev = origin;
	for (float i = -0.03125; i >= -2; i -= 0.03125) {
		x = i * PI;
		drawLine(prev.x, prev.y, prev.x = origin.x + (int)(x * xMagnifier), prev.y = origin.y - (int)(sin(x) * yMagnifier));
	}
	return;
}

void drawCos(point origin,float xMagnifier,float yMagnifier) {
	point prev = {origin.x,origin.y - yMagnifier * 1};
	float x;
	for (float i = 0.03125; i <= 2; i += 0.03125) {
	//	printf("%f\n",i * PI);
		x = i * PI;
		drawLine(prev.x, prev.y, prev.x = origin.x + (int)(x * xMagnifier), prev.y = origin.y - (int)(cos(x) * yMagnifier));
	}
	prev.x = origin.x;
	prev.y = origin.y - yMagnifier * 1;
	for (float i = -0.03125; i >= -2; i -= 0.03125) {
		x = i * PI;
		drawLine(prev.x, prev.y, prev.x = origin.x + (int)(x * xMagnifier), prev.y = origin.y - (int)(cos(x) * yMagnifier));
	}
	return;
}

void drawTan(point origin,float xMagnifier,float yMagnifier) {
	point prev = origin;
	float x;
	for (float i = 0; i <= 2; i += 0.00005) {
	//	printf("%f\n",i * PI);
		x = i * PI;
		drawLine(prev.x = origin.x + (int)(x * xMagnifier), prev.y = origin.y - (int)(tan(x) * yMagnifier),prev.x,prev.y);
	}
	for (float i = 0; i >= -2; i -= 0.00005) {
		x = i * PI;
		drawLine(prev.x = origin.x + (int)(x * xMagnifier), prev.y = origin.y - (int)(tan(x) * yMagnifier),prev.x,prev.y);
	}
	return;
}

int main () {
	drawXAxis(origin);
	drawYAxis(origin);
	drawXAxisMarker(origin,xGap,xLength,markerLength);
	drawYAxisMarker(origin,yGap,yLength,markerLength); 
	float xMagnifier = (float)(xLength / xGap);
	float yMagnifier = (float)(yLength / yGap);
	setColour(red);
	drawSin(origin,xMagnifier,yMagnifier);
	setColour(blue);
	drawCos(origin,xMagnifier,yMagnifier);
	setColour(yellow);
	drawTan(origin,xMagnifier,yMagnifier);
	return 0;
}


