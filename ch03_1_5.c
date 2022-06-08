#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
void main() {
	int n1 = 0, n2 = 0, n3 = 0;
	scanf("%d %d %d", &n1, &n2, &n3);
	printf("(%d - %d)x(%d + %d)x(%d %% %d) = %d\n", n1, n2,n2, n3, n3,n1, (n1-n2)*(n2 +n3)*(n3 % n1));

}