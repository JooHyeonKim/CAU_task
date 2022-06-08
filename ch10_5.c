#include <stdio.h>

int IsPrime(int k) {
	if (k <= 1)
		return 0;

	for (int i = 2; i < k; i++) {
		if (k%i == 0) {
			return 0;
		}
	}
	return 1;
}

void main() {
	int cnt = 0;
	int k = 1;
	while (cnt < 10) {
		if (IsPrime(k) == 1) {
			printf("%d ", k);
			cnt++;
		}
		k++;
	}
}