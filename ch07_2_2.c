
#include <stdio.h>

void main() {
	int i = 0, k = 0;
	puts("*");
	while (i < 4) {
		for (int j = 0; j <= i; j++) {
			printf("o ");
		}
		puts("*");
		puts("");
		i++;

	}

}