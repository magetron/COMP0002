#include "graphics.h"
#include "math.h"
#include "stdlib.h"
#include "stdio.h"

typedef struct {
	int x,y;
} point;

typedef struct {
	point one,two;
} line;

const float	sin60 = 0.86602540378;
const float 	cos60 = 0.5;
const point 	initA = {200,0};
const int	initSideLength = 243;
const int 	recursiveTimes = 2;

line ab,bc,ca;

void drawL (line lineToDraw) {
	drawLine(lineToDraw.one.x, lineToDraw.one.y, lineToDraw.two.x, lineToDraw.two.y);
	return;
}

void eraseL (line lineToErase) {
	setColour(white);
	drawLine(lineToErase.one.x, lineToErase.one.y, lineToErase.two.x, lineToErase.two.y);
	setColour(black);
	return;
}

void initLine (point initA) {
	ab.one = initA;
	ab.two.x = initA.x - initSideLength * cos60;
	ab.two.y = initA.y + initSideLength * sin60;
	bc.one = ab.two;
	bc.two.x = initA.x + initSideLength * cos60;
	bc.two.y = initA.y + initSideLength * sin60;
	ca.one = bc.two;
	ca.two = ab.one; 
	drawL(ab);
	drawL(bc);
	drawL(ca);
	return;
}

point newPointA (line inLine) {
	point tmpVector,tmpPoint;
	tmpVector.x = inLine.two.x - inLine.one.x;
	tmpVector.y = inLine.two.y - inLine.one.y;
	tmpPoint.x = roundf(tmpVector.x * cos60 + tmpVector.y * sin60 + inLine.one.x);
	tmpPoint.y = roundf(- tmpVector.x * sin60 + tmpVector.y * cos60 + inLine.one.y);
	return tmpPoint;
}


int drawIt (line inLine, int count) {
	if (count < recursiveTimes) {
		int lineX = inLine.two.x - inLine.one.x;
		int lineY = inLine.two.y - inLine.one.y;
		
		point newPointB = {roundf(inLine.one.x + 2 * (float)lineX / 3), roundf(inLine.one.y + 2 * (float)lineY / 3)};
		point newPointC = {roundf(inLine.one.x + (float)lineX / 3), roundf(inLine.one.y + (float)lineY / 3)};
		line eraseLine = {newPointB, newPointC};
		eraseL (eraseLine);
	
		point newPoint = newPointA(eraseLine);
		line  newLine1 = {newPoint, newPointB};
		line  newLine2 = {newPointC, newPoint};

		drawL(newLine1);
		drawL(newLine2);

		line oldLine1 = {inLine.one, newPointC};
		line oldLine2 = {newPointB, inLine.two};

		drawIt(newLine1, count + 1);
		drawIt(newLine2, count + 1);
		drawIt(oldLine1, count + 1);
		drawIt(oldLine2, count + 1);

	} else {
		return 0;
	}
	return 0;
}



int main () {
	initLine (initA);
	drawIt (ab,1);
	drawIt (bc,1);
	drawIt (ca,1);
	return 0;
}
	
