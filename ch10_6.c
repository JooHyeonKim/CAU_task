#include <stdio.h>
void main() {
	int second = 0;
	printf("��(second) �Է�: ");
	scanf_s("%d", &second);
	int h = 0;
	int m = 0;
	int s = 0;

	//1��=60��
	//1�ð��� 60��=60x60=3600

	
	if (second > 3600) {
		h = second / 3600; //printf("h:%d", h);
		second = second % 3600;
	}

	if (second > 60) {
		m = second / 60; //printf("m:%d", m);
		second = second%60;
	}
	s = second;

	printf("[h : %d, m: %d, s: %d]", h, m, s);
	
}