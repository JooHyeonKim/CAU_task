#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int s=0, e = 0;
	int sum = 0;
	
	do {
		printf("Type two numbers. First num is bigger than second one > ");
		scanf("%d %d", &s, &e);
	} while (s > e);

	for (int i = s; i <= e; i++) {
		printf("%d", i);
		sum += i;
		if (i != e) {
			printf("+");
		}
		else {
			printf("=");
		}
	}
	printf("%d", sum);

}