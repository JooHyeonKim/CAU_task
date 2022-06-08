#include <stdio.h>
#define SIZE 5

void main() {
	int arr[5] = { 1,2,3,4,5 };
	int*ptr;
	int tot =0;
	ptr = arr+SIZE-1;

	for (int i = 0; i < SIZE; i++) {
		tot += *(ptr);
		ptr--;
	}
	
	printf("total : %d", tot);

}