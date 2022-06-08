#include <stdio.h>

int Euclidean(int a, int b) {
	int r = a % b;
	if (r == 0) {
		return b;
	}
	return Euclidean(b, r);
}

void main() {
	int x = 0, y = 0;
	printf("두 개의 정수 입력 : ");
	scanf_s("%d %d", &x, &y);
	int gcd = Euclidean(x, y);
	printf("두 수의 최대공약수: %d", gcd);
}