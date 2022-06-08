#include <stdio.h>

void main() {
	int n = 0;
	int k = 0;
	printf("상수 n 입력 : ");
	scanf_s("%d", &n);
	while (n > 1) {
		if (n % 2 == 0) {
			k++;
			n = n / 2;
		}
	}
	printf("공식을 만족하는 k의 최댓값은 : %d", k);
}

//256/2=128 k=1
//128/2=64 k=2
//64/2=32 k=3
//32/2=16 k=4
//16/2=8 k=5
//8/2=4 k=6
//4/2=2 k=7
//2/2=1 k=8
