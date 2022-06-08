#include <stdio.h>

int SquareByValue(int num) {
	return num * num;
}

void SquareByReference(int* num) {
	int n = *num;
	*num= n * n;
}

void main() {
	int square = SquareByValue(3);
	printf("SquareByValue > 3^2= %d\n", square);

	int n = 4;
	SquareByReference(&n);
	printf("n: %d", n);
}