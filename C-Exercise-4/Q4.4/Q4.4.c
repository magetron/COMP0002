#include "stdio.h"
#include "stdlib.h"
#include "string.h"

typedef struct {
	int *data;
	int length;
} array;

const int max_arrays = 1000;

int new_array_1[] = {1, 2, 3, 4, 5};
int new_array_2[] = {2, 3, 4, 5, 6};
int new_array_3[] = {1, 2, 3};

array *pointer[max_arrays];

array *create_array(int *new_array, int len) {
	array *tmp_array = (array *)malloc(sizeof(array));
	tmp_array -> data = new_array; 
	tmp_array -> length = len;
	return tmp_array;
}

void add_array(array *new_array, int pos) {
	pointer[pos] = new_array;
	return;
}

void delete_array(int pos) {
	//free(pointer[pos]);
	free(pointer[pos]);
	return;
}

void print_array(int pos) {
	for (int i = 0; i < pointer[pos] -> length; i++) 
		printf("%d ", pointer[pos] -> data[i]);
	printf("\n");
}

int get_array_value(int pos, int array_pos) {
	return pointer[pos] -> data[array_pos];
}	

void copy_array(int pos, int dest) {
	free(pointer[dest]);
	pointer[dest] = pointer[pos];
	return;
}

int main () {
	add_array(create_array(new_array_1, sizeof(new_array_1) / sizeof(*new_array_1)), 1);
	add_array(create_array(new_array_2, sizeof(new_array_2) / sizeof(*new_array_2)), 2);
	add_array(create_array(new_array_3, sizeof(new_array_3) / sizeof(*new_array_3)), 3);
	print_array(1);
	print_array(2);
	print_array(3);
	delete_array(3);
	add_array(create_array(new_array_2, sizeof(new_array_2) / sizeof(*new_array_2)), 3);
	print_array(3);
	copy_array(1,3);
	print_array(3);
	printf("%d\n",get_array_value(1,1));
	print_array(1);
	return 0;
}

