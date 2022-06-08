#include <stdio.h>
#define SIZE 6

void main() {
	int arr[SIZE] = { 1,2,3,4,5,6 };
	int*l;
	int*r;

	l = arr;
	r = arr + SIZE - 1;

	for (int i = 0; i < SIZE / 2; i++) {
		int tmp = 0;
		tmp = *(l+i);
		*(l + i) = *(r - i);
		*(r - i) = tmp;
		/*
		[0 + 0] = [5 - 0]; [0] [5]
		[0 + 1] = [5 - 1]; [1] [4]
		[0 + 2] = [5 - 2]; [2] [3]
		*/
	}

	for (int j = 0; j < SIZE; j++) {
		printf("%d ", arr[j]);
	}
}