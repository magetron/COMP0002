#include "stdio.h"
#include "string.h"

const int max_string_length = 256;

int strend(const char *s, const char *t) {
	int len = strlen(s);
	int len_end = strlen(t);
	char tmp[max_string_length];
	strncpy(tmp, s + len - len_end, len_end);
	//printf("%s\n", tmp);
	//printf("%s\n", t);
	return !strncmp(tmp, t, len_end);
}

const char *long_string = "asdflkasouq13123";
const char *short_string = "13123";

int main () {
	printf("%d\n",strend(long_string, short_string));
	return 0;
}


