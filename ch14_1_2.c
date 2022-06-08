#include <stdio.h>

void Swap3(int*n1, int*n2, int*n3) {
	int tmp1 = *n1;
	int tmp2 = *n2;
	*n1 = *n3;
	*n2 = tmp1;
	*n3 = tmp2;

}

void main() {
	int num1 = 1, num2 = 2, num3 = 3;
	Swap3(&num1, &num2, &num3);
	printf("num1: %d, num2: %d, num3: %d", num1, num2, num3);
}