#include "stdio.h"
#include "math.h"
#include "stdbool.h"

typedef struct {
	int start,end;
} mode;

const mode modeA = {1,100};
const mode modeB = {1,101};
const mode modeC = {1,100};

const char modeSelect = 'c';

bool isPrime(int toTest) {
	for (int i = 2; i <= roundf(sqrt(toTest)); i++) if (toTest % i == 0) return false;
	return true;
}


int main () {
	switch(modeSelect) {
		case 'a' :
			for (int i = modeA.start; i <= modeA.end; i++) printf("%d ",i * i);
			break;
		case 'b' :
			for (int i = modeB.start; i <= modeB.end; i++) if (i % 2 == 0) printf("%d ", i * i);
			break;
		case 'c' :
			for (int i = modeC.start; i <= modeC.end; i++) if (isPrime(i)) printf("%d ", i);
			break;
	}
	return 0;
}

