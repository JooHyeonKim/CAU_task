#include <stdio.h>
void main() {
	

	int m1 = 0; //ũ��������
	int m2 = 0; //���������
	int m3 = 0; //�ݶ� ����

	const int mu1 = 500; //ũ���� ����
	const int mu2 = 700; //����� ����
	const int mu3 = 400; //�ݶ� ����

	int money = 0;
	printf("���� ����� �����ϰ� �ִ� �ݾ�: ");
	scanf_s("%d", &money);

	for (int m1 = 1; m1 <= money / mu1; m1++) {
		for (int m2 = 1; m2 <= money / m2; m2++) {
			for (int m3 = 1; m3 <= money / m3; m3++) {
				if (money == m1 * mu1 + m2 * mu2 + m3 * mu3) {
					printf("ũ���� %d��, ����� %d��, �ݶ� %d��\n ", m1, m2, m3);
				}
			}
		}
	}

}