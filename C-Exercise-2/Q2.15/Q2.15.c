#include "stdio.h"

int width, height;
char charToUse;

void readInfo() {
	printf("width , height :");
	scanf("%d %d",&width,&height);
	printf("char :");
	scanf(" %c",&charToUse);
	return;
}

void drawRect(int width, int height, char charToUse) {
	for (int i = 0; i < height; i++){
		for (int j = 0; j < width; j++) printf("%c",charToUse);
		printf("\n");
	}
	return;
}

int main () {
	readInfo();
	drawRect(width, height, charToUse);
	return 0;
}
