#include <stdio.h>

void main() {
	int n = 0;
	scanf_s("%d", &n);

	int num = n / 10;

	switch (num) {
	case 0:
		puts("0 이상 10 미만");
		break;
	case 1:
		puts("10 이상 20 미만");
		break;
	case 2:
		puts("20 이상 30 미만");
		break;
	default:
		puts("30 이상");
		break;
	}
	
}