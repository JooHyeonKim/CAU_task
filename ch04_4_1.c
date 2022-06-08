#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int n = 0;
	printf("Type the number > ");
	scanf("%d", &n);
	n = ~n;
	n++;
	printf("change the sign > %d",n);
}