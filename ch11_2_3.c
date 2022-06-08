#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	char voca[30];
	scanf("%s", voca);
	int len = 0;

	while (voca[len] != '\0') {
		len++;
	}

	char max = voca[0];
	for (int k = 0; k < len; k++) {
		if (max < voca[k]) {
			max = voca[k];
		}
	}

	printf("%c", max);
}