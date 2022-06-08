#include <stdio.h>

int AddToTotal(int num) {
	int static total=0; //한번만 초기화, 프로그램 종료할때까지 메모리공간에 남아있음.전역변수의 문제점을 보완하면서 전역변수처럼 쓸 수 있다.(복잡도를 줄여서 안정성 높일 수 있다)
	total+= num;
	return total;
}

void main() {
	int num, i;
	for (i = 0; i < 3; i++) {
		printf("입력%d: ", i + 1);
		scanf_s("%d", &num);
		printf("누적: %d\n", AddToTotal(num));
	}
}