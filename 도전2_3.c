#include <stdio.h>
#define SIZE 10

void main() {
	int arr[SIZE];
	int tmp = 0;
	int l = 0;
	int r = SIZE-1;

	puts("총 10개의 숫자 입력");
	while (l<=r) {
		scanf_s("%d", &tmp);
		if (tmp % 2 != 0) {
			arr[l++] = tmp;
			printf("l: %d,  r: %d\n", l,r);
		}
		else {
			arr[r--] = tmp;
			printf("l: %d,  r: %d\n", l, r);
		}
	}
	/*
	l=1, r=10  1
	l=2, r=10  1
	l=2, r=9  4
	l=2, r=8  4
	l=2, r=7  4
	l=2, r=6  4
	l=3, r=6  3
	l=4, r=6  3
	l=4, r=5  2
	l=4, r=4  2
	*/



	printf("배열 요소의 출력: ");
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", arr[i]);
	}
}