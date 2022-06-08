#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int n = 0, i = 0, x=0;
	int sum = 0;
	printf("몇 개의 정수를 입력할 것인가?? > ");
	scanf("%d", &n);

	while (i < n) {
		scanf("%d", &x);
		sum += x;
		i++;
	}
	printf(" avg : %f ", (double)(sum / n));
}