#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int cnt = 0, i = 1;
	scanf("%d", &cnt);

	while (i <= cnt) {
		printf("%d ",3*i);
		i++;
	}
}