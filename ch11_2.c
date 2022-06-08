#include <stdio.h>

void main() {
	char arr[50] = "Good time";
	int len = sizeof(arr) / sizeof(char);

	for (int i = 0; i < len; i++) {
		printf("%c", arr[i]);
	}
}