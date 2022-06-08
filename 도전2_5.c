#include <stdio.h>

void BubbleSort(int ary[], int len) {
	int i, j;
	int temp;

	for (int i = 0; i < len - 1; i++) {

	}
}

void main() {
	int arr[4] = { 3,2,4,1 };

	BubbleSort(arr, sizeof(arr) / sizeof(int));
	for (int i = 0; i < 4; i++) {
		printf("%d", arr[i]);
	}

}