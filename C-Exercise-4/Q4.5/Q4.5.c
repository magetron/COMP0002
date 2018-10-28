#include "stdio.h"
#include "stdlib.h"
#include "string.h"

const int text_width = 40;
const int max_word_length = 128;
const int max_string_length = 65536;

char *create_input(char *text, int length) {
	char *tmp_string = malloc(sizeof(char) * length + 1);
	memcpy(tmp_string, text, sizeof(char) * length);
	char *blank_space = " ";
	strcat(tmp_string, blank_space);
	return tmp_string; 
}

void format_string(char *text, int length) {
	char tmp_word[max_word_length];
	memset(tmp_word, '\0', sizeof(tmp_word));
	for (int i = 0; i < length; i++) printf("%c", text[i]);
	printf("\n");
	int word_point = 0;
	int line_point = 0;
	for (int i = 0; i <= length; i++) {
		if ((text[i] != ' ')) {
			tmp_word[word_point] = text[i];
			word_point ++;
		} else {
			if (word_point + line_point < text_width) {
				for (int j = 0; j < word_point; j++) printf("%c", tmp_word[j]);
				printf(" ");
				line_point += word_point;
			} else {
				printf("\n");
				for (int j = 0; j < word_point; j++) printf("%c", tmp_word[j]);
				printf(" ");
				line_point = word_point;
			}
			memset(tmp_word, '\0', sizeof(tmp_word));
			word_point = 0;
		}
	}
	return;
}

//char str[] = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Fusce lacinia mi sit amet felis. Aliquam viverra, velit vitae tempus viverra, dolor augue vehicula felis, non lobortis urna lectus in metus. Nulla eleifend varius pede. Morbi eleifend malesuada velit. Pellentesque vel mauris imperdiet purus sagittis dictum. Vivamus pede velit, iaculis vitae, elementum quis, rutrum et, nisl. Donec feugiat, arcu in tristique malesuada, risus turpis consequat turpis, quis iaculis enim risus eu libero. Vestibulum ac pede sit amet quam dictum porttitor. Suspendisse tincidunt. Integer elit purus, blandit in, ornare ut, aliquet non, neque. Pellentesque laoreet. In aliquam turpis. Curabitur rhoncus nibh nec nunc. Aenean ut leo.";

char str[max_string_length];

int main () {
	freopen("Q4.5.in", "r", stdin);
	freopen("Q4.5.out", "w", stdout);	
	fgets(str, max_string_length, stdin);
	format_string(create_input(str, strlen(str)), strlen(str));
	fclose(stdin);
	fclose(stdout);
	return 0;
}
