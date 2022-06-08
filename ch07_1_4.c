#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int n = 0, i=1;
	printf("¸î ´Ü? > ");
	scanf("%d", &n);

	while (i<=9) {
		printf("%d x %d = %d \n",n,i, n * i);
		i++;
	}
}