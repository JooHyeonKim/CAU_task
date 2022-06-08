//#include <stdio.h>
//#define SIZE 5
//
//void main() {
//	int data[SIZE][SIZE];
//
//	puts("점수입력 > ");
//	for (int i = 0; i < 4; i++) {
//		for (int j = 0; j < 4; j++) {
//			scanf_s("%d", &data[i][j]);
//		}
//	}
//
//	for (int j = 0; j < 4; j++) {
//		for (int i = 0; i < 4; j++) {
//			data[j][4]+=data[j][i];
//			data[4][j] += data[i][j];
//		}
//	}
//
//	for (int i = 0; i < SIZE; i++) {
//		for (int j = 0; j < SIZE; j++) {
//			printf("%d ", data[i][j]);
//		}
//		puts("");
//	}
//}