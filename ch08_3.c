#include <stdio.h>

void main() {
	int n = 0;
	scanf_s("%d", &n);

	int num = n / 10;

	switch (num) {
	case 0:
		puts("0 �̻� 10 �̸�");
		break;
	case 1:
		puts("10 �̻� 20 �̸�");
		break;
	case 2:
		puts("20 �̻� 30 �̸�");
		break;
	default:
		puts("30 �̻�");
		break;
	}
	
}