#include <stdio.h>

void gugudan(int n1, int n2) {
	int start, end = 0;
	if (n1 > n2) {
		start = n2;
		end = n1;
	}
	else {
		start = n1;
		end = n2;
	}

	for (int i = start; i <= end; i++) {
		printf("-------%d´Ü-------\n", i);
		for (int j = 1; j <= 9; j++) {
			printf("%d x %d = %d\n", i, j, i*j);
		}
		puts("");
	}

}

void main() {
	int n1, n2 = 0;
	printf("Type two integers.");
	scanf_s("%d %d", &n1, &n2);
	gugudan(n1, n2);

}