#include <stdio.h>

void main() {
	int i = 0;
	int sum = 0;

	do {
		if (i % 2 == 0) {
			sum += i;
		}
		i++;

	} while (i <= 100);

	printf("%d", sum);
}