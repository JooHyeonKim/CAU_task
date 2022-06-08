#include <stdio.h>

void main() {
	puts("총 10개의 숫자 입력.");

	int arr[10];
	for (int i = 0; i < 10; i++) {
		printf("입력: "); scanf_s("%d", &arr[i]);
	}

	printf("홀수 출력 : ");
	for (int i = 0; i < 10; i++) {
		if (arr[i] % 2 == 0)
			printf("%d, ", arr[i]);
	}

	printf("\n짝수 출력 : ");
	for (int i = 0; i < 10; i++) {
		if (arr[i] % 2 != 0)
			printf("%d, ", arr[i]);
	}
}