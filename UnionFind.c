#include <stdio.h>


//Union_Find
int getParent(int parent[], int x) {
	if (parent[x] == x)
		return x;
	return parent[x] = getParent(parent, parent[x]);
}

//각 부모 노드를 합칩니다.
void unionParent(int parent[], int a, int b) {
	a = getParent(parent, a);
	b = getParent(parent, b);
	if (a < b)
		parent[b] = a;
	else {
		parent[a] = b;
	}
}

//같은 부모 노드를 가지는지 확인합니다.
//같은 그래프에 속해있는지 확인하는 것과 동일
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

	printf("1과 3는 연결되어있나요? %d\n", findParent(parent, 1, 3));
	printf("3과 8은 연결되어있나요? %d\n", findParent(parent, 3, 8));

}