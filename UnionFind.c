#include <stdio.h>


//Union_Find
int getParent(int parent[], int x) {
	if (parent[x] == x)
		return x;
	return parent[x] = getParent(parent, parent[x]);
}

//�� �θ� ��带 ��Ĩ�ϴ�.
void unionParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a < b)
		parent[b] = a;
	else {
		parent[a] = b;
	}
}

//���� �θ� ��带 �������� Ȯ���մϴ�.
//���� �׷����� �����ִ��� Ȯ���ϴ� �Ͱ� ����
int findParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a == b)return 1;
	else return 0;
}

int main(void) {
	int parent[9];
	for (int i = 1; i <= 8; i++) {
		parent[i] = i;
	}

	unionParent(parent, 1, 2);
	unionParent(parent, 2, 3);
	unionParent(parent, 5, 6);
	unionParent(parent, 6, 8);
	unionParent(parent, 1, 8);

	printf("1�� 3�� ����Ǿ��ֳ���? %d\n", findParent(parent, 1, 3));
	printf("3�� 8�� ����Ǿ��ֳ���? %d\n", findParent(parent, 3, 8));

}