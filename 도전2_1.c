#include <stdio.h>

void main() {
	puts("�� 10���� ���� �Է�.");

	int arr[10];
	for (int i = 0; i < 10; i++) {
		printf("�Է�: "); scanf_s("%d", &arr[i]);
	}

	printf("Ȧ�� ��� : ");
	for (int i = 0; i < 10; i++) {
		if (arr[i] % 2 == 0)
			printf("%d, ", arr[i]);
	}

	printf("\n¦�� ��� : ");
	for (int i = 0; i < 10; i++) {
		if (arr[i] % 2 != 0)
			printf("%d, ", arr[i]);
	}
}