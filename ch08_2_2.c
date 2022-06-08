#include <stdio.h>

void main() {

	printf("A Z + Z A = 99\n");
	for (int A = 0; A < 10; A++) {
		for (int Z = 0; Z < 10; Z++) {
			int sum = A + Z;
			if (sum== 9) {
				printf("%d%d + %d%d = 99\n", A, Z, Z, A);
			}
		}
	}

}