#include <stdio.h>

void main() {
	int arr[5] = { 0, };
	int len = sizeof(arr) / sizeof(int);
	for (int i = 0; i < len; i++) {
		scanf_s("%d", &arr[i]);
	}

	int max = arr[0];
	int min = arr[0];
	int sum = 0;
	for (int j = 0; j < len; j++) {
		sum += arr[j];
		if (max < arr[j])
			max = arr[j];
		if (min > arr[j])
			min = arr[j];
	}

	printf("�ִ� : %d, �ּڰ� : %d, �Էµ� ������ �� ��: %d\n", max, min, sum);
}