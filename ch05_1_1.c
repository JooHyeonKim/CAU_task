#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int x1 = 0, x2 = 0, y1 = 0, y2 = 0;

	printf("�� ����� (x,y) : ");
	scanf("%d %d", &x1, &y1);

	printf("�� �ϴ��� (x,y) : ");
	scanf("%d %d", &x2, &y2);

	int length = x2 - x1;
	int height = y2 - y1;
	printf("�� ���� �̷�� ���簢���� ���̴� %d�Դϴ�.", length*height);

}