#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int n = 0, i = 0, x=0;
	int sum = 0;
	printf("�� ���� ������ �Է��� ���ΰ�?? > ");
	scanf("%d", &n);

	while (i < n) {
		scanf("%d", &x);
		sum += x;
		i++;
	}
	printf(" avg : %f ", (double)(sum / n));
}