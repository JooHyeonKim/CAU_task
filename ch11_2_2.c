#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	char arr[100];
	scanf("%s", arr);
	int len = 0;

	while (arr[len] != '\0') {
		len++;
	}

	for (int i = 0; i < len / 2; i++) {
		char tmp = arr[i];
		arr[i] = arr[len - 1 - i];
		arr[len - 1 - i] = tmp;
	}

	printf("%s", arr);

}