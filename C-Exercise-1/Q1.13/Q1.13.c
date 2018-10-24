#include "stdlib.h"
#include "graphics.h"

const int height = 300;
const int width = 500;
const int iteration_max = 50;

double sqr(double x) {
	return x*x;
}

int main () {
	for (int row = 0; row < height; row++ ) {
		for (int col = 0; col < width; col++) {
			double c_re = (col - width/2.0)*4.0/width;
			double c_im = (row - height/2.0)*4.0/width;

			double x = 0;
			double y = 0;
			int iteration = 0;
			
			while (sqr(x)+sqr(y) <= 4 && iteration < iteration_max) {
				double x_new = sqr(x) - sqr(y) + c_re;
				y = 2 * x * y + c_im;
				x = x_new;
				iteration++;
			}

			if (iteration >= iteration_max) drawLine(col, row, col, row);

		}
	}
	return 0;
}

