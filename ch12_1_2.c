#include <stdio.h>

void main() {
	int num1 = 10;
	int num2 = 20;

	int*ptr1 = &num1;
	int*ptr2 = &num2;

	(*ptr1) += 10; //num1=20
	(*ptr2) -= 10; //num2=10

	int* tmp = ptr1;
	ptr1 = ptr2; //ptr1->num2
	ptr2 = tmp; //ptr2->num1

	printf("ptr1이 가리키는 변수에 저장된 값 : %d\n ", *ptr1); //num2:10
	printf("ptr2이 가리키는 변수에 저장된 값 : %d\n ", *ptr2);//num1:20
}