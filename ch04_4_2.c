#include <stdio.h>
void main() {
	int n = 3;
	int result=n << 3; //3*(2^3)
	result=result >> 2; //result/(2^2)
	printf("3x8/4 = %d", result);
}