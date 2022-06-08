#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int tot = 0, num = 1;

	while (num != 0) {
		printf("Type the integer( 0 to quit): ");
		scanf("%d", &num);
		tot += num;
	}
	printf("total %d", tot);
}