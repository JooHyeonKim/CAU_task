#include <stdio.h>

void main() {
	int n = 0;
	printf("10���� ���� �Է�: ");
	scanf_s("%d", &n);

	int arr[5];
	int i = 0;
	while (n > 1) {
		arr[i] = n % 2;
		i++;
		n=n / 2;
	}
	arr[i++] = n;

	for (int k = 0; k <i; k++) {
		printf("%d ", arr[i-k-1]);
	}
}