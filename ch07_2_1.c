#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int n = 0, i = 0;
	int sum = 0;
	printf("Type the five integers> ");

	while (i < 5) {
		scanf("%d", &n);
		while (n <= 0) {
			printf("1보다 큰 수 입력 > ");
			scanf("%d", &n);
		}
		sum += n;
		i++;
	}
	printf("sum : %d", sum);
	
}