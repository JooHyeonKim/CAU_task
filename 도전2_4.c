#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

void main() {
	char name[20] = "";
	printf("문자열 입력: ");
	scanf("%s", name);

	int length = (int)strlen(name);

	for (int i = 0; i < length / 2; i++) {
		if (name[i] != name[length - 1 - i]) {
			printf("회문이 아닙니다.");
			return;
		}
	}
	printf("회문입니다.");

}