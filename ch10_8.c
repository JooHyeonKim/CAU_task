#include <stdio.h>

int Square(int n) {
	if (n == 1) {
		return 2;
	}
	return 2 * Square(n - 1);
}

void main() {
	int n = 0;
	printf("���� �Է� : ");
	scanf_s("%d", &n);

	int result = Square(n);
	printf("2�� %d���� %d", n, result);
}

//2^4=16
//2*Square(4)
//2*2*Square(3)
//2*2*2*Square(2)
//2*2*2*2*Square(1)