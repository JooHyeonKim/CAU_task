#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	double n1 = 0.0;
	double n2 = 0.0;

	printf("Type the two numbers. >");
	scanf("%lf %lf", &n1, &n2);

	printf("%f + %f = %f\n", n1, n2, n1 + n2);
	printf("%f - %f = %f\n", n1, n2, n1 - n2);
	printf("%f / %f = %f\n", n1, n2, n1 / n2);
	printf("%f * %f = %f\n", n1, n2, n1 * n2);
}