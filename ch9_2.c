#include <stdio.h>

int AddToTotal(int num) {
	int static total=0; //�ѹ��� �ʱ�ȭ, ���α׷� �����Ҷ����� �޸𸮰����� ��������.���������� �������� �����ϸ鼭 ��������ó�� �� �� �ִ�.(���⵵�� �ٿ��� ������ ���� �� �ִ�)
	total+= num;
	return total;
}

void main() {
	int num, i;
	for (i = 0; i < 3; i++) {
		printf("�Է�%d: ", i + 1);
		scanf_s("%d", &num);
		printf("����: %d\n", AddToTotal(num));
	}
}