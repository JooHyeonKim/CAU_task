#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int i = 0, n = 0;
	int fact = 1;

	printf("Type the n> "); scanf("%d", &n);
	while (i < n) {
		i++;
		fact *= i;
	}
	printf("n! : %d", fact);
}