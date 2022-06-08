#include <stdio.h>

void main() {
	int A[2][4] = { 
	{1,2,3,4},
	{5,6,7,8} };

	int B[4][2];
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 2; j++) {
			B[i][j] = A[j][i];
		}
	}

	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 2; j++) {
			printf("%d ", B[i][j]);
		}
		puts("");
	}
}