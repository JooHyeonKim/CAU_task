#include <stdio.h>

int main(void) {
	int n = 0;
	scanf_s("%d", &n);
	//n�� 5�� ��
	//

	for (int i = 0; i < n; i++) {//�� �ټ��� ���
		for (int j = 0; j < n-i-1; j++) {
			printf(" ");
		}
		for (int j = 0; j < i+1; j++) {
			printf("*");
		}
		printf("\n");
	}
	return 0;
}