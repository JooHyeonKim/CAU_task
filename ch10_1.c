#include <stdio.h>
int main() {
	int num = 0;
	printf("10진수 정수 입력 > ");
	scanf_s("%d", &num);
	printf("16진수로 변환 > %x\n", num);
}
