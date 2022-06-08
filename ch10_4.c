#include <stdio.h>
void main() {
	

	int m1 = 0; //크림빵개수
	int m2 = 0; //새우깡개수
	int m3 = 0; //콜라 개수

	const int mu1 = 500; //크림빵 가격
	const int mu2 = 700; //새우깡 가격
	const int mu3 = 400; //콜라 가격

	int money = 0;
	printf("현재 당신이 소유하고 있는 금액: ");
	scanf_s("%d", &money);

	for (int m1 = 1; m1 <= money / mu1; m1++) {
		for (int m2 = 1; m2 <= money / m2; m2++) {
			for (int m3 = 1; m3 <= money / m3; m3++) {
				if (money == m1 * mu1 + m2 * mu2 + m3 * mu3) {
					printf("크림빵 %d개, 새우깡 %d개, 콜라 %d개\n ", m1, m2, m3);
				}
			}
		}
	}

}