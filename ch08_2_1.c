#include <stdio.h>

void main() {
	int dan = 2;
	while (dan <= 8) {
		
		printf("-- %d´Ü --\n", dan);
		for (int i = 1; i < 10; i++) {
			printf("%d x %d = %d\n", dan, i, dan*i);
			if (i == dan)
				break;
		}
		dan += 2;
	}
}