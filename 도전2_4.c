#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

void main() {
	char name[20] = "";
	printf("���ڿ� �Է�: ");
	scanf("%s", name);

	int length = (int)strlen(name);

	for (int i = 0; i < length / 2; i++) {
		if (name[i] != name[length - 1 - i]) {
			printf("ȸ���� �ƴմϴ�.");
			return;
		}
	}
	printf("ȸ���Դϴ�.");

}