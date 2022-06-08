#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main() {
	int x1 = 0, x2 = 0, y1 = 0, y2 = 0;

	printf("좌 상단의 (x,y) : ");
	scanf("%d %d", &x1, &y1);

	printf("우 하단의 (x,y) : ");
	scanf("%d %d", &x2, &y2);

	int length = x2 - x1;
	int height = y2 - y1;
	printf("두 점이 이루는 직사각형의 넓이는 %d입니다.", length*height);

}