#include <stdio.h>

void MaxAndMin(int ar[], int size, int**m, int**M) {
	int min =ar[0];
	int max = ar[0];
	for (int i = 0; i < size; i++) {
		if (ar[i] > max) {
			**M = ar[i];
		}
		if (ar[i] < min) {
			**m = ar[i];
		}
	}
}

void main() {
	int *maxPtr;
	int *minPtr;
	int arr[5] = { 1,2,3,4,5 };

	MaxAndMin(arr, sizeof(arr) / sizeof(int), &maxPtr, &minPtr);
	printf("min: %d, max: %d", *minPtr, *maxPtr);
}